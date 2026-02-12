import sys
import re
import math
from pathlib import Path
from PySide6.QtCore import QProcess, QTimer, Qt
from PySide6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QLineEdit, QLabel, QFileDialog, QPlainTextEdit
)
import pyqtgraph as pg

ACK_RE = re.compile(r"\[ACK\]\s+r=(?P<r>-?\d+)\s+nm,\s+theta=(?P<t>-?\d+)\s+udeg")
FPGA_RE = re.compile(r"\[FPGA\]\s+(?P<msg>.*)")
CRC_RE  = re.compile(r"\[RX\]\s+CRC mismatch.*")
TX_RE   = re.compile(r"\[TX\]\s+r=(?P<r>-?\d+)\s+nm,\s+theta=(?P<t>-?\d+)\s+deg")


def polar_to_xy(r_list, theta_deg_list):
    xs, ys = [], []
    for r, th in zip(r_list, theta_deg_list):
        rad = math.radians(th)
        xs.append(r * math.cos(rad))
        ys.append(r * math.sin(rad))
    return xs, ys


class Dashboard(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("UART Polar Dashboard")

        # --- state ---
        self.proc = QProcess(self)
        self.proc.setProcessChannelMode(QProcess.MergedChannels)
        self.proc.readyReadStandardOutput.connect(self.on_ready_read)
        self.proc.finished.connect(self.on_finished)

        self.ack_count = 0
        self.tx_count = 0

        self.ack_r = []
        self.ack_theta_deg = []
        self.tx_r = []
        self.tx_theta_deg = []

        # --- UI ---
        root = QVBoxLayout(self)

        row1 = QHBoxLayout()
        self.exe_path = QLineEdit(str(Path("transmission.exe").absolute()))
        btn_exe = QPushButton("Browse EXE")
        btn_exe.clicked.connect(self.pick_exe)
        row1.addWidget(QLabel("Sender EXE:"))
        row1.addWidget(self.exe_path, 1)
        row1.addWidget(btn_exe)
        root.addLayout(row1)

        row2 = QHBoxLayout()
        self.port = QLineEdit("COM25")
        self.gds_file = QLineEdit("input.gds")
        btn_file = QPushButton("Browse File")
        btn_file.clicked.connect(self.pick_file)
        row2.addWidget(QLabel("Port:"))
        row2.addWidget(self.port)
        row2.addWidget(QLabel("File:"))
        row2.addWidget(self.gds_file, 1)
        row2.addWidget(btn_file)
        root.addLayout(row2)

        row3 = QHBoxLayout()
        self.btn_start = QPushButton("Start")
        self.btn_stop = QPushButton("Stop")
        self.btn_stop.setEnabled(False)
        self.btn_clear = QPushButton("Clear")
        self.btn_start.clicked.connect(self.start)
        self.btn_stop.clicked.connect(self.stop)
        self.btn_clear.clicked.connect(self.clear)
        row3.addWidget(self.btn_start)
        row3.addWidget(self.btn_stop)
        row3.addWidget(self.btn_clear)
        row3.addStretch(1)
        root.addLayout(row3)

        row4 = QHBoxLayout()
        self.lbl_tx = QLabel("TX: 0")
        self.lbl_ack = QLabel("ACK: 0")
        self.lbl_status = QLabel("Status: idle")
        row4.addWidget(self.lbl_tx)
        row4.addWidget(self.lbl_ack)
        row4.addStretch(1)
        row4.addWidget(self.lbl_status)
        root.addLayout(row4)

        # Plot: polar points displayed in XY plane (circle view)
        self.plot = pg.PlotWidget()
        self.plot.setLabel("bottom", "X (nm)")
        self.plot.setLabel("left", "Y (nm)")
        self.plot.showGrid(x=True, y=True, alpha=0.2)

        # lock aspect so circles look like circles
        self.plot.setAspectLocked(True)

        self.curve_ack = self.plot.plot([], [], pen=None, symbol="o", symbolSize=6)
        self.curve_tx  = self.plot.plot([], [], pen=None, symbol="t", symbolSize=6)

        # optional: reference circle (updated dynamically)
        self.ref_circle = self.plot.plot([], [], pen=pg.mkPen(width=1))

        root.addWidget(self.plot, 1)

        # Log output
        self.log = QPlainTextEdit()
        self.log.setReadOnly(True)
        self.log.setMaximumBlockCount(3000)
        root.addWidget(self.log, 1)

        # refresh plot timer (so we don't redraw on every byte)
        self.timer = QTimer(self)
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.refresh_plot)
        self.timer.start()

    def pick_exe(self):
        p, _ = QFileDialog.getOpenFileName(self, "Select sender exe", "", "Executable (*.exe);;All files (*)")
        if p:
            self.exe_path.setText(p)

    def pick_file(self):
        p, _ = QFileDialog.getOpenFileName(self, "Select input file", "", "All files (*)")
        if p:
            self.gds_file.setText(p)

    def append_log(self, s: str):
        self.log.appendPlainText(s.rstrip())

    def set_running_ui(self, running: bool):
        self.btn_start.setEnabled(not running)
        self.btn_stop.setEnabled(running)

    def clear(self):
        self.ack_count = 0
        self.tx_count = 0
        self.ack_r.clear()
        self.ack_theta_deg.clear()
        self.tx_r.clear()
        self.tx_theta_deg.clear()
        self.lbl_tx.setText("TX: 0")
        self.lbl_ack.setText("ACK: 0")
        self.log.clear()
        self.refresh_plot()

    def start(self):
        exe = self.exe_path.text().strip()
        port = self.port.text().strip()
        f = self.gds_file.text().strip()

        if not exe or not Path(exe).exists():
            self.append_log("[GUI] EXE path invalid.")
            return

        args = [port]
        if f:
            args.append(f)

        self.append_log(f"[GUI] Starting: {exe} {' '.join(args)}")
        self.lbl_status.setText("Status: running")
        self.set_running_ui(True)

        self.proc.setProgram(exe)
        self.proc.setArguments(args)
        self.proc.start()

    def stop(self):
        if self.proc.state() != QProcess.NotRunning:
            self.append_log("[GUI] Stopping process...")
            self.proc.terminate()
            if not self.proc.waitForFinished(1000):
                self.proc.kill()
        self.lbl_status.setText("Status: idle")
        self.set_running_ui(False)

    def on_finished(self):
        self.append_log("[GUI] Process finished.")
        self.lbl_status.setText("Status: idle")
        self.set_running_ui(False)

    def on_ready_read(self):
        data = bytes(self.proc.readAllStandardOutput()).decode(errors="replace")
        for line in data.splitlines():
            self.append_log(line)

            m = ACK_RE.search(line)
            if m:
                r = int(m.group("r"))
                t_udeg = int(m.group("t"))
                t_deg = t_udeg / 1e6
                self.ack_r.append(r)
                self.ack_theta_deg.append(t_deg)
                self.ack_count += 1
                self.lbl_ack.setText(f"ACK: {self.ack_count}")
                continue

            m = TX_RE.search(line)
            if m:
                r = int(m.group("r"))
                t_deg = float(m.group("t"))
                self.tx_r.append(r)
                self.tx_theta_deg.append(t_deg)
                self.tx_count += 1
                self.lbl_tx.setText(f"TX: {self.tx_count}")
                continue

            if CRC_RE.search(line):
                # you could increment a CRC counter here
                pass

            m = FPGA_RE.search(line)
            if m:
                # optional: show FPGA status in header
                pass

    def refresh_plot(self):
        # ACK points (from FPGA): polar -> XY
        if self.ack_theta_deg:
            ax, ay = polar_to_xy(self.ack_r, self.ack_theta_deg)
            self.curve_ack.setData(ax, ay)
        else:
            self.curve_ack.setData([], [])

        # TX points (optional, if you emit [TX] lines): polar -> XY
        if self.tx_theta_deg:
            tx, ty = polar_to_xy(self.tx_r, self.tx_theta_deg)
            self.curve_tx.setData(tx, ty)
        else:
            self.curve_tx.setData([], [])

        # reference circle at max observed radius (ACK or TX)
        rmax = 0
        if self.ack_r:
            rmax = max(rmax, max(self.ack_r))
        if self.tx_r:
            rmax = max(rmax, max(self.tx_r))

        if rmax > 0:
            n = 256
            xs = [rmax * math.cos(2 * math.pi * i / n) for i in range(n + 1)]
            ys = [rmax * math.sin(2 * math.pi * i / n) for i in range(n + 1)]
            self.ref_circle.setData(xs, ys)
        else:
            self.ref_circle.setData([], [])


if __name__ == "__main__":
    app = QApplication(sys.argv)
    w = Dashboard()
    w.resize(1100, 700)
    w.show()
    sys.exit(app.exec())