/*
 * protocol.h - Wire protocol constants for the RAPID communication link.
 *
 * Shared between src/main.c (PC) and vitis_workspace/systemControl/main.c (FPGA).
 *
 * Frame format:
 *   [ SOF_BYTE_1 | SOF_BYTE_2 | TYPE (1B) | LEN (1B) | PAYLOAD (LEN B) | CRC8 (1B) ]
 *   CRC8: XOR over [TYPE, LEN, PAYLOAD...]
 *
 * PC → FPGA packet types:
 *   TYPE_END     0x01  LEN 0x00  end of sequence — disables all hardware
 *   TYPE_POINT   0x10  LEN 0x08  r_um (int32 LE) + theta_deg (float32 LE)
 *   TYPE_SPINDLE 0x21  LEN 0x01  payload[0]: 0=off, 1=on
 *   TYPE_STEPPER 0x22  LEN 0x01  payload[0]: 0=off, 1=on
 *   TYPE_LASER   0x23  LEN 0x01  payload[0]: 0=off, 1=on
 *   TYPE_DIR     0x24  LEN 0x01  payload[0]: 0=inward, 1=outward
 *   TYPE_ZERO    0x25  LEN 0x00  pulse zero_req, reset step tracking
 *   TYPE_JOG     0x26  LEN 0x04  int32 LE step count
 *
 * FPGA → PC packet types:
 *   TYPE_ACK     0x81  echoes incoming payload
 *   TYPE_DEBUG   0xF0  ASCII debug string
 */

#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>

/* ---- Start-of-frame bytes ---- */
#define SOF_BYTE_1       0xAA
#define SOF_BYTE_2       0x55

/* ---- PC → FPGA ---- */
#define TYPE_END         0x01
#define TYPE_POINT       0x10
#define TYPE_SPINDLE     0x21
#define TYPE_STEPPER     0x22
#define TYPE_LASER       0x23
#define TYPE_DIR         0x24
#define TYPE_ZERO        0x25
#define TYPE_JOG         0x26

/* ---- FPGA → PC ---- */
#define TYPE_ACK         0x81
#define TYPE_DEBUG       0xF0

/* ---- Payload lengths ---- */
#define POINT_LEN        0x08   /* r_um (int32 LE) + theta_deg (float32 LE) */
#define CTRL_LEN         0x01   /* single on/off byte                       */
#define JOG_LEN          0x04   /* step count (int32 LE)                    */

/* ---- Frame sizes (SOF(2) + TYPE(1) + LEN(1) + PAYLOAD + CRC(1)) ---- */
#define END_FRAME_SIZE   5      /* 0-byte payload */
#define CTRL_FRAME_SIZE  6      /* 1-byte payload */
#define POINT_FRAME_SIZE 13     /* 8-byte payload */
#define JOG_FRAME_SIZE   9      /* 4-byte payload */

/* ---- Receive buffer size ---- */
#define MAX_PAYLOAD      255

#endif /* PROTOCOL_H */
