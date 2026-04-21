/*
 * packets.h - PC-side packet constructors for the RAPID wire protocol.
 *
 * Each function builds a framed packet and writes it to the serial handle.
 * Returns 1 on success, 0 on write failure.
 *
 * Depends on: protocol.h, serial.h
 */

#pragma once

#include <windows.h>
#include <stdint.h>

int send_polar_point(HANDLE h, int32_t r_um, float theta_deg);
int send_end_packet(HANDLE h);
int send_ctrl_packet(HANDLE h, uint8_t type, uint8_t value);
int send_jog_packet(HANDLE h, int32_t steps);
int send_zero_packet(HANDLE h);
int send_rpm_req_packet(HANDLE h);
int send_vc1_dc_packet(HANDLE h, uint8_t duty_pct);
