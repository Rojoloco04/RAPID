#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "inputParser.h"

// packet format:
// SOF (0xAA 0x55)  TYPE  LEN   r_nm(int32 LE)   theta_udeg(int32 LE)   CRC8

// compile with:
// gcc -O2 -Wall -Wextra -o uartTX.exe uartTX.c inputParser.c -lm

// CRC8 XOR calculation
static uint8_t crc8(const uint8_t *data, size_t len) {
    uint8_t c = 0;
    for (size_t i = 0; i < len; i++) c ^= data[i];
    return c;
}

// pack 32b integer into 4 byte array
static void pack_i32(uint8_t out[4], int32_t v) {
    out[0] = (uint8_t)(v & 0xFF);
    out[1] = (uint8_t)((v >> 8) & 0xFF);
    out[2] = (uint8_t)((v >> 16) & 0xFF);
    out[3] = (uint8_t)((v >> 24) & 0xFF);
}

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

static HANDLE open_serial(const char *com_name, int baud) {
    // Use \\.\COM10 format to support COM10+
    char path[64];
    snprintf(path, sizeof(path), "\\\\.\\%s", com_name);

    HANDLE h = CreateFileA(path,
                           GENERIC_WRITE, 0, NULL,
                           OPEN_EXISTING, 0, NULL);
    if (h == INVALID_HANDLE_VALUE) return INVALID_HANDLE_VALUE;

    // Configure
    DCB dcb = {0};
    dcb.DCBlength = sizeof(dcb);
    if (!GetCommState(h, &dcb)) { CloseHandle(h); return INVALID_HANDLE_VALUE; }

    dcb.BaudRate = baud;
    dcb.ByteSize = 8;
    dcb.Parity   = NOPARITY;
    dcb.StopBits = ONESTOPBIT;

    if (!SetCommState(h, &dcb)) { CloseHandle(h); return INVALID_HANDLE_VALUE; }

    // Optional: timeouts (non-blocky)
    COMMTIMEOUTS t = {0};
    t.WriteTotalTimeoutConstant = 2000;
    t.WriteTotalTimeoutMultiplier = 10;
    SetCommTimeouts(h, &t);

    return h;
}

// ---------- send one polar point ----------
static int send_polar_point(HANDLE h, double r_nm, double theta_deg) {
    // Convert to fixed-point ints
    int32_t r_i32 = (int32_t)llround(r_nm);
    int32_t t_i32 = (int32_t)llround(theta_deg * 1000000.0);

    uint8_t frame[13];
    size_t idx = 0;

    frame[idx++] = 0xAA;
    frame[idx++] = 0x55;
    frame[idx++] = 0x01; // TYPE
    frame[idx++] = 0x08; // LEN

    pack_i32(&frame[idx], r_i32); idx += 4;
    pack_i32(&frame[idx], t_i32); idx += 4;

    frame[idx++] = crc8(&frame[2], 1 + 1 + 8); // TYPE+LEN+payload

    return write_all(h, frame, sizeof(frame));
}

int main(int argc, char **argv) {
    const char *port = (argc >= 2) ? argv[1] : "COM25";   // change default as needed
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

    HANDLE h = open_serial(port, 115200);
    if (h == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Failed to open %s\n", port);
        free(polar);
        return 1;
    }

    printf("Sending %zu polar points over %s...\n", count, port);

    for (size_t i = 0; i < count; i++) {
        if (!send_polar_point(h, polar[i].r, polar[i].theta)) {
            fprintf(stderr, "UART send failed at i=%zu\n", i);
            CloseHandle(h);
            free(polar);
            return 1;
        }
    }

    printf("Done.\n");
    CloseHandle(h);
    free(polar);
    return 0;
}
