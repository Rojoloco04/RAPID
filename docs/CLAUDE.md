# CLAUDE.md — RAPID Project Context

**RAPID** is a capstone design project (Jack Parrack, Laurel Leuwerke, Matt Bracker, Chance Besancenez).
It streams GDS2 lithography patterns from a PC to an Arty Z7-20 FPGA over UART for motor-driven stage control (polar XY laser lithography).

---

## System Architecture

```
input.gds → inputParser → pcCommunication → UART → systemControl.c
             (XY→polar)    (frame+send)               (recv+ACK+motor control)
                                ↑                           │
                             gui.py ←── ACK log ────────────┘
                          (live XY scatter)

systemControl.c ── AXI GPIO (PS→PL) ──→ stepperDriver.vhd
                                     └──→ spindle.vhd (BLDC)
                                     └──→ LaserEn (GPIO pin P18)
```

`systemControl.c` now handles both packet reception and motor/laser control in a single bare-metal app.

---

## Repository Layout

| Path | Description |
|------|-------------|
| `src/pcCommunication.c` | PC-side UART sender — compiled into `build/RAPID.exe` |
| `src/inputParser.c/h` | GDS2 text parser: XY coords → polar (r in µm, theta in degrees) |
| `src/platform.c/h` | Thin Xilinx cache init wrappers (shared by FPGA apps) |
| `src/gui.py` | PySide6 GUI — launches RAPID.exe, parses stdout, plots ACK'd points |
| `vitis_workspace/testControl/OLD_systemControl.c` | Old motor/laser controller |
| `vitis_workspace/systemControl/systemControl.c` | **Active** FPGA app — packet receiver + motor/laser control |
| `hardware/RAPID.xpr` | Vivado project file |
| `hardware/RAPID.srcs/sources_1/new/stepperDriver.vhd` | **Active** stepper FSM VHDL |
| `hardware/RAPID.srcs/sources_1/new/spindle.vhd` | **Active** BLDC 6-step commutation VHDL |
| `hardware/RAPID.srcs/constrs_1/new/RAPID.xdc` | Pin constraints (Arty Z7-20) |
| `hardware/ip_repo/src/stepperDriver.vhd` | Old simple 2-phase stepper (archived, not in block design) |
| `hardware/ip_repo/src/BLDC.vhd` | Old abstract BLDC (archived, not in block design) |
| `Makefile` | PC-side build: `make`, `make run`, `make gui`, `make clean` |
| `pointGenerator.py` | Test utility — generates N points on a circle of radius R |
| `requirements.txt` | Python deps: PySide6, pyqtgraph, numpy, colorama |
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

Identical on both PC (`pcCommunication.c`) and FPGA (`systemControl.c`):

```
[ 0xAA | 0x55 | TYPE (1B) | LEN (1B) | PAYLOAD (LEN bytes) | CRC8 (1B) ]
```

| Direction | TYPE | LEN | Payload | Purpose |
|-----------|------|-----|---------|---------|
| PC → FPGA | `0x01` | 8 | `r_um` (int32 LE, micrometres) + `theta_deg` (float32 LE, degrees) | Polar point |
| PC → FPGA | `0x03` | 0 | (none) | End of sequence |
| FPGA → PC | `0x81` | 8 or 0 | Echo of received payload | ACK for all packet types |
| FPGA → PC | `0xF0` | N | ASCII string | Debug/status |

**CRC8:** XOR over `[TYPE, LEN, PAYLOAD...]`. Simple accumulating XOR, not polynomial.

**Flow control:** Stop-and-wait.
- PC waits **`FPGA_INIT_WAIT_MS`** (32 s) at startup for FPGA stepper zeroing to complete.
- PC sends each `TYPE_POINT`, waits up to **2000 ms** for ACK (FPGA ACKs after move completes).
- PC sends `TYPE_END`, waits up to **2000 ms** for ACK.

**Frame sizes:** 13 bytes (point), 5 bytes (end).

---

## GPIO Control Word — Current Layout (27 bits, AXI GPIO Ch 1 output)

Defined and written in `vitis_workspace/systemControl/systemControl.c`:

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

### systemControl.c Automated Sequence

`systemControl.c` no longer has an interactive command loop. It runs the following automated sequence on startup:

| Phase | Code action |
|-------|------------|
| **1 — Zeroing** | Write `stepper_en=1` → VHDL enters ZEROING state, sled moves to inner edge; `usleep(ZERO_WAIT_US)` (default 30 s) waits for proximity switch to trigger |
| **2 — Spindle** | Set `spindle_en=1` |
| **3 — Point loop** | For each `TYPE_POINT`: compute `target_step`, update `dir`+`num_steps`, pulse `step_go`, wait, turn laser on after first move, send ACK |
| **4 — End** | On `TYPE_END`: clear `laser_en`, `spindle_en`, `stepper_en`, send ACK, return |

**Step-count mapping (fixed physical scale):**
```
target_step = clamp( round( r_um / 33000 × 8500 ), 0, 8500 )
```
8500 steps = 33 mm (full CD disc range, inner edge → outer edge). `r_um` is the input radius in micrometres. After homing, `current_step = 0`.

**Move wait time** (after 100 ms `step_go` pulse):
```
usleep( 1200 + delta × 125 + 10000 )   /* µs: wakeup + running + margin */
```

**Key constants:**
```c
#define ZERO_WAIT_US      30000000U   /* FPGA: 30 s zeroing wait — increase if sled starts far from home */
#define FPGA_INIT_WAIT_MS 32000       /* PC: matches ZERO_WAIT_US + margin; Sleep() before sending points */
```

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
ZEROING → (prox_stable) → IDLE ←─────────────────────────────────────────┐
              │                 └→ (step_go↑, num_steps>0, en=1) → WAKEUP → RUNNING → DONE
              │                                                                         │
              └──────────────────── (zero_req↑ from any state) ──────────────────────┘
```

| State | Behaviour |
|-------|-----------|
| `ZEROING` | Drives direction='0' (towards home) at zero_freq (25 Hz pulses). Resets `step_total=0` on `prox_stable`. |
| `IDLE` | Motor sleep (`en_out='0'`). Watches for `step_go` rising edge or `zero_req`. |
| `WAKEUP` | `en_out='1'`, waits 150,000 cycles (1.2 ms) — DRV8834 wakeup delay from sleep. |
| `RUNNING` | Outputs `run_clk` as step pulses. Counts down `steps_remaining`. Increments/decrements `step_total`. |
| `DONE` | Motor sleep. Waits for next `step_go` or `zero_req`. |

**Key constants:**
- `run_freq = 15625` → step pulse period = 125 MHz ÷ 15625 = 8 kHz (8000 steps/sec)
- `zero_freq = 2,500,000` → homing pulse rate = 125 MHz ÷ 2,500,000 = 50 Hz
- Proximity debounce: 1,250,000 cycles = 10 ms
- Wakeup hold: 150,000 cycles = 1.2 ms
- 2FF synchroniser on `prox_in` for metastability protection (`ASYNC_REG` attribute set)

---

### `spindle.vhd` — `hardware/RAPID.srcs/sources_1/new/`

BLDC 6-step open-loop commutation. Drives DRV8323 3-phase gate driver. Clock: 125 MHz.

**Ports:** `clk`, `en`, `en_spindle` (out), `INHA/INLA/INHB/INLB/INHC/INLC` (out).

The spindle runs **fixed speed, fixed direction** — `dir` and `speed` ports do not exist in the current implementation. Control is purely on/off via `en`.

**Hardcoded values:**
- `INHC <= '0'` — phase C high-side permanently low (direction fixed)
- `INLC <= '1'` — brake always released
- `en_spindle <= '1'` — DRV8323 always enabled
- `count_max = 6,410,256` → ~14.5 Hz commutation → ~1 revolution per 1.8 seconds
- PWM at ~10 kHz (period = 6250 counts), 50% duty cycle (3125 counts high)

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

---

## PC-side Build

```bash
make                         # builds build/RAPID.exe
make run PORT=COM25 FILE=input.gds
make gui                     # launches src/gui.py (uses .venv if present)
make clean
```

**Toolchain:** MinGW-w64 / MSYS2 UCRT64 gcc, `-O2 -Wall -Wextra -std=c11 -lm`.

**Sources compiled into RAPID.exe:** `src/pcCommunication.c` + `src/inputParser.c` only.

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
- Launches `build/RAPID.exe` as a `QProcess` child (merged stdout+stderr)
- Parses stdout line-by-line with regex:
  - `[ACK] r=<r> um, theta=<t> deg` → stores point, increments ACK counter
  - `[FPGA] <msg>` → logs to scrolling pane
  - `[RX] CRC mismatch` → increments CRC error counter
- Plot refreshes at **10 Hz** (100 ms QTimer, dirty-flag pattern to avoid redundant repaints)
- Scatter plot of ACK'd points + reference circle drawn at max radius
- Default port: `COM25`, default file: `input.gds`
- Working directory set to project root so `input.gds` resolves correctly

---

## Known Issues / Active Development Notes

1. **`step_total_out` readback:** GPIO channel 2 is configured as input for position readback, but the connection from `step_total_out` to GPIO channel 2 in the block design needs verification.

2. **Spindle runs open-loop:** No encoder feedback; rotor position is assumed from timing only. The `theta_deg` value in each point packet is received and available in `systemControl.c` but not yet used to command the spindle to a specific angle. Full theta control requires adding an encoder and position feedback loop.
