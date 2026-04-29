/*
 * serial.c - Shared Win32 serial port utilities for the RAPID PC tools.
 *
 * See serial.h for the public API.
 */

#include "serial.h"

#include <string.h>   /* memcpy */
#include <stdio.h>    /* snprintf */

/* Serial port */

HANDLE open_serial(const char *com_name, int baud) {
    char path[64];
    snprintf(path, sizeof(path), "\\\\.\\%s", com_name);

    HANDLE h = CreateFileA(
        path, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    if (h == INVALID_HANDLE_VALUE)
        return INVALID_HANDLE_VALUE;

    /* configure 8N1 at the requested baud rate */
    DCB dcb = {0};
    dcb.DCBlength = sizeof(dcb);
    if (!GetCommState(h, &dcb))         { CloseHandle(h); return INVALID_HANDLE_VALUE; }
    dcb.BaudRate = baud;
    dcb.ByteSize = 8;
    dcb.Parity   = NOPARITY;
    dcb.StopBits = ONESTOPBIT;
    if (!SetCommState(h, &dcb))         { CloseHandle(h); return INVALID_HANDLE_VALUE; }

    /*
     * Timeouts: ReadIntervalTimeout = MAXDWORD with both multiplier and
     * constant at 0 gives "return immediately with whatever is in the
     * driver buffer" — the fastest non-blocking read on Windows.
     * Callers that need blocking reads should override after calling this.
     */
    COMMTIMEOUTS t = {0};
    t.ReadIntervalTimeout         = MAXDWORD;
    t.ReadTotalTimeoutConstant    = 0;
    t.ReadTotalTimeoutMultiplier  = 0;
    t.WriteTotalTimeoutConstant   = 2000;
    t.WriteTotalTimeoutMultiplier = 10;
    SetCommTimeouts(h, &t);

    PurgeComm(h, PURGE_RXCLEAR | PURGE_TXCLEAR);
    return h;
}

int write_all(HANDLE h, const uint8_t *buf, size_t len) {
    size_t sent = 0;
    while (sent < len) {
        DWORD wrote = 0;
        if (!WriteFile(h, buf + sent, (DWORD)(len - sent), &wrote, NULL))
            return 0;
        sent += (size_t)wrote;
    }
    return 1;
}

/* Packet helpers */

uint8_t crc8_xor(const uint8_t *data, size_t len) {
    uint8_t c = 0;
    for (size_t i = 0; i < len; i++)
        c ^= data[i];
    return c;
}

void pack_i32_le(uint8_t out[4], int32_t v) {
    out[0] = (uint8_t)(v);
    out[1] = (uint8_t)(v >> 8);
    out[2] = (uint8_t)(v >> 16);
    out[3] = (uint8_t)(v >> 24);
}

int32_t unpack_i32_le(const uint8_t b[4]) {
    return (int32_t)(
        ((uint32_t)b[0])       |
        ((uint32_t)b[1] << 8)  |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

void pack_f32_le(uint8_t out[4], float v) {
    uint32_t bits;
    memcpy(&bits, &v, 4);
    out[0] = (uint8_t)(bits);
    out[1] = (uint8_t)(bits >> 8);
    out[2] = (uint8_t)(bits >> 16);
    out[3] = (uint8_t)(bits >> 24);
}

float unpack_f32_le(const uint8_t b[4]) {
    uint32_t bits = ((uint32_t)b[0])       |
                    ((uint32_t)b[1] << 8)  |
                    ((uint32_t)b[2] << 16) |
                    ((uint32_t)b[3] << 24);
    float v;
    memcpy(&v, &bits, 4);
    return v;
}
