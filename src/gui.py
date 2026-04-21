"""
gui.py - RAPID control GUI.

Launches a single persistent RAPID.exe child process that owns the
serial connection.  Both tabs send text commands to its stdin and read
responses from its stdout — no serial library needed in Python.

Top bar (always visible):
    Port field | Connect | Disconnect | Stop

Tab 1 "Pattern Stream": stream a GDS file, live ACK plot.
Tab 2 "Manual Control": send individual POINT commands.

Usage:
    python gui.py
"""

import sys
import signal
import re
import math
import time
from pathlib import Path

from PySide6.QtCore import QProcess, QTimer
from PySide6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QLineEdit, QLabel, QFileDialog, QPlainTextEdit,
    QTabWidget, QSpinBox, QDoubleSpinBox, QGroupBox,
)
import pyqtgraph as pg

# ---------------------------------------------------------------------------
# Regex patterns for parsing RAPID.exe stdout
# ---------------------------------------------------------------------------
ACK_RE      = re.compile(r"\[ACK\]\s+r=(?P<r>-?\d+)\s+um,\s+theta=(?P<t>-?\d+\.?\d*)\s+deg")
CRC_RE      = re.compile(r"\[RX\]\s+CRC mismatch")
PROGRESS_RE = re.compile(r"\[PROGRESS\]\s+(?P<i>\d+)/(?P<n>\d+)")
RPM_RE      = re.compile(r"\[RPM\]\s+(?P<a>\d+)\s+RPM")

_CIRCLE_PTS = 256


def polar_to_xy(r_list, theta_deg_list):
    xs, ys = [], []
    for r, th in zip(r_list, theta_deg_list):
        rad = math.radians(th)
        xs.append(r * math.cos(rad))
        ys.append(r * math.sin(rad))
    return xs, ys


# ---------------------------------------------------------------------------
# Main GUI widget
# ---------------------------------------------------------------------------
class GUI(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("RAPID Control")

        # ---- single RAPID.exe process ----
        self.proc = QProcess(self)
        self.proc.setProcessChannelMode(QProcess.MergedChannels)
        self.proc.readyReadStandardOutput.connect(self._on_ready_read)
        self.proc.finished.connect(self._on_proc_finished)
        self.proc.errorOccurred.connect(self._on_proc_error)

        # ---- manual toggle state ----
        self.manual_spindle_on  = False
        self.manual_stepper_on  = False
        self.manual_laser_on    = False
        self.jog_dir_outward    = False   # direction used by the jog control

        # ---- data state ----
        self.ack_count = 0
        self.crc_count = 0
        self.ack_r: list[float] = []
        self.ack_theta_deg: list[float] = []
        self._read_buf = ""
        self._plot_dirty = False

        # ---- RPM data ----
        self.rpm_values: list[float] = []
        self.rpm_times:  list[float] = []   # seconds since first RPM reading
        self._rpm_t0: float | None = None
        self._rpm_plot_dirty = False

        # ---- build UI ----
        root = QVBoxLayout(self)
        self._build_top_bar(root)

        tabs = QTabWidget()

        pattern_tab = QWidget()
        ptab = QVBoxLayout(pattern_tab)
        self._build_pattern_tab(ptab)
        tabs.addTab(pattern_tab, "Pattern Stream")

        manual_tab = QWidget()
        mtab = QVBoxLayout(manual_tab)
        self._build_manual_tab(mtab)
        tabs.addTab(manual_tab, "Manual Control")

        rpm_tab = QWidget()
        rtab = QVBoxLayout(rpm_tab)
        self._build_rpm_tab(rtab)
        tabs.addTab(rpm_tab, "RPM Monitor")

        root.addWidget(tabs, 1)

        # shared log — always visible below the tabs
        self._build_log(root)

        # Plot refresh timers
        self._plot_timer = QTimer(self)
        self._plot_timer.setInterval(100)
        self._plot_timer.timeout.connect(self._refresh_plot)
        self._plot_timer.start()

        self._rpm_timer = QTimer(self)
        self._rpm_timer.setInterval(100)
        self._rpm_timer.timeout.connect(self._refresh_rpm_plot)
        self._rpm_timer.start()



    # -----------------------------------------------------------------------
    # Top bar: port | Connect | Disconnect | Stop
    # -----------------------------------------------------------------------

    def _build_top_bar(self, parent):
        row = QHBoxLayout()

        self.exe_path = QLineEdit(
            str(Path(__file__).parent.parent / "build" / "RAPID.exe"))
        self.exe_path.setPlaceholderText("path/to/RAPID.exe")

        self.port = QLineEdit("COM25")
        self.port.setMaximumWidth(80)

        self.btn_connect    = QPushButton("Connect")
        self.btn_stop       = QPushButton("END")
        self.btn_disconnect = QPushButton("EXIT")
        self.btn_connect.setToolTip("Start RAPID.exe and open the serial connection")
        self.btn_stop.setToolTip("Send END packet — disables laser, spindle, and stepper on the FPGA")
        self.btn_disconnect.setToolTip("Send END then EXIT — shuts down all hardware and kills RAPID.exe")
        self.btn_disconnect.setEnabled(False)
        self.btn_stop.setEnabled(False)

        self.lbl_conn_status = QLabel("disconnected")

        self.btn_connect.clicked.connect(self.connect)
        self.btn_disconnect.clicked.connect(self.disconnect)
        self.btn_stop.clicked.connect(self.stop)

        row.addWidget(QLabel("EXE:"))
        row.addWidget(self.exe_path, 2)
        row.addWidget(QLabel("Port:"))
        row.addWidget(self.port)
        row.addWidget(self.btn_connect)
        row.addWidget(self.btn_stop)
        row.addWidget(self.btn_disconnect)
        row.addStretch(1)
        row.addWidget(self.lbl_conn_status)

        parent.addLayout(row)

    # -----------------------------------------------------------------------
    # Pattern Stream tab
    # -----------------------------------------------------------------------

    def _build_pattern_tab(self, parent):
        # GDS file row
        file_row = QHBoxLayout()
        self.gds_file = QLineEdit("input.gds")
        btn_browse = QPushButton("Browse")
        btn_browse.setToolTip("Select a GDS2 file to stream")
        btn_browse.clicked.connect(self._pick_file)
        file_row.addWidget(QLabel("GDS File:"))
        file_row.addWidget(self.gds_file, 1)
        file_row.addWidget(btn_browse)
        parent.addLayout(file_row)

        # Stream button + counters
        ctrl_row = QHBoxLayout()
        self.btn_stream = QPushButton("Stream")
        self.btn_stream.setToolTip("Parse the GDS file and stream all points to the FPGA")
        self.btn_stream.setEnabled(False)
        self.btn_stream.clicked.connect(self.stream)
        self.lbl_ack      = QLabel("ACK: 0")
        self.lbl_crc      = QLabel("CRC: 0")
        self.lbl_progress = QLabel("")
        ctrl_row.addWidget(self.btn_stream)
        ctrl_row.addWidget(self.lbl_ack)
        ctrl_row.addWidget(self.lbl_crc)
        ctrl_row.addStretch(1)
        ctrl_row.addWidget(self.lbl_progress)
        parent.addLayout(ctrl_row)

        # Plot
        self.plot = pg.PlotWidget()
        self.plot.setLabel("bottom", "X (µm)")
        self.plot.setLabel("left",   "Y (µm)")
        self.plot.showGrid(x=True, y=True, alpha=0.2)
        self.plot.setAspectLocked(True)
        self.curve_ack  = self.plot.plot([], [], pen=None, symbol="o", symbolSize=6)
        self.ref_circle = self.plot.plot([], [], pen=pg.mkPen(width=1))
        parent.addWidget(self.plot, 1)

        btn_clear = QPushButton("Clear Plot")
        btn_clear.setToolTip("Clear the ACK scatter plot and reset counters")
        btn_clear.clicked.connect(self.clear_plot)
        parent.addWidget(btn_clear)

    # -----------------------------------------------------------------------
    # Manual Control tab
    # -----------------------------------------------------------------------

    def _build_manual_tab(self, parent):
        # -- hardware toggles --
        ctrl_group = QGroupBox("Hardware Controls")
        ctrl_layout = QHBoxLayout(ctrl_group)

        self.btn_spindle = QPushButton("Spindle: OFF")
        self.btn_stepper = QPushButton("Stepper: OFF")
        self.btn_laser   = QPushButton("Laser: OFF")
        self.btn_zero    = QPushButton("Zero")

        self.btn_spindle.setToolTip("Toggle spindle motor on/off (TYPE_SPINDLE)")
        self.btn_stepper.setToolTip("Toggle stepper motor on/off (TYPE_STEPPER) — must be ON to jog or zero")
        self.btn_laser.setToolTip("Toggle laser on/off (TYPE_LASER)")
        self.btn_zero.setToolTip("Pulse zero_req to home the sled and reset step count (TYPE_ZERO) — stepper must be ON")

        self.btn_spindle.clicked.connect(lambda: self._manual_toggle("spindle"))
        self.btn_stepper.clicked.connect(lambda: self._manual_toggle("stepper"))
        self.btn_laser.clicked.connect(  lambda: self._manual_toggle("laser"))
        self.btn_zero.clicked.connect(   self.manual_zero)

        for btn in (self.btn_spindle, self.btn_stepper, self.btn_laser, self.btn_zero):
            btn.setEnabled(False)
            ctrl_layout.addWidget(btn)
        parent.addWidget(ctrl_group)

        # -- stepper jog --
        jog_group = QGroupBox("Stepper Jog")
        jog_layout = QHBoxLayout(jog_group)

        self.jog_steps = QSpinBox()
        self.jog_steps.setRange(4, 250)
        self.jog_steps.setValue(1)
        self.jog_steps.setSuffix(" steps")

        self.btn_jog_dir = QPushButton("Dir: INWARD")
        self.btn_jog_dir.setToolTip("Toggle jog direction between inward (toward centre) and outward")
        self.btn_jog_dir.setEnabled(False)
        self.btn_jog_dir.clicked.connect(self._jog_toggle_dir)

        self.btn_jog = QPushButton("Jog")
        self.btn_jog.setToolTip("Move the sled by the specified number of steps (TYPE_JOG) — stepper must be ON")
        self.btn_jog.setEnabled(False)
        self.btn_jog.clicked.connect(self.manual_jog)

        jog_layout.addWidget(QLabel("Steps:"))
        jog_layout.addWidget(self.jog_steps)
        jog_layout.addWidget(self.btn_jog_dir)
        jog_layout.addWidget(self.btn_jog)
        jog_layout.addStretch(1)

        parent.addWidget(jog_group)

        # -- single point move --
        move_group = QGroupBox("Send Single Point")
        move_layout = QHBoxLayout(move_group)

        self.manual_r = QSpinBox()
        self.manual_r.setRange(0, 30000)
        self.manual_r.setValue(0)
        self.manual_r.setSuffix(" µm")

        self.manual_theta = QDoubleSpinBox()
        self.manual_theta.setRange(0.0, 360.0)
        self.manual_theta.setDecimals(2)
        self.manual_theta.setValue(0.0)
        self.manual_theta.setSuffix(" °")

        self.btn_move = QPushButton("Move")
        self.btn_move.setToolTip("Send a single polar coordinate point to the FPGA (TYPE_POINT)")
        self.btn_move.setEnabled(False)
        self.btn_move.clicked.connect(self.manual_move)

        move_layout.addWidget(QLabel("r:"))
        move_layout.addWidget(self.manual_r)
        move_layout.addWidget(QLabel("θ:"))
        move_layout.addWidget(self.manual_theta)
        move_layout.addWidget(self.btn_move)
        move_layout.addStretch(1)

        parent.addWidget(move_group)

        # -- voice coil duty cycle --
        vc_group = QGroupBox("Voice Coil Control")
        vc_layout = QHBoxLayout(vc_group)

        self.vc1_duty = QSpinBox()
        self.vc1_duty.setRange(0, 100)
        self.vc1_duty.setValue(0)
        self.vc1_duty.setSuffix(" %")

        self.btn_vc1 = QPushButton("Set VC1")
        self.btn_vc1.setToolTip("Set vertical voice coil PWM duty cycle 0–100 % (TYPE_VC1_DC)")
        self.btn_vc1.setEnabled(False)
        self.btn_vc1.clicked.connect(self._send_vc1)

        vc_layout.addWidget(QLabel("VC1 Duty:"))
        vc_layout.addWidget(self.vc1_duty)
        vc_layout.addWidget(self.btn_vc1)
        vc_layout.addStretch(1)
        parent.addWidget(vc_group)

        parent.addStretch(1)

    # -----------------------------------------------------------------------
    # RPM Monitor tab
    # -----------------------------------------------------------------------

    def _build_rpm_tab(self, parent):
        # Time-series plot
        self.rpm_plot = pg.PlotWidget()
        self.rpm_plot.setLabel("bottom", "Time (s)")
        self.rpm_plot.setLabel("left",   "RPM")
        self.rpm_plot.showGrid(x=True, y=True, alpha=0.2)
        self.rpm_curve = self.rpm_plot.plot(
            [], [], pen=pg.mkPen(color="#00bfff", width=2),
            symbol="o", symbolSize=4, symbolBrush="#00bfff",
        )
        parent.addWidget(self.rpm_plot, 1)

        btn_row = QHBoxLayout()
        self.btn_rpm = QPushButton("Read RPM")
        self.btn_rpm.setToolTip("Request current spindle RPM from the FPGA (TYPE_RPM_REQ)")
        self.btn_rpm.setEnabled(False)
        self.btn_rpm.clicked.connect(self.manual_rpm)
        btn_row.addWidget(self.btn_rpm)
        btn_clear_rpm = QPushButton("Clear")
        btn_clear_rpm.setToolTip("Clear RPM plot and log")
        btn_clear_rpm.clicked.connect(self.clear_rpm)
        btn_row.addWidget(btn_clear_rpm)
        btn_row.addStretch(1)
        parent.addLayout(btn_row)

        # RPM-only log
        self.rpm_log = QPlainTextEdit()
        self.rpm_log.setReadOnly(True)
        self.rpm_log.setMaximumBlockCount(2000)
        self.rpm_log.setFixedHeight(160)
        parent.addWidget(self.rpm_log)

    # -----------------------------------------------------------------------
    # Shared log
    # -----------------------------------------------------------------------

    def _build_log(self, parent):
        self.log = QPlainTextEdit()
        self.log.setReadOnly(True)
        self.log.setMaximumBlockCount(4000)
        self.log.setFixedHeight(180)
        parent.addWidget(self.log)

    # -----------------------------------------------------------------------
    # Connection management
    # -----------------------------------------------------------------------

    def connect(self):
        exe  = self.exe_path.text().strip()
        port = self.port.text().strip()

        if not exe or not Path(exe).exists():
            self._log(f"[GUI] RAPID.exe not found at: {exe}  — run 'make' first.")
            return

        if self.proc.state() != QProcess.NotRunning:
            return  # already running

        self.proc.setProgram(exe)
        self.proc.setArguments([port])
        self.proc.start()

        if not self.proc.waitForStarted(2000):
            self._log("[GUI] Failed to start RAPID.exe")
            return

        self._set_connected(True)

    def disconnect(self):
        if self.proc.state() != QProcess.NotRunning:
            self.proc.write(b"EXIT\n")
            if not self.proc.waitForFinished(1500):
                self.proc.kill()
        self._set_connected(False)

    def stop(self):
        """Send END — tells the FPGA to disable motors/laser.  Stays connected."""
        if self.proc.state() != QProcess.NotRunning:
            self.proc.write(b"END\n")
        self.manual_spindle_on = False
        self.manual_stepper_on = False
        self.manual_laser_on   = False
        self._update_toggle_labels()

    def _set_connected(self, connected: bool):
        self.btn_connect.setEnabled(not connected)
        self.btn_disconnect.setEnabled(connected)
        self.btn_stop.setEnabled(connected)
        self.btn_stream.setEnabled(connected)
        self.btn_move.setEnabled(connected)
        self.btn_jog.setEnabled(connected)
        self.btn_jog_dir.setEnabled(connected)
        for btn in (self.btn_spindle, self.btn_stepper, self.btn_laser, self.btn_zero):
            btn.setEnabled(connected)
        self.btn_rpm.setEnabled(connected)
        self.btn_vc1.setEnabled(connected)
        if not connected:
            # reset toggle state so buttons show correct labels on reconnect
            self.manual_spindle_on  = False
            self.manual_stepper_on  = False
            self.manual_laser_on    = False
            self.jog_dir_outward    = False
            self._update_toggle_labels()
        if not connected and self.lbl_conn_status.text() == "disconnected":
            return
        self.lbl_conn_status.setText("connected" if connected else "disconnected")
        if not connected:
            self._log("[GUI] Disconnected.")

    # -----------------------------------------------------------------------
    # Pattern Stream actions
    # -----------------------------------------------------------------------

    def stream(self):
        gds = self.gds_file.text().strip()
        if not gds:
            self._log("[GUI] No GDS file specified.")
            return
        self.proc.write(f"STREAM {gds}\n".encode())

    def clear_plot(self):
        self.ack_count = 0
        self.crc_count = 0
        self.ack_r.clear()
        self.ack_theta_deg.clear()
        self._plot_dirty = True
        self.lbl_ack.setText("ACK: 0")
        self.lbl_crc.setText("CRC: 0")
        self.lbl_progress.setText("")
        self._refresh_plot()

    def clear_rpm(self):
        self.rpm_values.clear()
        self.rpm_times.clear()
        self._rpm_t0 = None
        self._rpm_plot_dirty = True
        self.rpm_log.clear()
        self._refresh_rpm_plot()

    # -----------------------------------------------------------------------
    # Manual Control actions
    # -----------------------------------------------------------------------

    def manual_move(self):
        r     = self.manual_r.value()
        theta = self.manual_theta.value()
        self.proc.write(f"POINT {r} {theta:.2f}\n".encode())

    def _manual_toggle(self, what: str):
        if what == "spindle":
            self.manual_spindle_on  = not self.manual_spindle_on
            self.proc.write(f"SPINDLE {1 if self.manual_spindle_on  else 0}\n".encode())
        elif what == "stepper":
            self.manual_stepper_on  = not self.manual_stepper_on
            self.proc.write(f"STEPPER {1 if self.manual_stepper_on  else 0}\n".encode())
        elif what == "laser":
            self.manual_laser_on    = not self.manual_laser_on
            self.proc.write(f"LASER {1 if self.manual_laser_on    else 0}\n".encode())
        self._update_toggle_labels()

    def _jog_toggle_dir(self):
        self.jog_dir_outward = not self.jog_dir_outward
        self.btn_jog_dir.setText(f"Dir: {'OUTWARD' if self.jog_dir_outward else 'INWARD'}")

    def manual_jog(self):
        steps = self.jog_steps.value()
        # Set direction, then send the jog command
        self.proc.write(f"DIR {1 if self.jog_dir_outward else 0}\n".encode())
        self.proc.write(f"JOG {steps}\n".encode())

    def manual_zero(self):
        self.proc.write(b"ZERO\n")

    def manual_rpm(self):
        self.proc.write(b"RPM\n")

    def _send_vc1(self):
        self.proc.write(f"VC1 {self.vc1_duty.value()}\n".encode())

    def _update_toggle_labels(self):
        self.btn_spindle.setText(f"Spindle: {'ON'  if self.manual_spindle_on  else 'OFF'}")
        self.btn_stepper.setText(f"Stepper: {'ON'  if self.manual_stepper_on  else 'OFF'}")
        self.btn_laser.setText(  f"Laser: {'ON'    if self.manual_laser_on    else 'OFF'}")
        self.btn_jog_dir.setText(f"Dir: {'OUTWARD' if self.jog_dir_outward    else 'INWARD'}")

    # -----------------------------------------------------------------------
    # QProcess signal handlers
    # -----------------------------------------------------------------------

    def _on_proc_error(self, _):
        self._log(f"[GUI] Process error: {self.proc.errorString()}")
        self._set_connected(False)
        QTimer.singleShot(1000, self.connect)

    def _on_proc_finished(self):
        if self._read_buf.strip():
            self._process_line(self._read_buf)
        self._read_buf = ""
        self._set_connected(False)

    def _on_ready_read(self):
        self._read_buf += bytes(
            self.proc.readAllStandardOutput()).decode(errors="replace")
        while "\n" in self._read_buf:
            line, self._read_buf = self._read_buf.split("\n", 1)
            self._process_line(line)

    # -----------------------------------------------------------------------
    # Output parser
    # -----------------------------------------------------------------------

    def _process_line(self, line: str):
        line = line.rstrip()
        if not line:
            return
        # Suppress the FPGA's debug echo of RPM — the [RPM] response line is enough
        if not line.startswith("[FPGA] RPM:"):
            self._log(line)

        m = ACK_RE.search(line)
        if m:
            self.ack_r.append(int(m.group("r")))
            self.ack_theta_deg.append(float(m.group("t")))
            self.ack_count += 1
            self.lbl_ack.setText(f"ACK: {self.ack_count}")
            self._plot_dirty = True
            return

        if CRC_RE.search(line):
            self.crc_count += 1
            self.lbl_crc.setText(f"CRC: {self.crc_count}")
            return

        m = PROGRESS_RE.search(line)
        if m:
            self.lbl_progress.setText(f"{m.group('i')}/{m.group('n')}")

        m = RPM_RE.search(line)
        if m:
            rpm = int(m.group("a"))
            now = time.monotonic()
            if self._rpm_t0 is None:
                self._rpm_t0 = now
            self.rpm_times.append(now - self._rpm_t0)
            self.rpm_values.append(rpm)
            self.rpm_log.appendPlainText(f"t={self.rpm_times[-1]:.1f}s  {rpm} RPM")
            self._rpm_plot_dirty = True


    # -----------------------------------------------------------------------
    # Helpers
    # -----------------------------------------------------------------------

    def _log(self, text: str):
        ts = time.strftime("%H:%M:%S")
        self.log.appendPlainText(f"[{ts}] {text}")

    def _pick_file(self):
        p, _ = QFileDialog.getOpenFileName(
            self, "Select GDS file", "", "All files (*)")
        if p:
            self.gds_file.setText(p)

    # -----------------------------------------------------------------------
    # Plot refresh
    # -----------------------------------------------------------------------

    def _refresh_plot(self):
        if not self._plot_dirty:
            return
        self._plot_dirty = False
        if self.ack_theta_deg:
            ax, ay = polar_to_xy(self.ack_r, self.ack_theta_deg)
            self.curve_ack.setData(ax, ay)
        else:
            self.curve_ack.setData([], [])
        rmax = max(self.ack_r) if self.ack_r else 0
        if rmax > 0:
            angles = [2 * math.pi * i / _CIRCLE_PTS for i in range(_CIRCLE_PTS + 1)]
            self.ref_circle.setData(
                [rmax * math.cos(a) for a in angles],
                [rmax * math.sin(a) for a in angles],
            )
        else:
            self.ref_circle.setData([], [])

    def _refresh_rpm_plot(self):
        if not self._rpm_plot_dirty:
            return
        self._rpm_plot_dirty = False
        self.rpm_curve.setData(self.rpm_times, self.rpm_values)


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    app = QApplication(sys.argv)
    w = GUI()
    w.resize(1100, 750)
    w.show()

    signal.signal(signal.SIGINT, lambda *_: w.close())
    _sigint_timer = QTimer()
    _sigint_timer.setInterval(200)
    _sigint_timer.timeout.connect(lambda: None)
    _sigint_timer.start()

    sys.exit(app.exec())
