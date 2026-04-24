# CLAUDE.md — RAPID Project Context

**RAPID** is a capstone design project (Jack Parrack, Laurel Leuwerke, Matt Bracker, Chance Besancenez).
It streams GDS2 lithography patterns from a PC to an Arty Z7-20 FPGA over UART for motor-driven stage control (polar XY laser lithography).

---

## System Architecture

```
input.gds → inputParser → RAPID.exe → UART → systemControl.c
             (XY→polar)   (frame+send)             (recv+ACK+motor control)
                               ↑                         │
                            gui.py ←── ACK log ──────────┘
                          (live XY scatter)

systemControl.c ── AXI GPIO (PS→PL) ──→ stepperDriver.vhd
                                     └──→ spindle.vhd (BLDC)
                                     └──→ LaserEn (GPIO pin P18)
```

`systemControl.c` handles both packet reception and motor/laser control in a single bare-metal app.
`RAPID.exe` is the single persistent PC-side process: it manages the serial link, streams GDS patterns, and accepts manual control commands — all through a stdin/stdout text protocol with `gui.py`.

---

## Repository Layout

| Path | Description |
|------|-------------|
| `src/main.c` | PC-side persistent serial manager — compiled into `build/RAPID.exe` |
| `src/inputParser.c/h` | GDS2 text parser: XY coords → polar (r in µm, theta in degrees) |
| `src/serial.c/h` | Shared Win32 serial utility functions — `open_serial`, `write_all`, pack/unpack helpers, CRC8 |
| `src/packets.c/h` | PC-side packet constructors — `send_polar_point`, `send_end_packet`, `send_ctrl_packet`, `send_jog_packet`, `send_zero_packet` |
| `src/protocol.h` | Shared wire protocol constants (TYPE_*, SOF bytes, lengths, frame sizes) |
| `src/gui.py` | PySide6 GUI — drives RAPID.exe via QProcess stdin/stdout |
| `vitis_workspace/systemControl/main.c` | **Active** FPGA app — packet receiver + motor/laser control |
| `vitis_workspace/systemControl/protocol.h` | Shared wire protocol constants (mirrors src/protocol.h) |
| `vitis_workspace/fpgaCommunication/fpgaCommunication.c` | Archived reference only |
| `hardware/RAPID.xpr` | Vivado project file |
| `hardware/RAPID.srcs/sources_1/new/stepperDriver.vhd` | **Active** stepper FSM VHDL |
| `hardware/RAPID.srcs/sources_1/new/spindle.vhd` | **Active** BLDC 6-step commutation VHDL |
| `hardware/RAPID.srcs/sources_1/new/VoiceCoil.vhd` | **Active** dual voice-coil PWM driver VHDL |
| `hardware/RAPID.srcs/constrs_1/new/RAPID.xdc` | Pin constraints (Arty Z7-20) |
| `hardware/ip_repo/src/stepperDriver.vhd` | Old simple 2-phase stepper (archived, not in block design) |
| `hardware/ip_repo/src/BLDC.vhd` | Old abstract BLDC (archived, not in block design) |
| `Makefile` | PC-side build: `make`, `make gui`, `make clean` |
| `requirements.txt` | Python deps: PySide6, pyqtgraph |
| `docs/README.md` | User-facing project documentation |
| `docs/CLAUDE.md` | This file — full technical context |

---

## Hardware Platform

- **Board:** Digilent Arty Z7-20
- **Device:** xc7z020clg400-1
- **Toolchain:** Vivado 2025.1 + Vitis 2025.1
- **PS Clock:** FCLK_CLK0 = 100 MHz (AXI interconnect)
- **PL Clock:** 125 MHz from clk_wiz (feeds stepperDriver and Spindle)
- **UART:** PS UART0, 115200 8N1, over USB-JTAG/UART

---

## Packet Wire Format

Identical on PC (`main.c`) and FPGA (`systemControl/main.c`):

```
[ 0xAA | 0x55 | TYPE (1B) | LEN (1B) | PAYLOAD (LEN bytes) | CRC8 (1B) ]
```

| Direction | TYPE | LEN | Payload | Purpose |
|-----------|------|-----|---------|---------|
| PC → FPGA | `0x01` | 0 | (none) | End of sequence — disables hardware, firmware stays running |
| PC → FPGA | `0x10` | 8 | `r_um` (int32 LE, µm) + `theta_deg` (float32 LE, degrees) | Polar point |
| PC → FPGA | `0x21` | 1 | `0x00`=off, `0x01`=on | Spindle on/off |
| PC → FPGA | `0x22` | 1 | `0x00`=off, `0x01`=on | Stepper on/off |
| PC → FPGA | `0x23` | 1 | `0x00`=off, `0x01`=on | Laser on/off |
| PC → FPGA | `0x24` | 1 | `0x00`=inward, `0x01`=outward | Stepper direction |
| PC → FPGA | `0x25` | 0 | (none) | Zero request — pulses `zero_req` for 100 ms, resets `current_step=0` |
| PC → FPGA | `0x26` | 4 | int32 LE step count | Jog — move N steps in current direction |
| PC → FPGA | `0x27` | 0 | (none) | RPM request — firmware reads `axi_gpio_1` and responds with `TYPE_RPM` |
| PC → FPGA | `0x28` | 1 | uint8 duty cycle (0–100) | VC1 duty cycle — firmware writes value to `axi_gpio_1` ch2 → VoiceCoil.vhd VC1_DC |
| FPGA → PC | `0x81` | 8 or 0 | Echo of received payload | ACK for all packet types |
| FPGA → PC | `0x82` | 2 | uint16 LE computed RPM | RPM response — `RPM = 10000 / ticks` (6 hall pulses/rev, 1 kHz tick clock) |
| FPGA → PC | `0xF0` | N | ASCII string | Debug/status |

**CRC8:** XOR over `[TYPE, LEN, PAYLOAD...]`.

**Flow control:** Stop-and-wait. Each packet waits up to **ACK_TIMEOUT = 5000 ms** for ACK.

**TYPE_END behaviour:** Firmware disables laser, spindle, and stepper, resets `first_point=1`, sends ACK, then **continues the receive loop** — it does not exit. Multiple pattern runs and manual commands are possible within one FPGA session.

**Frame sizes:** 5 bytes (end/zero), 13 bytes (point), 6 bytes (spindle/stepper/laser/dir), 9 bytes (jog).

---

## GPIO Control Word — Current Layout (27 bits, AXI GPIO Ch 1 output)

Defined and written in `vitis_workspace/systemControl/main.c`:

| Bits | `#define` | Description |
|------|-----------|-------------|
| `[0]` | `BIT_SPINDLE_EN` | Spindle enable (0=off, 1=on) |
| `[1]` | `BIT_STEPPER_DIR` | Stepper direction (0=inward/home, 1=outward) |
| `[2]` | `BIT_STEPPER_EN` | Stepper enable (0=off, 1=on) |
| `[3]` | `BIT_ZERO_REQ` | Zero/home request — momentary high pulse (100 ms) |
| `[24:4]` | `BIT_NUM_STEP` (21 bits) | Number of steps to move (0–2,097,151) |
| `[25]` | `BIT_STEP_GO` | Step go — momentary high pulse (100 ms) triggers move |
| `[26]` | `BIT_LASER_EN` | Laser enable (0=off, 1=on) |

`GPIO_MASK = 0x07FFFFFF` (27 bits).

### Channel 2 (input)
`XGpio_SetDataDirection(&gpio, 2, 0xFFFFFFFF)` — all inputs, reserved for future readback (e.g. `step_total_out` from stepper VHDL).

### `axi_gpio_1` — RPM input + VC1 duty cycle output (`gpio_rpm` instance, `XPAR_AXI_GPIO_1_BASEADDR = 0x41210000`)
- **Ch1 (input):** Connected to `Spindle_0/RPM_Out`. `RPM_Out` holds the count of 1 kHz ticks between consecutive hall sensor rising edges. Firmware computes `RPM = 10000 / ticks` (6 hall pulses per revolution).
- **Ch2 (output):** 7-bit value written to `VoiceCoil_0/VC1_DC`. Firmware boots with this set to `60` (60% duty cycle). Updated via `TYPE_VC1_DC` packets.

> **SDT init note:** In Vitis 2025.1 SDT flow `XGpio_Initialize` takes a **BaseAddress**, not a DeviceId.
> Passing `0` works only by accident (SDT `LookupConfig` returns the first table entry when `BaseAddress == 0`).
> Always use `XPAR_AXI_GPIO_x_BASEADDR` macros.

### Firmware Sequence

On startup, `systemControl/main.c` enables the stepper, then enables the spindle and waits 2 s (`usleep(2000000u)`) for the rotor to reach speed (covers the 1.5 s VHDL alignment phase plus margin for the first valid RPM pulse). After spindle windup it enters the packet receive loop — no zeroing delay on boot (stepper is pre-zeroed by the VHDL ZEROING state at power-on). It processes packets as they arrive:

| Packet | Action |
|--------|--------|
| `TYPE_END (0x01)` | Disable laser/spindle/stepper, reset `first_point=1`, ACK, **continue loop** |
| `TYPE_POINT (0x10)` | Compute `target_step`, move stepper, then call `wait_for_theta(theta_deg)` to stall until disc reaches target angle, gate laser off during long waits, turn laser on at target, ACK |
| `TYPE_SPINDLE (0x21)` | Set/clear `BIT_SPINDLE_EN`, write GPIO, call `theta_init()` on enable (arms time-integration theta tracking), ACK |
| `TYPE_STEPPER (0x22)` | Set/clear `BIT_STEPPER_EN`, write GPIO, ACK |
| `TYPE_LASER (0x23)` | Set/clear `BIT_LASER_EN`, write GPIO, ACK |
| `TYPE_DIR (0x24)` | Set/clear `BIT_STEPPER_DIR`, write GPIO, ACK |
| `TYPE_ZERO (0x25)` | **If stepper disabled:** log message, ACK, skip. Else: pulse `BIT_ZERO_REQ` high 100 ms, clear, reset `current_step=0`, ACK |
| `TYPE_JOG (0x26)` | **If stepper disabled:** log message, ACK, skip. Else: move N steps (int32 LE payload) in current direction, ACK |
| `TYPE_RPM_REQ (0x27)` | Read `axi_gpio_1` ch1 bits[15:0] (1 kHz tick count between hall pulses), compute `RPM = 10000 / ticks`, send `TYPE_RPM (0x82)` + debug_printf |
| `TYPE_VC1_DC (0x28)` | Write payload byte (0–100) to `axi_gpio_1` ch2 → sets `VC1_DC` on `VoiceCoil.vhd`, ACK |

**Spindle windup:** The spindle is enabled at startup before the first packet arrives. The firmware waits `usleep(2000000u)` (2 s) for the rotor to reach speed before entering the packet receive loop. The laser is not enabled until after the first point's stepper move completes (`first_point` flag).

**Step-count mapping (fixed physical scale):**
```
target_step = clamp( round( r_um / 30000 × 250 ), 0, 250 )
```
250 steps = 30 mm (full disc range). `r_um` is the radius in micrometres. After homing, `current_step = 0`.

**Move wait time** (after 100 ms `step_go` pulse):
```
usleep( 1200 + delta × 2000 + 10000 )   /* µs: wakeup + running (500 Hz step rate) + margin */
```
`run_freq = 250000` in VHDL → 125 MHz ÷ 250000 = 500 Hz step rate → 2000 µs per step.

**Key constants:**
```c
#define MAX_STEPS        250
#define DISC_RADIUS_UM   30000
#define RPM_PRINT_EVERY  1      /* log RPM every N TYPE_POINT packets (1 = every point) */
/* No ZERO_WAIT_US — zeroing delay removed; stepper is pre-zeroed externally */
```

---

## PC-side `main.c` — stdin/stdout Protocol

`RAPID.exe <port>` opens the serial link on startup and reads text commands from stdin line-by-line:

| Command | Action |
|---------|--------|
| `POINT <r_um> <theta>` | Send one `TYPE_POINT` packet, wait for ACK |
| `STREAM <filepath>` | Enable stepper → zero sled → enable spindle → wait 1 s → stream all points with stop-and-wait ACK → auto-send END |
| `MSTREAM <count> <filepath>` | Same as STREAM but repeats the pattern `count` times without stopping the spindle between repetitions |
| `END` | Send `TYPE_END` packet (disables FPGA hardware, firmware stays running) |
| `EXIT` | Always send `TYPE_END` (regardless of stream state), close serial port, process exits |
| `SPINDLE 0\|1` | Send `TYPE_SPINDLE` packet |
| `STEPPER 0\|1` | Send `TYPE_STEPPER` packet |
| `LASER 0\|1` | Send `TYPE_LASER` packet |
| `DIR 0\|1` | Send `TYPE_DIR` packet |
| `ZERO` | Send `TYPE_ZERO` packet |
| `JOG <n>` | Send `TYPE_JOG` packet (move N steps in current direction) |
| `RPM` | Send `TYPE_RPM_REQ` — FPGA replies with `TYPE_RPM`; reader thread prints `[RPM] X RPM` (no ACK) |
| `VC1 <0-100>` | Send `TYPE_VC1_DC` packet (set voice coil 1 duty cycle %) |

**stdout lines** (parsed by `gui.py`):
- `[ACK] r=<r> um, theta=<t> deg` — point acknowledged (reader thread, POINT ACKs only)
- `[FPGA] <msg>` — TYPE_DEBUG string from FPGA (reader thread)
- `[RX] CRC mismatch` — CRC error
- `[PROGRESS] <n>/<total>` — stream progress (after each ACKed point)
- `[RPM] <n> RPM` — RPM response from FPGA (fire-and-forget; auto-sent after each POINT during stream)
- `[DONE] N points sent — FPGA hardware disabled` — stream completed cleanly (TYPE_END auto-sent)
- `[STATUS] ...` — connection / informational messages
- `[ERROR] ...` — command or I/O errors

**Thread safety:** `CRITICAL_SECTION stdout_cs` in `AppState` and a `PRINT()` macro prevent interleaving between the main thread and the ACK reader thread.

---

## VHDL Modules

### `stepperDriver.vhd` — `hardware/RAPID.srcs/sources_1/new/`

Clock: 125 MHz. Drives a DRV8834 stepper driver IC.

**Ports:**
| Port | Direction | Description |
|------|-----------|-------------|
| `clk` | in | 125 MHz system clock |
| `dir` | in | Desired direction from PS |
| `dir_out` | out | Direction signal to DRV8834 |
| `en` | in | Enable from PS |
| `pwm_out_step` | out | Step pulse to DRV8834 STEP pin |
| `prox_in` | in | Proximity switch (active-high) |
| `zero_req` | in | Momentary high to trigger re-home |
| `en_out` | out | DRV8834 SLEEP pin (high = awake) |
| `num_steps` | in | 21-bit step count from GPIO [24:4] |
| `step_go` | in | Rising edge triggers a move |
| `step_total_out` | out | 21-bit absolute position counter |

**FSM States:**
```
ZEROING → (prox_stable) → IDLE ──────────────────────────────────────────────┐
              │                 └→ (step_go↑, num_steps>0, en=1) → WAKEUP → RUNNING → DONE
              │                                                                          │
              └──────────────────── (zero_req↑ from any state) ──────────────────────┘
```

| State | Behaviour |
|-------|-----------|
| `ZEROING` | Drives direction='0' (towards home) at zero_freq (500 Hz pulses). Resets `step_total=0` on `prox_stable`. |
| `IDLE` | Motor sleep (`en_out='0'`). Watches for `step_go` rising edge or `zero_req`. |
| `WAKEUP` | `en_out='1'`, waits 150,000 cycles (1.2 ms) — DRV8834 wakeup delay from sleep. |
| `RUNNING` | Outputs `run_clk` as step pulses. Counts down `steps_remaining`. Increments/decrements `step_total`. |
| `DONE` | Motor sleep. Waits for next `step_go` or `zero_req`. |

**Key constants:**
- `run_freq = 250000` → step pulse period = 125 MHz ÷ 250000 = **500 Hz** (2000 µs/step)
- `zero_freq = 250000` → homing pulse rate = 125 MHz ÷ 250000 = **500 Hz**
- Proximity debounce: 1,250,000 cycles = 10 ms
- Wakeup hold: 150,000 cycles = 1.2 ms
- 2FF synchroniser on `prox_in` for metastability protection (`ASYNC_REG` attribute set)

---

### `spindle.vhd` — `hardware/RAPID.srcs/sources_1/new/`

BLDC 6-step commutation (fixed speed/direction). Drives DRV8323 3-phase gate driver. Clock: 125 MHz. Theta (angular position) is tracked in firmware via time-integration of RPM — see `theta_init()` / `wait_for_theta()` in `systemControl/main.c`.

**Ports:** `clk`, `en`, `en_spindle` (out), `RPM_Out` (out, 16-bit), `RPM_Pulse_In` (in), `INHA/INLA/INHB/INLB/INHC/INLC` (out).

The spindle runs **fixed speed, fixed direction** — control is purely on/off via `en`.

**Hardcoded values:**
- `INHC <= '0'` — phase C high-side permanently low (direction fixed)
- `INLC <= '1'` — brake always released
- `en_spindle <= en` — DRV8323 enable follows the `en` input
- `count_max = 12,500,000` → 10 Hz commutation
- PWM at ~10 Hz, 1% duty cycle (`pwm_counter` period 12,500,000, high for 125,000 counts)

**RPM measurement:**
- Internal 1 kHz tick clock (`RPM_CLK = 125000` divider from 125 MHz)
- `RPM_CLK_CNT` counts ticks between rising edges of `RPM_Pulse_In` (hall sensor)
- `RPM_Out` (16-bit) holds the captured period in ticks; connected to `axi_gpio_1/gpio_io_i`
- Firmware formula: `RPM = 10000 / RPM_Out` (6 hall pulses per revolution)

**Startup alignment:** On `en` rising edge, all phases held high for 187,500,000 cycles (1.5 s) for rotor alignment before commutation starts. `start_check` resets to '1' when `en` goes low.

**6-step commutation sequence (one direction):**

| Step | INLA | INHB | INLB |
|------|------|------|------|
| 1 | 1 | 1 | 0 |
| 2 | 1 | 0 | 0 |
| 3 | 1 | 0 | 1 |
| 4 | 0 | 0 | 1 |
| 5 | 0 | 1 | 1 |
| 6 | 0 | 1 | 0 |

`INHA` carries the PWM signal. Sequence repeats steps 1–6 continuously while `en='1'`.

---

---

### `VoiceCoil.vhd` — `hardware/RAPID.srcs/sources_1/new/`

Dual-channel PWM generator for two voice coil actuators. Clock: 125 MHz.

**Ports:**
| Port | Direction | Description |
|------|-----------|-------------|
| `clk` | in | 125 MHz system clock |
| `VC1_DC` | in | 7-bit duty cycle select for voice coil 1 (0–100; each step ≈ 1%, 39 counts/step) |
| `PWM1` | out | PWM output for voice coil 1 |
| `PWM1r` | out | Mirror of PWM1 (both inputs of the H-bridge receive the same signal) |
| `PWM2` | out | PWM output for voice coil 2 |
| `PWM2r` | out | Mirror of PWM2 |

**Operation:**
- PWM frequency: 125 MHz ÷ 3907 cycles ≈ **32 kHz**
- **VC1 (vertical / Z-axis):** Duty cycle is software-controlled via the `VC1_DC` port (driven from `axi_gpio_1` ch2). Each integer step maps to 39 counts (≈1% duty cycle). Firmware boots at 60%. Controlled at runtime via `TYPE_VC1_DC` packets.
- **VC2 (horizontal / Y-axis):** `DC_cnt_2` is **hardcoded to 0%** — voice coil 2 is not yet driven. The `VC2_DC` port and its case statement are fully commented out for future use.

**Pin assignments (RAPID.xdc):**
| Signal | Pin |
|--------|-----|
| `PWM1_0` | U5 |
| `PWM1r_0` | V5 |
| `PWM2_0` | V6 |
| `PWM2r_0` | U7 |

All voice coil outputs are LVCMOS33, PULLDOWN.

---

### Old/Archived VHDL — `hardware/ip_repo/src/`

- `BLDC.vhd` — abstract BLDC with PhA/PhB/PhC 2-bit encoding. Not in block design.
- `stepperDriver.vhd` — simple 2-phase full-step FSM, no PWM, no homing. Not in block design.

---

## Pin Constraints (RAPID.xdc)

All I/O banks run at 3.3 V (LVCMOS33). `clk`, `en`, `dir` are internal PS/PL signals — not top-level ports.

| Signal | Pin | Function |
|--------|-----|----------|
| `En_Spindle` | R16 | DRV8323 enable output |
| `INHA_0` | T14 | Phase A high-side |
| `INLA_0` | U12 | Phase A low-side |
| `INHB_0` | U13 | Phase B high-side |
| `INLB_0` | V13 | Phase B low-side |
| `INHC_0` | V15 | Phase C high-side |
| `INLC_0` | T15 | Phase C low-side |
| `dir_out_0` | V18 | Stepper direction |
| `pwm_out_step_0` | T16 | Stepper step pulse |
| `en_out_0` | V17 | Stepper enable (DRV8834 SLEEP) |
| `prox_in_0` | R17 | Proximity switch input (PULLDOWN) |
| `LaserEn[0]` | P18 | Laser enable output (PULLDOWN) |
| `RPM_Pulse_In_0` | U17 | Hall sensor input (spindle RPM measurement) |
| `PWM1_0` | U5 | Voice coil 1 PWM output (PULLDOWN) |
| `PWM1r_0` | V5 | Voice coil 1 PWM mirror output (PULLDOWN) |
| `PWM2_0` | V6 | Voice coil 2 PWM output (PULLDOWN) |
| `PWM2r_0` | U7 | Voice coil 2 PWM mirror output (PULLDOWN) |

---

## PC-side Build

```bash
make            # builds build/RAPID.exe
make gui        # launches src/gui.py (uses venv if present)
make clean      # removes build/
```

**Toolchain:** MinGW-w64 / MSYS2 UCRT64 gcc, `-O2 -Wall -Wextra -std=c11 -lm`.

**Sources compiled into RAPID.exe:** `src/main.c` + `src/inputParser.c` + `src/serial.c` + `src/packets.c`.

---

## GDS2 Input Format

The `input.gds` text format expected by `inputParser.c`:

```
XY <x0> : <y0>
<x1> : <y1>
...
ENDEL
```

Units: **micrometres** (integers). The parser strips the leading `XY`, reads `int : int` pairs until `ENDEL` (or EOF). Dynamic array with initial capacity 8, doubles on overflow.

`convertToPolar()` converts to:
- `r` = `sqrt(x²+y²)` (double, µm)
- `theta` = `atan2(y,x)` in degrees, normalized to [0, 360)

Note: uses `PI = 3.14159` (not `M_PI`).

---

## GUI (`src/gui.py`)

- **Framework:** PySide6 + pyqtgraph
- Single `QProcess` running `RAPID.exe <port>` (merged stdout+stderr)
- Commands sent to `RAPID.exe` via `process.write()`; replies parsed from stdout line-by-line

### Top bar
EXE path field + Port field + **Connect** button + **END** button + **EXIT** button + status label.
- **Connect:** starts `RAPID.exe <port>`
- **END:** sends `END\n` — disables FPGA hardware, process stays connected; also resets spindle/stepper/laser toggle state in the GUI
- **EXIT:** sends `END\n` then `EXIT\n` — shuts down all hardware and kills RAPID.exe

`_set_connected(False)` is idempotent (guarded by checking the status label) so the disconnect log line only appears once even when `finished` and `disconnect` both fire.

### Pattern Stream tab
GDS file field + **Browse** button (file picker) + **Preview** button + **Stream** button + repeat count spinbox (x1–x999) + ACK/CRC counters + progress label + pyqtgraph scatter plot + **Clear Plot** button.

- **Browse:** opens a file dialog to select a GDS file.
- **Preview:** parses the selected GDS file and renders the raw XY coordinates on the scatter plot without connecting to hardware. Also draws a reference circle at the maximum radius.
- **Stream:** sends `MSTREAM <n> <filepath>` (where `n` is the repeat count). The spindle keeps running continuously across repetitions so theta integration is uninterrupted.

### Manual Control tab

**Hardware Controls group:**
- Spindle ON/OFF toggle
- Stepper ON/OFF toggle
- Laser ON/OFF toggle
- **Zero** button (pulses `zero_req`) — **ignored by FPGA if stepper is disabled**

**Stepper Jog group:**
- Steps QSpinBox (4–250)
- Direction toggle (Inward / Outward)
- **Jog** button — sends `DIR` then `JOG <steps>` — **ignored by FPGA if stepper is disabled**

**Send Single Point group:**
- r_um QSpinBox (0–30000 µm)
- theta QDoubleSpinBox (0–360°)
- **Move** button

**Voice Coil Control group:**
- VC1 duty cycle QSpinBox (0–100%)
- **Set VC1** button — sends `VC1 <duty>` → `TYPE_VC1_DC` packet

### Output log
Shared `QPlainTextEdit` (fixed height 180 px) below tabs. Receives all stdout from RAPID.exe.

### stdout parsing regexes
- `ACK_RE` → `\[ACK\] r=(\S+) um, theta=(\S+) deg` — updates scatter plot + ACK counter
- `CRC_RE` → `\[RX\] CRC mismatch` — increments CRC error counter
- `PROGRESS_RE` → `\[PROGRESS\] (\d+)/(\d+)` — updates progress label
- `RPM_RE` → `\[RPM\] (\d+) RPM` — appends to RPM time-series plot + RPM log (RPM Monitor tab)

Lines matching `[FPGA] RPM:` are suppressed from the shared log (the `[RPM]` line from the reader thread is shown instead).

---

## Known Issues / Active Development Notes

1. **Theta tracking implemented (time-integration):** `systemControl/main.c` uses `theta_init()` / `wait_for_theta()` to stall each point until the disc reaches the target angle. `theta_init()` snapshots RPM (from `axi_gpio_1`) and a Zynq global-timer timestamp; subsequent calls compute disc angle as `(elapsed_us % rev_us) / rev_us * 360`. Accuracy is ~1°/rev at 1% RPM error — adequate for current patterns. The laser is gated off between points when the remaining arc exceeds `LASER_OFF_GRACE_US` (50 ms) to avoid unintended exposure during long waits.