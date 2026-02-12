#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "inputParser.h"

// packet format:
// SOF (0xAA 0x55)  TYPE  LEN  PAYLOAD (LEN bytes)  CRC8 (XOR over TYPE+LEN+PAYLOAD)
//
// TYPE 0x01, LEN 0x08 payload layout:
//   r_nm       (int32 little-endian)
//   theta_udeg (int32 little-endian)
//
// FPGA may reply with framed messages on the same UART:
//   TYPE 0x81 LEN 0x08 = ACK echo of payload
//   TYPE 0xF0 LEN N    = debug string

// compile with:
// gcc -O2 -Wall -Wextra -o transmission.exe pcCommunication.c inputParser.c -lm

// CRC8 XOR calculation
static uint8_t crc8_xor(const uint8_t *data, size_t len) {
    uint8_t c = 0;
    for (size_t i = 0; i < len; i++) c ^= data[i];
    return c;
}

// pack 32b integer into 4 byte array (little-endian)
static void pack_i32_le(uint8_t out[4], int32_t v) {
    out[0] = (uint8_t)(v & 0xFF);
    out[1] = (uint8_t)((v >> 8) & 0xFF);
    out[2] = (uint8_t)((v >> 16) & 0xFF);
    out[3] = (uint8_t)((v >> 24) & 0xFF);
}

// unpack 4 bytes (little-endian) into int32
static int32_t unpack_i32_le(const uint8_t b[4]) {
    return (int32_t)(
        ((uint32_t)b[0]) |
        ((uint32_t)b[1] << 8) |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

// write to the UART channel at handle h (ensures full buffer is sent)
static int write_all(HANDLE h, const uint8_t *buf, size_t len) {
    size_t sent = 0;
    while (sent < len) {
        DWORD wrote = 0;
        if (!WriteFile(h, buf + sent, (DWORD)(len - sent), &wrote, NULL)) {
            return 0;
        }
        sent += (size_t)wrote;
    }
    return 1;
}

// using windows routines to open UART over COM port
static HANDLE open_serial_rw(const char *com_name, int baud) {
    char path[64];
    snprintf(path, sizeof(path), "\\\\.\\%s", com_name);

    // windows treats COM ports as files
    HANDLE h = CreateFileA(path, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    if (h == INVALID_HANDLE_VALUE) return INVALID_HANDLE_VALUE;

    // configuration
    // windows requires you to read the control state before writing it back
    DCB dcb = {0}; // device control block
    dcb.DCBlength = sizeof(dcb);
    if (!GetCommState(h, &dcb)) { CloseHandle(h); return INVALID_HANDLE_VALUE; } // read

    dcb.BaudRate = baud;
    dcb.ByteSize = 8;
    dcb.Parity   = NOPARITY;
    dcb.StopBits = ONESTOPBIT;

    if (!SetCommState(h, &dcb)) { CloseHandle(h); return INVALID_HANDLE_VALUE; } // write

    // timeouts so reads don't block forever
    COMMTIMEOUTS t = {0};
    t.ReadIntervalTimeout = 50;
    t.ReadTotalTimeoutConstant = 50;
    t.ReadTotalTimeoutMultiplier = 10;
    t.WriteTotalTimeoutConstant = 2000;
    t.WriteTotalTimeoutMultiplier = 10;
    SetCommTimeouts(h, &t);

    // clear buffers
    PurgeComm(h, PURGE_RXCLEAR | PURGE_TXCLEAR);

    return h; // handle for COM port
}

// send a single polar point to FPGA
static int send_polar_point(HANDLE h, double r_nm, double theta_deg) {
    // r in nanometers
    // theta in microdegrees
    int32_t r_i32 = (int32_t)llround(r_nm);
    int32_t t_i32 = (int32_t)llround(theta_deg * 1000000.0);

    uint8_t frame[13]; // SOF(2) + TYPE + LEN + PAYLOAD(8) + CRC
    size_t idx = 0;

    // packing into frame
    frame[idx++] = 0xAA; // SOF
    frame[idx++] = 0x55; // SOF
    frame[idx++] = 0x01; // TYPE (point)
    frame[idx++] = 0x08; // LEN

    pack_i32_le(&frame[idx], r_i32); idx += 4;
    pack_i32_le(&frame[idx], t_i32); idx += 4;

    // CRC over [TYPE][LEN][PAYLOAD...]
    frame[idx++] = crc8_xor(&frame[2], 10); // TYPE(1) + LEN(1) + PAYLOAD(8)

    return write_all(h, frame, sizeof(frame)); // write entire packet
}

typedef struct {
    HANDLE h;
    volatile LONG running;
    volatile LONG ack_count;     // ACK tracking for stop-and-wait
    volatile LONG last_ack_tick; // GetTickCount() at time of last ACK
} ReaderCtx;

// wait until ack_count reaches target, or timeout (ms) expires
static int wait_for_ack(volatile LONG *ack_count, LONG target, DWORD timeout_ms) {
    DWORD start = GetTickCount();

    for (;;) {
        LONG cur = InterlockedCompareExchange((volatile LONG *)ack_count, 0, 0);
        if (cur >= target) return 1;

        if ((GetTickCount() - start) > timeout_ms) return 0;

        Sleep(1); // tiny yield to avoid burning CPU
    }
}

static DWORD WINAPI reader_thread(LPVOID param) {
    ReaderCtx *ctx = (ReaderCtx *)param;

    // simple byte-at-a-time state machine for framed UART data
    enum { S_AA, S_55, S_TYPE, S_LEN, S_PAYLOAD, S_CRC } st = S_AA;

    uint8_t type = 0, len = 0, crc = 0;
    uint8_t payload[255];
    uint8_t pay_i = 0;

    for (;;) {
        if (InterlockedCompareExchange(&ctx->running, 1, 1) == 0) break;

        uint8_t b;
        DWORD got = 0;

        if (!ReadFile(ctx->h, &b, 1, &got, NULL) || got != 1) {
            Sleep(1);
            continue;
        }

        switch (st) {
            case S_AA:
                if (b == 0xAA) st = S_55;
                break;

            case S_55:
                if (b == 0x55) st = S_TYPE;
                else st = S_AA;
                break;

            case S_TYPE:
                type = b;
                st = S_LEN;
                break;

            case S_LEN:
                len = b;
                pay_i = 0;

                if (len == 0) {
                    st = S_CRC;
                }
                else if ((size_t)len > sizeof(payload)) {
                    st = S_AA;
                }
                else {
                    st = S_PAYLOAD;
                }
                break;

            case S_PAYLOAD:
                payload[pay_i++] = b;
                if (pay_i >= len) st = S_CRC;
                break;

            case S_CRC: {
                crc = b;

                // checksum buffer = [type][len][payload...]
                uint8_t chk[2 + 255];
                chk[0] = type;
                chk[1] = len;
                for (uint8_t i = 0; i < len; i++) chk[2 + i] = payload[i];

                uint8_t expect = crc8_xor(chk, (size_t)(2 + len));
                if (expect != crc) {
                    fprintf(stderr, "[RX] CRC mismatch (type=0x%02X, len=%u)\n", type, len);
                    st = S_AA;
                    break;
                }

                // handle a couple known response types
                if (type == 0xF0) {
                    // debug text from FPGA
                    char msg[256];
                    uint8_t n = (len < 255) ? len : 255;

                    for (uint8_t i = 0; i < n; i++) msg[i] = (char)payload[i];
                    msg[n] = 0;

                    printf("[FPGA] %s\n", msg);
                }
                else if (type == 0x81 && len == 0x08) {
                    // ACK echo of point payload
                    int32_t r_nm = unpack_i32_le(&payload[0]);
                    int32_t theta_udeg = unpack_i32_le(&payload[4]);

                    printf("[ACK] r=%ld nm, theta=%ld udeg\n", (long)r_nm, (long)theta_udeg);

                    // update tracking for stop-and-wait + idle timeouts
                    InterlockedIncrement(&ctx->ack_count);
                    InterlockedExchange(&ctx->last_ack_tick, (LONG)GetTickCount());
                }
                else {
                    printf("[RX] type=0x%02X len=%u\n", type, len);
                }

                st = S_AA;
            } break;

            default:
                st = S_AA;
                break;
        }
    }

    return 0;
}

int main(int argc, char **argv) {
    const char *port = (argc >= 2) ? argv[1] : "COM25";
    const char *file = (argc >= 3) ? argv[2] : "input.gds";

    size_t count = 0;

    Coordinate *coords = getCoordinates(file, &count);
    if (!coords || count == 0) {
        fprintf(stderr, "Failed to parse coordinates from %s\n", file);
        return 1;
    }

    PolarPoint *polar = convertToPolar(coords, count);
    free(coords);

    if (!polar) {
        fprintf(stderr, "Failed to convert to polar\n");
        return 1;
    }

    HANDLE h = open_serial_rw(port, 115200);
    if (h == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Failed to open %s\n", port);
        free(polar);
        return 1;
    }

    // start reader thread
    ReaderCtx ctx;
    ctx.h = h;
    ctx.running = 1;
    ctx.ack_count = 0;
    ctx.last_ack_tick = (LONG)GetTickCount();

    HANDLE th = CreateThread(NULL, 0, reader_thread, &ctx, 0, NULL);
    if (!th) {
        fprintf(stderr, "Failed to create reader thread\n");
        CloseHandle(h);
        free(polar);
        return 1;
    }

    printf("Sending %zu polar points over %s...\n", count, port);

    for (size_t i = 0; i < count; i++) {
        LONG target_ack = (LONG)(i + 1);

        if (!send_polar_point(h, polar[i].r, polar[i].theta)) {
            fprintf(stderr, "UART send failed at i=%zu\n", i);

            InterlockedExchange(&ctx.running, 0);
            WaitForSingleObject(th, INFINITE);
            CloseHandle(th);

            CloseHandle(h);
            free(polar);
            return 1;
        }

        // wait for FPGA to ACK this point before sending next
        if (!wait_for_ack(&ctx.ack_count, target_ack, 2000)) {
            fprintf(stderr, "Timeout waiting for ACK %ld (i=%zu)\n", (long)target_ack, i);

            InterlockedExchange(&ctx.running, 0);
            WaitForSingleObject(th, INFINITE);
            CloseHandle(th);

            CloseHandle(h);
            free(polar);
            return 1;
        }
    }

    printf("Done sending points\n");
    printf("ACKs received: %ld\n", (long)ctx.ack_count);

    // stop reader and clean up
    InterlockedExchange(&ctx.running, 0);
    WaitForSingleObject(th, INFINITE);
    CloseHandle(th);

    CloseHandle(h);
    free(polar);
    return 0;
}