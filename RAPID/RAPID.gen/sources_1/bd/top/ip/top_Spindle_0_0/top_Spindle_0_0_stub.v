// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Feb  3 16:57:24 2026
// Host        : MDD-ECE-785KL84 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/HardSoftCodesign/Hardsoftcodesign/RAPID/RAPID.gen/sources_1/bd/top/ip/top_Spindle_0_0/top_Spindle_0_0_stub.v
// Design      : top_Spindle_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "top_Spindle_0_0,Spindle,{}" *) (* core_generation_info = "top_Spindle_0_0,Spindle,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Spindle,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "Spindle,Vivado 2025.1" *) 
module top_Spindle_0_0(clk, en, en_spindle, dir, speed, kill, INHA, INLA, INHB, 
  INLB, INHC, INLC)
/* synthesis syn_black_box black_box_pad_pin="en,en_spindle,dir,speed[1:0],kill,INHA,INLA,INHB,INLB,INHC,INLC" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input en;
  output en_spindle;
  input dir;
  input [1:0]speed;
  input kill;
  output INHA;
  output INLA;
  output INHB;
  output INLB;
  output INHC;
  output INLC;
endmodule
