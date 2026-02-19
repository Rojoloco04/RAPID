# =============================================================================
# RAPID.xdc — Pin & I/O constraints for the top_wrapper (Block Design)
# Target: Arty Z7-20  (xc7z020clg400-1)
# All PL I/O banks are 3.3 V → LVCMOS33
#
# NOTE: clk, en, dir, speed are internal to the block design (driven by
#       PS7 FCLK_CLK0 and AXI GPIO) — they do NOT appear as top-level ports.
#       Only the external PL ports defined in the block design need constraints.
# =============================================================================

# ---- Kill switch (input) ----------------------------------------------------
set_property PACKAGE_PIN M20  [get_ports kill_0]
set_property IOSTANDARD LVCMOS33 [get_ports kill_0]

# ---- DRV8323 spindle enable (output) ----------------------------------------
set_property PACKAGE_PIN R16  [get_ports En_Spindle]
set_property IOSTANDARD LVCMOS33 [get_ports En_Spindle]
set_property SLEW SLOW [get_ports En_Spindle]

# ---- BLDC gate-driver outputs (DRV8323) -------------------------------------
# Phase A
set_property PACKAGE_PIN T14  [get_ports INHA_0]
set_property PACKAGE_PIN U12  [get_ports INLA_0]
set_property IOSTANDARD LVCMOS33 [get_ports INHA_0]
set_property IOSTANDARD LVCMOS33 [get_ports INLA_0]
set_property SLEW SLOW [get_ports INHA_0]
set_property SLEW SLOW [get_ports INLA_0]

# Phase B
set_property PACKAGE_PIN U13  [get_ports INHB_0]
set_property PACKAGE_PIN V13  [get_ports INLB_0]
set_property IOSTANDARD LVCMOS33 [get_ports INHB_0]
set_property IOSTANDARD LVCMOS33 [get_ports INLB_0]
set_property SLEW SLOW [get_ports INHB_0]
set_property SLEW SLOW [get_ports INLB_0]

# Phase C
set_property PACKAGE_PIN V15  [get_ports INHC_0]
set_property PACKAGE_PIN T15  [get_ports INLC_0]
set_property IOSTANDARD LVCMOS33 [get_ports INHC_0]
set_property IOSTANDARD LVCMOS33 [get_ports INLC_0]
set_property SLEW SLOW [get_ports INHC_0]
set_property DRIVE 12 [get_ports INLC_0]
set_property SLEW SLOW [get_ports INLC_0]

# ---- Stepper motor outputs --------------------------------------------------
set_property PACKAGE_PIN V17  [get_ports dir_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports dir_out_0]

set_property PACKAGE_PIN V18  [get_ports pwm_out_step_0]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_out_step_0]

set_property PACKAGE_PIN T16  [get_ports en_out_0]
set_property IOSTANDARD LVCMOS33 [get_ports en_out_0]

set_property PACKAGE_PIN R17  [get_ports prox_in_0]
set_property IOSTANDARD LVCMOS33 [get_ports prox_in_0]

# M_0[1:0] — stepper microstep select
set_property PACKAGE_PIN M19  [get_ports {M_0[0]}]
set_property PACKAGE_PIN D19  [get_ports {M_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {M_0[*]}]