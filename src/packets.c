/*
 * packets.c - PC-side packet constructors for the RAPID wire protocol.
 */

#include "packets.h"
#include "protocol.h"
#include "serial.h"

/* 0-byte payload packet (TYPE_END, TYPE_ZERO). */
static int send_pulse_packet(HANDLE h, uint8_t type) {
    uint8_t frame[END_FRAME_SIZE];
    frame[0] = SOF_BYTE_1;
    frame[1] = SOF_BYTE_2;
    frame[2] = type;
    frame[3] = 0x00;
    frame[4] = type;   /* CRC = XOR(type, len=0) = type */
    return write_all(h, frame, END_FRAME_SIZE);
}

int send_end_packet(HANDLE h)     { return send_pulse_packet(h, TYPE_END);     }
int send_zero_packet(HANDLE h)    { return send_pulse_packet(h, TYPE_ZERO);    }
int send_rpm_req_packet(HANDLE h) { return send_pulse_packet(h, TYPE_RPM_REQ); }

int send_polar_point(HANDLE h, int32_t r_um, float theta_deg) {
    uint8_t frame[POINT_FRAME_SIZE];
    size_t  idx = 0;
    frame[idx++] = SOF_BYTE_1;
    frame[idx++] = SOF_BYTE_2;
    frame[idx++] = TYPE_POINT;
    frame[idx++] = POINT_LEN;
    pack_i32_le(&frame[idx], r_um);      idx += 4;
    pack_f32_le(&frame[idx], theta_deg); idx += 4;
    frame[idx]   = crc8_xor(&frame[2], 2 + POINT_LEN);
    return write_all(h, frame, POINT_FRAME_SIZE);
}

int send_ctrl_packet(HANDLE h, uint8_t type, uint8_t value) {
    uint8_t frame[CTRL_FRAME_SIZE];
    frame[0] = SOF_BYTE_1;
    frame[1] = SOF_BYTE_2;
    frame[2] = type;
    frame[3] = CTRL_LEN;
    frame[4] = value;
    frame[5] = crc8_xor(&frame[2], 3);
    return write_all(h, frame, CTRL_FRAME_SIZE);
}

int send_vc1_dc_packet(HANDLE h, uint8_t duty_pct) {
    return send_ctrl_packet(h, TYPE_VC1_DC, duty_pct);
}

int send_jog_packet(HANDLE h, int32_t steps) {
    uint8_t frame[JOG_FRAME_SIZE];
    frame[0] = SOF_BYTE_1;
    frame[1] = SOF_BYTE_2;
    frame[2] = TYPE_JOG;
    frame[3] = JOG_LEN;
    pack_i32_le(&frame[4], steps);
    frame[8] = crc8_xor(&frame[2], 2 + JOG_LEN);
    return write_all(h, frame, JOG_FRAME_SIZE);
}
