/*
 * serial.h - Shared Win32 serial port utilities for the RAPID PC tools.
 *
 * Included by main.c.  Provides:
 *   - open_serial()        open and configure a COM port (8N1, non-blocking reads)
 *   - write_all()          reliably write a full buffer via WriteFile
 *   - crc8_xor()           XOR-based CRC-8 used in the packet framing protocol
 *   - pack_i32_le()        pack int32  → 4 little-endian bytes
 *   - pack_f32_le()        pack float  → 4 little-endian bytes (IEEE 754)
 *   - unpack_i32_le()      4 little-endian bytes → int32
 *   - unpack_f32_le()      4 little-endian bytes → float (IEEE 754)
 */

#pragma once

#include <windows.h>
#include <stdint.h>
#include <stdlib.h>

/* ------------------------------------------------------------------ */
/*  Serial port                                                        */
/* ------------------------------------------------------------------ */

/*
 * open_serial - open COM port <com_name> at <baud> baud, 8N1.
 *
 * Read timeouts are set to "return immediately with whatever is in the
 * driver buffer" so callers can poll without blocking.  Write timeout
 * is 2 s (constant) + 10 ms/byte.
 *
 * Returns a valid HANDLE on success, INVALID_HANDLE_VALUE on failure.
 */
HANDLE open_serial(const char *com_name, int baud);

/*
 * write_all - write exactly <len> bytes from <buf> to <h>.
 * Returns 1 on success, 0 if WriteFile fails.
 */
int write_all(HANDLE h, const uint8_t *buf, size_t len);

/* ------------------------------------------------------------------ */
/*  Packet helpers                                                     */
/* ------------------------------------------------------------------ */

/* XOR-based CRC-8 over a byte buffer. */
uint8_t crc8_xor(const uint8_t *data, size_t len);

/* Pack/unpack little-endian 32-bit values. */
void    pack_i32_le(uint8_t out[4], int32_t v);
int32_t unpack_i32_le(const uint8_t b[4]);
void    pack_f32_le(uint8_t out[4], float v);
float   unpack_f32_le(const uint8_t b[4]);
