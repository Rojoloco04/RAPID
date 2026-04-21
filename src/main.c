/*
 * main.c - Unified PC-side controller for the RAPID system.
 *
 * Replaces pcCommunication.c and manualControl.c with a single persistent
 * process.  Opens a COM port once at startup, keeps a framed-packet reader
 * thread running continuously, and accepts text commands on stdin so the
 * GUI can drive both manual single-point moves and full GDS pattern streams
 * through the same connection.
 *
 * Usage:
 *   RAPID.exe <port>         e.g. RAPID.exe COM25
 *
 * Stdin command protocol (one command per line):
 *   POINT <r_um_int> <theta_float>   send one TYPE_POINT, wait for ACK
 *   STREAM <filepath>                parse GDS file, stream all points, auto-send END
 *   END                              send TYPE_END (disables FPGA hardware)
 *   EXIT                             send TYPE_END if mid-stream, then exit
 *   SPINDLE 0|1                      send TYPE_SPINDLE (spindle off/on)
 *   STEPPER 0|1                      send TYPE_STEPPER (stepper off/on)
 *   LASER 0|1                        send TYPE_LASER (laser off/on)
 *   DIR 0|1                          send TYPE_DIR (0=inward, 1=outward)
 *   ZERO                             send TYPE_ZERO (pulse zero_req, reset step tracking)
 *   JOG <n>                          send TYPE_JOG (move N steps in current direction)
 *   VC1 <0-100>                      set voice coil 1 duty cycle (%)
 *
 * Stdout output:
 *   [STATUS] ...                 connection / progress messages
 *   [ACK] r=X um, theta=Y.YY deg acknowledged point (from reader thread)
 *   [FPGA] ...                   FPGA debug string   (from reader thread)
 *   [PROGRESS] i/N               after each ACK during STREAM
 *   [DONE] N points sent         STREAM completed cleanly
 *   [RX] CRC mismatch            framing error       (from reader thread)
 *   [ERROR] ...                  command / I/O errors
 *
 * Wire protocol: see protocol.h
 *
 * Build (MinGW / MSYS2 UCRT64):
 *   gcc -O2 -Wall -Wextra -std=c11 \
 *       -o RAPID.exe main.c inputParser.c serial.c packets.c -lm
 */

#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "inputParser.h"
#include "serial.h"
#include "protocol.h"
#include "packets.h"

/* ------------------------------------------------------------------ */
/*  Constants                                                          */
/* ------------------------------------------------------------------ */

#define BAUD_RATE      115200
#define RX_BUF_SIZE    256
#define ACK_TIMEOUT    5000      /* ms — generous for stepper moves  */

/* ------------------------------------------------------------------ */
/*  Shared state                                                       */
/* ------------------------------------------------------------------ */

/*
 * ReaderCtx — shared between main thread and background serial reader.
 * ack_count and running use Interlocked ops; ack_event is auto-reset so
 * WaitForSingleObject consumes exactly one signal per ACK.
 */
typedef struct {
    HANDLE        h;
    volatile LONG running;
    volatile LONG ack_count;
    HANDLE        ack_event;
} ReaderCtx;

/*
 * AppState — top-level state for the command loop.
 * rx must remain first (its address is passed to CreateThread).
 * stdout_cs serialises printf across the main and reader threads.
 */
typedef struct {
    ReaderCtx         rx;
    HANDLE            thread;
    volatile LONG     stream_active;
    CRITICAL_SECTION  stdout_cs;
} AppState;

/* Convenience macro: lock stdout_cs, print, flush, unlock. */
#define PRINT(app, ...) do { \
    EnterCriticalSection(&(app)->stdout_cs); \
    printf(__VA_ARGS__); \
    fflush(stdout); \
    LeaveCriticalSection(&(app)->stdout_cs); \
} while (0)

/* ------------------------------------------------------------------ */
/*  ACK wait                                                           */
/* ------------------------------------------------------------------ */

static int wait_for_ack(ReaderCtx *ctx, LONG target, DWORD timeout_ms) {
    DWORD deadline = GetTickCount() + timeout_ms;
    for (;;) {
        if (InterlockedCompareExchange(&ctx->ack_count, 0, 0) >= target)
            return 1;
        DWORD remaining = deadline - GetTickCount();
        if ((int)remaining <= 0)
            return 0;
        WaitForSingleObject(ctx->ack_event, remaining);
    }
}

/* Atomically snapshot the next expected ACK target. Must be called
 * before the send so the count is captured before the ACK can arrive. */
static LONG next_target(AppState *app) {
    return InterlockedCompareExchange(&app->rx.ack_count, 0, 0) + 1;
}

/* Check send result then wait for ACK; print errors and return success. */
static int send_wait(AppState *app, LONG target, int sent, const char *name) {
    if (!sent) { PRINT(app, "[ERROR] Serial write failed (%s)\n", name); return 0; }
    if (!wait_for_ack(&app->rx, target, ACK_TIMEOUT)) {
        PRINT(app, "[ERROR] Timeout waiting for %s ACK\n", name); return 0;
    }
    return 1;
}

/* ------------------------------------------------------------------ */
/*  Reader thread — framed-packet state machine                        */
/* ------------------------------------------------------------------ */

enum rx_state { S_SOF1, S_SOF2, S_TYPE, S_LEN, S_PAYLOAD, S_CRC };

static DWORD WINAPI reader_thread(LPVOID param) {
    AppState *app = (AppState *)param;
    ReaderCtx *ctx = &app->rx;

    enum rx_state st = S_SOF1;
    uint8_t type = 0, len = 0, pay_i = 0;
    uint8_t payload[255];
    uint8_t rxbuf[RX_BUF_SIZE];

    while (InterlockedCompareExchange(&ctx->running, 1, 1)) {
        DWORD got = 0;
        if (!ReadFile(ctx->h, rxbuf, sizeof(rxbuf), &got, NULL) || got == 0) {
            Sleep(1);
            continue;
        }

        for (DWORD bi = 0; bi < got; bi++) {
            uint8_t b = rxbuf[bi];
            switch (st) {
            case S_SOF1:
                if (b == SOF_BYTE_1) st = S_SOF2;
                break;
            case S_SOF2:
                st = (b == SOF_BYTE_2) ? S_TYPE : S_SOF1;
                break;
            case S_TYPE:
                type = b; st = S_LEN;
                break;
            case S_LEN:
                len = b; pay_i = 0;
                st = (len == 0) ? S_CRC : S_PAYLOAD;
                break;
            case S_PAYLOAD:
                payload[pay_i++] = b;
                if (pay_i >= len) st = S_CRC;
                break;
            case S_CRC: {
                uint8_t chk[2 + 255];
                chk[0] = type; chk[1] = len;
                for (uint8_t i = 0; i < len; i++) chk[2 + i] = payload[i];
                if (crc8_xor(chk, 2 + len) != b) {
                    PRINT(app, "[RX] CRC mismatch (type=0x%02X len=%u)\n", type, len);
                    st = S_SOF1; break;
                }
                if (type == TYPE_DEBUG) {
                    char msg[256];
                    uint8_t n = (len < 255) ? len : 254;
                    for (uint8_t i = 0; i < n; i++) msg[i] = (char)payload[i];
                    msg[n] = '\0';
                    PRINT(app, "[FPGA] %s\n", msg);
                } else if (type == TYPE_ACK) {
                    if (len == POINT_LEN) {
                        int32_t r_um    = unpack_i32_le(&payload[0]);
                        float theta_deg = unpack_f32_le(&payload[4]);
                        PRINT(app, "[ACK] r=%ld um, theta=%.2f deg\n",
                              (long)r_um, (double)theta_deg);
                    }
                    InterlockedIncrement(&ctx->ack_count);
                    SetEvent(ctx->ack_event);
                } else if (type == TYPE_RPM) {
                    if (len >= 2) {
                        uint16_t rpm = (uint16_t)payload[0] | ((uint16_t)payload[1] << 8);
                        PRINT(app, "[RPM] %u RPM\n", (unsigned)rpm);
                    }
                } else {
                    PRINT(app, "[RX] type=0x%02X len=%u\n", type, len);
                }
                st = S_SOF1;
            } break;
            default: st = S_SOF1; break;
            }
        }
    }
    return 0;
}

/* ------------------------------------------------------------------ */
/*  Command handlers                                                   */
/* ------------------------------------------------------------------ */

static void cmd_point(AppState *app, const char *args) {
    long  r_um_long;
    float theta;
    if (sscanf(args, "%ld %f", &r_um_long, &theta) != 2) {
        PRINT(app, "[ERROR] POINT syntax: POINT <r_um_int> <theta_float>\n"); return;
    }
    LONG t = next_target(app);
    send_wait(app, t, send_polar_point(app->rx.h, (int32_t)r_um_long, theta), "POINT");
    /* [ACK] line is printed by the reader thread */
}

static void cmd_ctrl(AppState *app, uint8_t type, uint8_t value, const char *name) {
    LONG t = next_target(app);
    send_wait(app, t, send_ctrl_packet(app->rx.h, type, value), name);
}

static void cmd_jog(AppState *app, int32_t steps) {
    LONG t = next_target(app);
    send_wait(app, t, send_jog_packet(app->rx.h, steps), "JOG");
}

static void cmd_zero(AppState *app) {
    LONG t = next_target(app);
    send_wait(app, t, send_zero_packet(app->rx.h), "ZERO");
}

static void cmd_rpm(AppState *app) {
    /* TYPE_RPM_REQ has no ACK — the FPGA replies with TYPE_RPM which the
     * reader thread prints as "[RPM] X RPM". */
    if (!send_rpm_req_packet(app->rx.h))
        PRINT(app, "[ERROR] Serial write failed (RPM_REQ)\n");
}

static void cmd_vc1(AppState *app, const char *args) {
    long dc = atol(args);
    if (dc < 0 || dc > 100) {
        PRINT(app, "[ERROR] VC1 duty cycle must be 0-100\n");
        return;
    }
    LONG t = next_target(app);
    send_wait(app, t, send_vc1_dc_packet(app->rx.h, (uint8_t)dc), "VC1");
}

static void cmd_end(AppState *app) {
    LONG t = next_target(app);
    if (send_wait(app, t, send_end_packet(app->rx.h), "END"))
        PRINT(app, "[STATUS] END acknowledged — FPGA hardware disabled\n");
}

static void cmd_stream(AppState *app, const char *filepath) {
    size_t count = 0;
    Coordinate *coords = getCoordinates(filepath, &count);
    if (!coords || count == 0) {
        PRINT(app, "[ERROR] Failed to parse GDS file: %s\n", filepath);
        return;
    }
    PolarPoint *polar = convertToPolar(coords, count);
    free(coords);
    if (!polar) {
        PRINT(app, "[ERROR] Failed to convert to polar\n"); return;
    }

    PRINT(app, "[STATUS] Streaming %zu points from %s\n", count, filepath);

    /* Re-enable stepper and spindle in case a previous TYPE_END disabled them. */
    LONG t_st = next_target(app);
    if (!send_wait(app, t_st, send_ctrl_packet(app->rx.h, TYPE_STEPPER, 1), "STEPPER"))
        { free(polar); return; }
    /* Zero the sled so position tracking is always correct, even on reconnect. */
    LONG t_z = next_target(app);
    if (!send_wait(app, t_z, send_zero_packet(app->rx.h), "ZERO"))
        { free(polar); return; }
    LONG t_sp = next_target(app);
    if (!send_wait(app, t_sp, send_ctrl_packet(app->rx.h, TYPE_SPINDLE, 1), "SPINDLE"))
        { free(polar); return; }
    PRINT(app, "[STATUS] Motors enabled, sled zeroed — waiting 1 s for spindle windup\n");
    Sleep(1000);

    InterlockedExchange(&app->stream_active, 1);

    int aborted = 0;
    for (size_t i = 0; i < count; i++) {

        LONG target = InterlockedCompareExchange(&app->rx.ack_count, 0, 0) + 1;
        if (!send_polar_point(app->rx.h, (int32_t)llround(polar[i].r), (float)polar[i].theta)) {
            PRINT(app, "[ERROR] Serial write failed at point %zu\n", i);
            aborted = 1; break;
        }
        if (!wait_for_ack(&app->rx, target, ACK_TIMEOUT)) {
            PRINT(app, "[ERROR] ACK timeout at point %zu/%zu\n", i, count);
            aborted = 1; break;
        }
        PRINT(app, "[PROGRESS] %zu/%zu\n", i + 1, count);
        /* Fire-and-forget RPM request after each point; reader thread prints [RPM] */
        send_rpm_req_packet(app->rx.h);
    }

    free(polar);
    InterlockedExchange(&app->stream_active, 0);

    if (!aborted) {
        /* Auto-send TYPE_END after a complete stream */
        LONG target = InterlockedCompareExchange(&app->rx.ack_count, 0, 0) + 1;
        if (send_end_packet(app->rx.h) && wait_for_ack(&app->rx, target, ACK_TIMEOUT)) {
            PRINT(app, "[DONE] %zu points sent — FPGA hardware disabled\n", count);
        } else {
            PRINT(app, "[ERROR] END packet failed after stream\n");
        }
    }
}

/* ------------------------------------------------------------------ */
/*  Command loop                                                       */
/* ------------------------------------------------------------------ */

static void run_command_loop(AppState *app) {
    char line[512];
    while (fgets(line, sizeof(line), stdin)) {
        size_t len = strlen(line);
        while (len > 0 && (line[len-1] == '\n' || line[len-1] == '\r'))
            line[--len] = '\0';
        if (len == 0) continue;

        if (strncmp(line, "POINT ", 6) == 0) {
            cmd_point(app, line + 6);
        } else if (strncmp(line, "STREAM ", 7) == 0) {
            cmd_stream(app, line + 7);
        } else if (strcmp(line, "END") == 0) {
            cmd_end(app);
        } else if (strncmp(line, "SPINDLE ", 8) == 0) {
            cmd_ctrl(app, TYPE_SPINDLE, (line[8] == '1') ? 1 : 0, "SPINDLE");
        } else if (strncmp(line, "STEPPER ", 8) == 0) {
            cmd_ctrl(app, TYPE_STEPPER, (line[8] == '1') ? 1 : 0, "STEPPER");
        } else if (strncmp(line, "LASER ", 6) == 0) {
            cmd_ctrl(app, TYPE_LASER,   (line[6] == '1') ? 1 : 0, "LASER");
        } else if (strncmp(line, "DIR ", 4) == 0) {
            cmd_ctrl(app, TYPE_DIR,     (line[4] == '1') ? 1 : 0, "DIR");
        } else if (strncmp(line, "JOG ", 4) == 0) {
            cmd_jog(app, (int32_t)atol(line + 4));
        } else if (strcmp(line, "ZERO") == 0) {
            cmd_zero(app);
        } else if (strcmp(line, "RPM") == 0) {
            cmd_rpm(app);
        } else if (strncmp(line, "VC1 ", 4) == 0) {
            cmd_vc1(app, line + 4);
        } else if (strcmp(line, "EXIT") == 0) {
            cmd_end(app);
            break;
        } else {
            PRINT(app, "[ERROR] Unknown command: %s\n", line);
        }
    }
}

/* ------------------------------------------------------------------ */
/*  Entry point                                                        */
/* ------------------------------------------------------------------ */

int main(int argc, char **argv) {
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);

    if (argc < 2) {
        fprintf(stderr, "Usage: main.exe <COMport>\n");
        return 1;
    }
    const char *port_name = argv[1];

    AppState app;
    memset(&app, 0, sizeof(app));
    InitializeCriticalSection(&app.stdout_cs);

    app.rx.h = open_serial(port_name, BAUD_RATE);
    if (app.rx.h == INVALID_HANDLE_VALUE) {
        printf("[ERROR] Failed to open %s (error %lu)\n", port_name, GetLastError());
        fflush(stdout);
        DeleteCriticalSection(&app.stdout_cs);
        return 1;
    }

    app.rx.running   = 1;
    app.rx.ack_count = 0;
    app.rx.ack_event = CreateEvent(NULL, FALSE, FALSE, NULL); /* auto-reset */
    if (!app.rx.ack_event) {
        printf("[ERROR] Failed to create ACK event\n"); fflush(stdout);
        CloseHandle(app.rx.h);
        DeleteCriticalSection(&app.stdout_cs);
        return 1;
    }

    app.thread = CreateThread(NULL, 0, reader_thread, &app, 0, NULL);
    if (!app.thread) {
        printf("[ERROR] Failed to create reader thread\n"); fflush(stdout);
        CloseHandle(app.rx.ack_event);
        CloseHandle(app.rx.h);
        DeleteCriticalSection(&app.stdout_cs);
        return 1;
    }

    PRINT(&app, "[STATUS] Connected to %s — ready\n", port_name);

    run_command_loop(&app);

    /* graceful shutdown */
    InterlockedExchange(&app.rx.running, 0);
    SetEvent(app.rx.ack_event);   /* unblock reader if stuck in WaitForSingleObject */
    WaitForSingleObject(app.thread, 3000);
    CloseHandle(app.thread);
    CloseHandle(app.rx.ack_event);
    CloseHandle(app.rx.h);
    DeleteCriticalSection(&app.stdout_cs);

    printf("[STATUS] Exited cleanly\n"); fflush(stdout);
    return 0;
}
