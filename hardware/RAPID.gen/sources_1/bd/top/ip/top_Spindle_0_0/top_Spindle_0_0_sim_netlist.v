// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Apr  9 15:31:41 2026
// Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_Spindle_0_0/top_Spindle_0_0_sim_netlist.v
// Design      : top_Spindle_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_Spindle_0_0,Spindle,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Spindle,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module top_Spindle_0_0
   (clk,
    en,
    en_spindle,
    RPM_Out,
    RPM_Pulse_In,
    INHA,
    INLA,
    INHB,
    INLB,
    INHC,
    INLC);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input en;
  output en_spindle;
  output [15:0]RPM_Out;
  input RPM_Pulse_In;
  output INHA;
  output INLA;
  output INHB;
  output INLB;
  output INHC;
  output INLC;

  wire \<const0> ;
  wire \<const1> ;
  wire INHA;
  wire INHB;
  wire INLA;
  wire INLB;
  wire [15:0]RPM_Out;
  wire RPM_Pulse_In;
  wire clk;
  wire en;

  assign INHC = \<const0> ;
  assign INLC = \<const1> ;
  assign en_spindle = en;
  GND GND
       (.G(\<const0> ));
  top_Spindle_0_0_Spindle U0
       (.INHA(INHA),
        .INHB(INHB),
        .INLA(INLA),
        .INLB(INLB),
        .RPM_Out(RPM_Out),
        .RPM_Pulse_In(RPM_Pulse_In),
        .clk(clk),
        .en(en));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "Spindle" *) 
module top_Spindle_0_0_Spindle
   (RPM_Out,
    INHA,
    INHB,
    INLB,
    INLA,
    en,
    RPM_Pulse_In,
    clk);
  output [15:0]RPM_Out;
  output INHA;
  output INHB;
  output INLB;
  output INLA;
  input en;
  input RPM_Pulse_In;
  input clk;

  wire INHA;
  wire INHB;
  wire INHB_i_1_n_0;
  wire INLA;
  wire INLA_i_1_n_0;
  wire INLB;
  wire INLB_i_1_n_0;
  wire \RPM_CLK_CNT[0]_i_2_n_0 ;
  wire [15:0]RPM_CLK_CNT_reg;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_0 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_1 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_2 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_3 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_4 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_5 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_6 ;
  wire \RPM_CLK_CNT_reg[0]_i_1_n_7 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_1 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_2 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_3 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_4 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_5 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_6 ;
  wire \RPM_CLK_CNT_reg[12]_i_1_n_7 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_0 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_1 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_2 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_3 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_4 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_5 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_6 ;
  wire \RPM_CLK_CNT_reg[4]_i_1_n_7 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_0 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_1 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_2 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_3 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_4 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_5 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_6 ;
  wire \RPM_CLK_CNT_reg[8]_i_1_n_7 ;
  wire \RPM_CLK_DIV[0]_i_1_n_0 ;
  wire \RPM_CLK_DIV[0]_i_3_n_0 ;
  wire \RPM_CLK_DIV[0]_i_4_n_0 ;
  wire \RPM_CLK_DIV[0]_i_5_n_0 ;
  wire \RPM_CLK_DIV[0]_i_6_n_0 ;
  wire [16:0]RPM_CLK_DIV_reg;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_0 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_1 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_2 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_3 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_4 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_5 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_6 ;
  wire \RPM_CLK_DIV_reg[0]_i_2_n_7 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_0 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_1 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_2 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_3 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_4 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_5 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_6 ;
  wire \RPM_CLK_DIV_reg[12]_i_1_n_7 ;
  wire \RPM_CLK_DIV_reg[16]_i_1_n_7 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_0 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_1 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_2 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_3 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_4 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_5 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_6 ;
  wire \RPM_CLK_DIV_reg[4]_i_1_n_7 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_0 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_1 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_2 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_3 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_4 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_5 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_6 ;
  wire \RPM_CLK_DIV_reg[8]_i_1_n_7 ;
  wire RPM_CLK_EDGE;
  wire RPM_OUT_SIG0;
  wire [15:0]RPM_Out;
  wire RPM_PULSE_PREV;
  wire RPM_Pulse_In;
  wire clk;
  wire clk_div;
  wire clk_div_i_1_n_0;
  wire clk_div_i_2_n_0;
  wire clk_div_i_3_n_0;
  wire clk_div_i_4_n_0;
  wire clk_div_i_5_n_0;
  wire clk_div_i_6_n_0;
  wire counter;
  wire \counter[0]_i_10_n_0 ;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire \counter[0]_i_8_n_0 ;
  wire \counter[0]_i_9_n_0 ;
  wire [28:0]counter_reg;
  wire \counter_reg[0]_i_3_n_0 ;
  wire \counter_reg[0]_i_3_n_1 ;
  wire \counter_reg[0]_i_3_n_2 ;
  wire \counter_reg[0]_i_3_n_3 ;
  wire \counter_reg[0]_i_3_n_4 ;
  wire \counter_reg[0]_i_3_n_5 ;
  wire \counter_reg[0]_i_3_n_6 ;
  wire \counter_reg[0]_i_3_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire en;
  wire in_startup;
  wire in_startup_i_1_n_0;
  wire in_startup_s1;
  wire in_startup_sync;
  wire p_1_in;
  wire \pwm_counter[0]_i_1_n_0 ;
  wire \pwm_counter[0]_i_3_n_0 ;
  wire \pwm_counter[0]_i_4_n_0 ;
  wire \pwm_counter[0]_i_5_n_0 ;
  wire \pwm_counter[0]_i_6_n_0 ;
  wire \pwm_counter[0]_i_7_n_0 ;
  wire [23:3]pwm_counter_reg;
  wire \pwm_counter_reg[0]_i_2_n_0 ;
  wire \pwm_counter_reg[0]_i_2_n_1 ;
  wire \pwm_counter_reg[0]_i_2_n_2 ;
  wire \pwm_counter_reg[0]_i_2_n_3 ;
  wire \pwm_counter_reg[0]_i_2_n_4 ;
  wire \pwm_counter_reg[0]_i_2_n_5 ;
  wire \pwm_counter_reg[0]_i_2_n_6 ;
  wire \pwm_counter_reg[0]_i_2_n_7 ;
  wire \pwm_counter_reg[12]_i_1_n_0 ;
  wire \pwm_counter_reg[12]_i_1_n_1 ;
  wire \pwm_counter_reg[12]_i_1_n_2 ;
  wire \pwm_counter_reg[12]_i_1_n_3 ;
  wire \pwm_counter_reg[12]_i_1_n_4 ;
  wire \pwm_counter_reg[12]_i_1_n_5 ;
  wire \pwm_counter_reg[12]_i_1_n_6 ;
  wire \pwm_counter_reg[12]_i_1_n_7 ;
  wire \pwm_counter_reg[16]_i_1_n_0 ;
  wire \pwm_counter_reg[16]_i_1_n_1 ;
  wire \pwm_counter_reg[16]_i_1_n_2 ;
  wire \pwm_counter_reg[16]_i_1_n_3 ;
  wire \pwm_counter_reg[16]_i_1_n_4 ;
  wire \pwm_counter_reg[16]_i_1_n_5 ;
  wire \pwm_counter_reg[16]_i_1_n_6 ;
  wire \pwm_counter_reg[16]_i_1_n_7 ;
  wire \pwm_counter_reg[20]_i_1_n_1 ;
  wire \pwm_counter_reg[20]_i_1_n_2 ;
  wire \pwm_counter_reg[20]_i_1_n_3 ;
  wire \pwm_counter_reg[20]_i_1_n_4 ;
  wire \pwm_counter_reg[20]_i_1_n_5 ;
  wire \pwm_counter_reg[20]_i_1_n_6 ;
  wire \pwm_counter_reg[20]_i_1_n_7 ;
  wire \pwm_counter_reg[4]_i_1_n_0 ;
  wire \pwm_counter_reg[4]_i_1_n_1 ;
  wire \pwm_counter_reg[4]_i_1_n_2 ;
  wire \pwm_counter_reg[4]_i_1_n_3 ;
  wire \pwm_counter_reg[4]_i_1_n_4 ;
  wire \pwm_counter_reg[4]_i_1_n_5 ;
  wire \pwm_counter_reg[4]_i_1_n_6 ;
  wire \pwm_counter_reg[4]_i_1_n_7 ;
  wire \pwm_counter_reg[8]_i_1_n_0 ;
  wire \pwm_counter_reg[8]_i_1_n_1 ;
  wire \pwm_counter_reg[8]_i_1_n_2 ;
  wire \pwm_counter_reg[8]_i_1_n_3 ;
  wire \pwm_counter_reg[8]_i_1_n_4 ;
  wire \pwm_counter_reg[8]_i_1_n_5 ;
  wire \pwm_counter_reg[8]_i_1_n_6 ;
  wire \pwm_counter_reg[8]_i_1_n_7 ;
  wire \pwm_counter_reg_n_0_[0] ;
  wire \pwm_counter_reg_n_0_[1] ;
  wire \pwm_counter_reg_n_0_[2] ;
  wire pwm_signal_i_1_n_0;
  wire pwm_signal_i_2_n_0;
  wire pwm_signal_i_3_n_0;
  wire pwm_signal_i_4_n_0;
  wire pwm_signal_i_5_n_0;
  wire start_check_i_1_n_0;
  wire start_check_reg_n_0;
  wire \start_count[0]_i_10_n_0 ;
  wire \start_count[0]_i_1_n_0 ;
  wire \start_count[0]_i_4_n_0 ;
  wire \start_count[0]_i_5_n_0 ;
  wire \start_count[0]_i_6_n_0 ;
  wire \start_count[0]_i_7_n_0 ;
  wire \start_count[0]_i_8_n_0 ;
  wire \start_count[0]_i_9_n_0 ;
  wire [27:5]start_count_reg;
  wire \start_count_reg[0]_i_2_n_0 ;
  wire \start_count_reg[0]_i_2_n_1 ;
  wire \start_count_reg[0]_i_2_n_2 ;
  wire \start_count_reg[0]_i_2_n_3 ;
  wire \start_count_reg[0]_i_2_n_4 ;
  wire \start_count_reg[0]_i_2_n_5 ;
  wire \start_count_reg[0]_i_2_n_6 ;
  wire \start_count_reg[0]_i_2_n_7 ;
  wire \start_count_reg[12]_i_1_n_0 ;
  wire \start_count_reg[12]_i_1_n_1 ;
  wire \start_count_reg[12]_i_1_n_2 ;
  wire \start_count_reg[12]_i_1_n_3 ;
  wire \start_count_reg[12]_i_1_n_4 ;
  wire \start_count_reg[12]_i_1_n_5 ;
  wire \start_count_reg[12]_i_1_n_6 ;
  wire \start_count_reg[12]_i_1_n_7 ;
  wire \start_count_reg[16]_i_1_n_0 ;
  wire \start_count_reg[16]_i_1_n_1 ;
  wire \start_count_reg[16]_i_1_n_2 ;
  wire \start_count_reg[16]_i_1_n_3 ;
  wire \start_count_reg[16]_i_1_n_4 ;
  wire \start_count_reg[16]_i_1_n_5 ;
  wire \start_count_reg[16]_i_1_n_6 ;
  wire \start_count_reg[16]_i_1_n_7 ;
  wire \start_count_reg[20]_i_1_n_0 ;
  wire \start_count_reg[20]_i_1_n_1 ;
  wire \start_count_reg[20]_i_1_n_2 ;
  wire \start_count_reg[20]_i_1_n_3 ;
  wire \start_count_reg[20]_i_1_n_4 ;
  wire \start_count_reg[20]_i_1_n_5 ;
  wire \start_count_reg[20]_i_1_n_6 ;
  wire \start_count_reg[20]_i_1_n_7 ;
  wire \start_count_reg[24]_i_1_n_1 ;
  wire \start_count_reg[24]_i_1_n_2 ;
  wire \start_count_reg[24]_i_1_n_3 ;
  wire \start_count_reg[24]_i_1_n_4 ;
  wire \start_count_reg[24]_i_1_n_5 ;
  wire \start_count_reg[24]_i_1_n_6 ;
  wire \start_count_reg[24]_i_1_n_7 ;
  wire \start_count_reg[4]_i_1_n_0 ;
  wire \start_count_reg[4]_i_1_n_1 ;
  wire \start_count_reg[4]_i_1_n_2 ;
  wire \start_count_reg[4]_i_1_n_3 ;
  wire \start_count_reg[4]_i_1_n_4 ;
  wire \start_count_reg[4]_i_1_n_5 ;
  wire \start_count_reg[4]_i_1_n_6 ;
  wire \start_count_reg[4]_i_1_n_7 ;
  wire \start_count_reg[8]_i_1_n_0 ;
  wire \start_count_reg[8]_i_1_n_1 ;
  wire \start_count_reg[8]_i_1_n_2 ;
  wire \start_count_reg[8]_i_1_n_3 ;
  wire \start_count_reg[8]_i_1_n_4 ;
  wire \start_count_reg[8]_i_1_n_5 ;
  wire \start_count_reg[8]_i_1_n_6 ;
  wire \start_count_reg[8]_i_1_n_7 ;
  wire \start_count_reg_n_0_[0] ;
  wire \start_count_reg_n_0_[1] ;
  wire \start_count_reg_n_0_[2] ;
  wire \start_count_reg_n_0_[3] ;
  wire \start_count_reg_n_0_[4] ;
  wire \step[0]_i_1_n_0 ;
  wire \step[1]_i_1_n_0 ;
  wire \step[2]_i_1_n_0 ;
  wire \step_reg_n_0_[0] ;
  wire \step_reg_n_0_[1] ;
  wire \step_reg_n_0_[2] ;
  wire [3:3]\NLW_RPM_CLK_CNT_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_RPM_CLK_DIV_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_RPM_CLK_DIV_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_counter_reg[28]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_pwm_counter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_start_count_reg[24]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hAAA88A8A8AA88A88)) 
    INHB_i_1
       (.I0(en),
        .I1(in_startup_sync),
        .I2(\step_reg_n_0_[1] ),
        .I3(\step_reg_n_0_[0] ),
        .I4(\step_reg_n_0_[2] ),
        .I5(INHB),
        .O(INHB_i_1_n_0));
  FDRE INHB_reg
       (.C(clk_div),
        .CE(1'b1),
        .D(INHB_i_1_n_0),
        .Q(INHB),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA8AA88AA88AA88A8)) 
    INLA_i_1
       (.I0(en),
        .I1(in_startup_sync),
        .I2(INLA),
        .I3(\step_reg_n_0_[2] ),
        .I4(\step_reg_n_0_[0] ),
        .I5(\step_reg_n_0_[1] ),
        .O(INLA_i_1_n_0));
  FDRE INLA_reg
       (.C(clk_div),
        .CE(1'b1),
        .D(INLA_i_1_n_0),
        .Q(INLA),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFBC3200000000)) 
    INLB_i_1
       (.I0(INLB),
        .I1(\step_reg_n_0_[1] ),
        .I2(\step_reg_n_0_[2] ),
        .I3(\step_reg_n_0_[0] ),
        .I4(in_startup_sync),
        .I5(en),
        .O(INLB_i_1_n_0));
  FDRE INLB_reg
       (.C(clk_div),
        .CE(1'b1),
        .D(INLB_i_1_n_0),
        .Q(INLB),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \RPM_CLK_CNT[0]_i_2 
       (.I0(RPM_CLK_CNT_reg[0]),
        .O(\RPM_CLK_CNT[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[0] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[0]_i_1_n_7 ),
        .Q(RPM_CLK_CNT_reg[0]),
        .R(RPM_OUT_SIG0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_CNT_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\RPM_CLK_CNT_reg[0]_i_1_n_0 ,\RPM_CLK_CNT_reg[0]_i_1_n_1 ,\RPM_CLK_CNT_reg[0]_i_1_n_2 ,\RPM_CLK_CNT_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\RPM_CLK_CNT_reg[0]_i_1_n_4 ,\RPM_CLK_CNT_reg[0]_i_1_n_5 ,\RPM_CLK_CNT_reg[0]_i_1_n_6 ,\RPM_CLK_CNT_reg[0]_i_1_n_7 }),
        .S({RPM_CLK_CNT_reg[3:1],\RPM_CLK_CNT[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[10] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[8]_i_1_n_5 ),
        .Q(RPM_CLK_CNT_reg[10]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[11] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[8]_i_1_n_4 ),
        .Q(RPM_CLK_CNT_reg[11]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[12] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[12]_i_1_n_7 ),
        .Q(RPM_CLK_CNT_reg[12]),
        .R(RPM_OUT_SIG0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_CNT_reg[12]_i_1 
       (.CI(\RPM_CLK_CNT_reg[8]_i_1_n_0 ),
        .CO({\NLW_RPM_CLK_CNT_reg[12]_i_1_CO_UNCONNECTED [3],\RPM_CLK_CNT_reg[12]_i_1_n_1 ,\RPM_CLK_CNT_reg[12]_i_1_n_2 ,\RPM_CLK_CNT_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_CNT_reg[12]_i_1_n_4 ,\RPM_CLK_CNT_reg[12]_i_1_n_5 ,\RPM_CLK_CNT_reg[12]_i_1_n_6 ,\RPM_CLK_CNT_reg[12]_i_1_n_7 }),
        .S(RPM_CLK_CNT_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[13] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[12]_i_1_n_6 ),
        .Q(RPM_CLK_CNT_reg[13]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[14] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[12]_i_1_n_5 ),
        .Q(RPM_CLK_CNT_reg[14]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[15] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[12]_i_1_n_4 ),
        .Q(RPM_CLK_CNT_reg[15]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[1] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[0]_i_1_n_6 ),
        .Q(RPM_CLK_CNT_reg[1]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[2] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[0]_i_1_n_5 ),
        .Q(RPM_CLK_CNT_reg[2]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[3] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[0]_i_1_n_4 ),
        .Q(RPM_CLK_CNT_reg[3]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[4] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[4]_i_1_n_7 ),
        .Q(RPM_CLK_CNT_reg[4]),
        .R(RPM_OUT_SIG0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_CNT_reg[4]_i_1 
       (.CI(\RPM_CLK_CNT_reg[0]_i_1_n_0 ),
        .CO({\RPM_CLK_CNT_reg[4]_i_1_n_0 ,\RPM_CLK_CNT_reg[4]_i_1_n_1 ,\RPM_CLK_CNT_reg[4]_i_1_n_2 ,\RPM_CLK_CNT_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_CNT_reg[4]_i_1_n_4 ,\RPM_CLK_CNT_reg[4]_i_1_n_5 ,\RPM_CLK_CNT_reg[4]_i_1_n_6 ,\RPM_CLK_CNT_reg[4]_i_1_n_7 }),
        .S(RPM_CLK_CNT_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[5] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[4]_i_1_n_6 ),
        .Q(RPM_CLK_CNT_reg[5]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[6] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[4]_i_1_n_5 ),
        .Q(RPM_CLK_CNT_reg[6]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[7] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[4]_i_1_n_4 ),
        .Q(RPM_CLK_CNT_reg[7]),
        .R(RPM_OUT_SIG0));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[8] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[8]_i_1_n_7 ),
        .Q(RPM_CLK_CNT_reg[8]),
        .R(RPM_OUT_SIG0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_CNT_reg[8]_i_1 
       (.CI(\RPM_CLK_CNT_reg[4]_i_1_n_0 ),
        .CO({\RPM_CLK_CNT_reg[8]_i_1_n_0 ,\RPM_CLK_CNT_reg[8]_i_1_n_1 ,\RPM_CLK_CNT_reg[8]_i_1_n_2 ,\RPM_CLK_CNT_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_CNT_reg[8]_i_1_n_4 ,\RPM_CLK_CNT_reg[8]_i_1_n_5 ,\RPM_CLK_CNT_reg[8]_i_1_n_6 ,\RPM_CLK_CNT_reg[8]_i_1_n_7 }),
        .S(RPM_CLK_CNT_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_CNT_reg[9] 
       (.C(clk),
        .CE(RPM_CLK_EDGE),
        .D(\RPM_CLK_CNT_reg[8]_i_1_n_6 ),
        .Q(RPM_CLK_CNT_reg[9]),
        .R(RPM_OUT_SIG0));
  LUT6 #(
    .INIT(64'h00000000FFFFA888)) 
    \RPM_CLK_DIV[0]_i_1 
       (.I0(RPM_CLK_DIV_reg[11]),
        .I1(\RPM_CLK_DIV[0]_i_3_n_0 ),
        .I2(RPM_CLK_DIV_reg[6]),
        .I3(\RPM_CLK_DIV[0]_i_4_n_0 ),
        .I4(RPM_CLK_DIV_reg[12]),
        .I5(\RPM_CLK_DIV[0]_i_5_n_0 ),
        .O(\RPM_CLK_DIV[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \RPM_CLK_DIV[0]_i_3 
       (.I0(RPM_CLK_DIV_reg[8]),
        .I1(RPM_CLK_DIV_reg[9]),
        .I2(RPM_CLK_DIV_reg[7]),
        .I3(RPM_CLK_DIV_reg[10]),
        .O(\RPM_CLK_DIV[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFEFEFEFEFEFE)) 
    \RPM_CLK_DIV[0]_i_4 
       (.I0(RPM_CLK_DIV_reg[4]),
        .I1(RPM_CLK_DIV_reg[3]),
        .I2(RPM_CLK_DIV_reg[5]),
        .I3(RPM_CLK_DIV_reg[0]),
        .I4(RPM_CLK_DIV_reg[2]),
        .I5(RPM_CLK_DIV_reg[1]),
        .O(\RPM_CLK_DIV[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \RPM_CLK_DIV[0]_i_5 
       (.I0(RPM_CLK_DIV_reg[13]),
        .I1(RPM_CLK_DIV_reg[14]),
        .I2(RPM_CLK_DIV_reg[15]),
        .I3(RPM_CLK_DIV_reg[16]),
        .O(\RPM_CLK_DIV[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \RPM_CLK_DIV[0]_i_6 
       (.I0(RPM_CLK_DIV_reg[0]),
        .O(\RPM_CLK_DIV[0]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[0]_i_2_n_7 ),
        .Q(RPM_CLK_DIV_reg[0]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_DIV_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\RPM_CLK_DIV_reg[0]_i_2_n_0 ,\RPM_CLK_DIV_reg[0]_i_2_n_1 ,\RPM_CLK_DIV_reg[0]_i_2_n_2 ,\RPM_CLK_DIV_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\RPM_CLK_DIV_reg[0]_i_2_n_4 ,\RPM_CLK_DIV_reg[0]_i_2_n_5 ,\RPM_CLK_DIV_reg[0]_i_2_n_6 ,\RPM_CLK_DIV_reg[0]_i_2_n_7 }),
        .S({RPM_CLK_DIV_reg[3:1],\RPM_CLK_DIV[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[8]_i_1_n_5 ),
        .Q(RPM_CLK_DIV_reg[10]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[8]_i_1_n_4 ),
        .Q(RPM_CLK_DIV_reg[11]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[12]_i_1_n_7 ),
        .Q(RPM_CLK_DIV_reg[12]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_DIV_reg[12]_i_1 
       (.CI(\RPM_CLK_DIV_reg[8]_i_1_n_0 ),
        .CO({\RPM_CLK_DIV_reg[12]_i_1_n_0 ,\RPM_CLK_DIV_reg[12]_i_1_n_1 ,\RPM_CLK_DIV_reg[12]_i_1_n_2 ,\RPM_CLK_DIV_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_DIV_reg[12]_i_1_n_4 ,\RPM_CLK_DIV_reg[12]_i_1_n_5 ,\RPM_CLK_DIV_reg[12]_i_1_n_6 ,\RPM_CLK_DIV_reg[12]_i_1_n_7 }),
        .S(RPM_CLK_DIV_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[12]_i_1_n_6 ),
        .Q(RPM_CLK_DIV_reg[13]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[12]_i_1_n_5 ),
        .Q(RPM_CLK_DIV_reg[14]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[12]_i_1_n_4 ),
        .Q(RPM_CLK_DIV_reg[15]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[16]_i_1_n_7 ),
        .Q(RPM_CLK_DIV_reg[16]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_DIV_reg[16]_i_1 
       (.CI(\RPM_CLK_DIV_reg[12]_i_1_n_0 ),
        .CO(\NLW_RPM_CLK_DIV_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_RPM_CLK_DIV_reg[16]_i_1_O_UNCONNECTED [3:1],\RPM_CLK_DIV_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,RPM_CLK_DIV_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[0]_i_2_n_6 ),
        .Q(RPM_CLK_DIV_reg[1]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[0]_i_2_n_5 ),
        .Q(RPM_CLK_DIV_reg[2]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[0]_i_2_n_4 ),
        .Q(RPM_CLK_DIV_reg[3]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[4]_i_1_n_7 ),
        .Q(RPM_CLK_DIV_reg[4]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_DIV_reg[4]_i_1 
       (.CI(\RPM_CLK_DIV_reg[0]_i_2_n_0 ),
        .CO({\RPM_CLK_DIV_reg[4]_i_1_n_0 ,\RPM_CLK_DIV_reg[4]_i_1_n_1 ,\RPM_CLK_DIV_reg[4]_i_1_n_2 ,\RPM_CLK_DIV_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_DIV_reg[4]_i_1_n_4 ,\RPM_CLK_DIV_reg[4]_i_1_n_5 ,\RPM_CLK_DIV_reg[4]_i_1_n_6 ,\RPM_CLK_DIV_reg[4]_i_1_n_7 }),
        .S(RPM_CLK_DIV_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[4]_i_1_n_6 ),
        .Q(RPM_CLK_DIV_reg[5]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[4]_i_1_n_5 ),
        .Q(RPM_CLK_DIV_reg[6]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[4]_i_1_n_4 ),
        .Q(RPM_CLK_DIV_reg[7]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[8]_i_1_n_7 ),
        .Q(RPM_CLK_DIV_reg[8]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RPM_CLK_DIV_reg[8]_i_1 
       (.CI(\RPM_CLK_DIV_reg[4]_i_1_n_0 ),
        .CO({\RPM_CLK_DIV_reg[8]_i_1_n_0 ,\RPM_CLK_DIV_reg[8]_i_1_n_1 ,\RPM_CLK_DIV_reg[8]_i_1_n_2 ,\RPM_CLK_DIV_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RPM_CLK_DIV_reg[8]_i_1_n_4 ,\RPM_CLK_DIV_reg[8]_i_1_n_5 ,\RPM_CLK_DIV_reg[8]_i_1_n_6 ,\RPM_CLK_DIV_reg[8]_i_1_n_7 }),
        .S(RPM_CLK_DIV_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \RPM_CLK_DIV_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV_reg[8]_i_1_n_6 ),
        .Q(RPM_CLK_DIV_reg[9]),
        .R(\RPM_CLK_DIV[0]_i_1_n_0 ));
  FDRE RPM_CLK_EDGE_reg
       (.C(clk),
        .CE(1'b1),
        .D(\RPM_CLK_DIV[0]_i_1_n_0 ),
        .Q(RPM_CLK_EDGE),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \RPM_OUT_SIG[15]_i_1 
       (.I0(RPM_Pulse_In),
        .I1(RPM_PULSE_PREV),
        .O(RPM_OUT_SIG0));
  FDRE \RPM_OUT_SIG_reg[0] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[0]),
        .Q(RPM_Out[0]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[10] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[10]),
        .Q(RPM_Out[10]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[11] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[11]),
        .Q(RPM_Out[11]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[12] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[12]),
        .Q(RPM_Out[12]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[13] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[13]),
        .Q(RPM_Out[13]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[14] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[14]),
        .Q(RPM_Out[14]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[15] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[15]),
        .Q(RPM_Out[15]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[1] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[1]),
        .Q(RPM_Out[1]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[2] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[2]),
        .Q(RPM_Out[2]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[3] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[3]),
        .Q(RPM_Out[3]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[4] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[4]),
        .Q(RPM_Out[4]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[5] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[5]),
        .Q(RPM_Out[5]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[6] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[6]),
        .Q(RPM_Out[6]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[7] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[7]),
        .Q(RPM_Out[7]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[8] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[8]),
        .Q(RPM_Out[8]),
        .R(1'b0));
  FDRE \RPM_OUT_SIG_reg[9] 
       (.C(clk),
        .CE(RPM_OUT_SIG0),
        .D(RPM_CLK_CNT_reg[9]),
        .Q(RPM_Out[9]),
        .R(1'b0));
  FDRE RPM_PULSE_PREV_reg
       (.C(clk),
        .CE(1'b1),
        .D(RPM_Pulse_In),
        .Q(RPM_PULSE_PREV),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    clk_div_i_1
       (.I0(\counter[0]_i_2_n_0 ),
        .I1(clk_div_i_2_n_0),
        .O(clk_div_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000011115515)) 
    clk_div_i_2
       (.I0(\counter[0]_i_4_n_0 ),
        .I1(counter_reg[22]),
        .I2(clk_div_i_3_n_0),
        .I3(clk_div_i_4_n_0),
        .I4(counter_reg[21]),
        .I5(counter_reg[23]),
        .O(clk_div_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAAEAAAAAAAA)) 
    clk_div_i_3
       (.I0(counter_reg[15]),
        .I1(counter_reg[10]),
        .I2(clk_div_i_5_n_0),
        .I3(clk_div_i_6_n_0),
        .I4(counter_reg[13]),
        .I5(counter_reg[14]),
        .O(clk_div_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    clk_div_i_4
       (.I0(counter_reg[20]),
        .I1(counter_reg[19]),
        .I2(counter_reg[18]),
        .I3(counter_reg[17]),
        .I4(counter_reg[16]),
        .O(clk_div_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    clk_div_i_5
       (.I0(counter_reg[8]),
        .I1(counter_reg[7]),
        .I2(counter_reg[6]),
        .I3(counter_reg[5]),
        .I4(counter_reg[4]),
        .O(clk_div_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    clk_div_i_6
       (.I0(counter_reg[11]),
        .I1(counter_reg[12]),
        .I2(counter_reg[9]),
        .O(clk_div_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_div_reg
       (.C(clk),
        .CE(1'b1),
        .D(clk_div_i_1_n_0),
        .Q(clk_div),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(\counter[0]_i_2_n_0 ),
        .O(counter));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[0]_i_10 
       (.I0(counter_reg[11]),
        .I1(counter_reg[12]),
        .I2(counter_reg[10]),
        .I3(counter_reg[13]),
        .O(\counter[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000515555555555)) 
    \counter[0]_i_2 
       (.I0(\counter[0]_i_4_n_0 ),
        .I1(\counter[0]_i_5_n_0 ),
        .I2(\counter[0]_i_6_n_0 ),
        .I3(counter_reg[21]),
        .I4(counter_reg[22]),
        .I5(counter_reg[23]),
        .O(\counter[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[0]_i_4 
       (.I0(counter_reg[24]),
        .I1(counter_reg[26]),
        .I2(counter_reg[25]),
        .I3(counter_reg[28]),
        .I4(counter_reg[27]),
        .O(\counter[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFAAFEAAAAAAAA)) 
    \counter[0]_i_5 
       (.I0(counter_reg[16]),
        .I1(\counter[0]_i_8_n_0 ),
        .I2(\counter[0]_i_9_n_0 ),
        .I3(\counter[0]_i_10_n_0 ),
        .I4(counter_reg[14]),
        .I5(counter_reg[15]),
        .O(\counter[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[0]_i_6 
       (.I0(counter_reg[17]),
        .I1(counter_reg[18]),
        .I2(counter_reg[19]),
        .I3(counter_reg[20]),
        .O(\counter[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_7 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \counter[0]_i_8 
       (.I0(counter_reg[5]),
        .I1(counter_reg[2]),
        .I2(counter_reg[3]),
        .I3(counter_reg[0]),
        .I4(counter_reg[4]),
        .I5(counter_reg[1]),
        .O(\counter[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[0]_i_9 
       (.I0(counter_reg[9]),
        .I1(counter_reg[8]),
        .I2(counter_reg[7]),
        .I3(counter_reg[6]),
        .O(\counter[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_7 ),
        .Q(counter_reg[0]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_3_n_0 ,\counter_reg[0]_i_3_n_1 ,\counter_reg[0]_i_3_n_2 ,\counter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_3_n_4 ,\counter_reg[0]_i_3_n_5 ,\counter_reg[0]_i_3_n_6 ,\counter_reg[0]_i_3_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_6 ),
        .Q(counter_reg[1]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO(\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[28]_i_1_O_UNCONNECTED [3:1],\counter_reg[28]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,counter_reg[28]}));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_5 ),
        .Q(counter_reg[2]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[0]_i_3_n_4 ),
        .Q(counter_reg[3]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_3_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(\counter[0]_i_2_n_0 ),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(counter));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    in_startup_i_1
       (.I0(in_startup),
        .I1(start_check_reg_n_0),
        .I2(p_1_in),
        .I3(en),
        .O(in_startup_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    in_startup_reg
       (.C(clk),
        .CE(1'b1),
        .D(in_startup_i_1_n_0),
        .Q(in_startup),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    in_startup_s1_reg
       (.C(clk_div),
        .CE(1'b1),
        .D(in_startup),
        .Q(in_startup_s1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    in_startup_sync_reg
       (.C(clk_div),
        .CE(1'b1),
        .D(in_startup_s1),
        .Q(in_startup_sync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8A8A8A8A8A8A8A88)) 
    \pwm_counter[0]_i_1 
       (.I0(pwm_counter_reg[23]),
        .I1(pwm_counter_reg[22]),
        .I2(\pwm_counter[0]_i_3_n_0 ),
        .I3(pwm_counter_reg[16]),
        .I4(\pwm_counter[0]_i_4_n_0 ),
        .I5(\pwm_counter[0]_i_5_n_0 ),
        .O(\pwm_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \pwm_counter[0]_i_3 
       (.I0(pwm_counter_reg[19]),
        .I1(pwm_counter_reg[21]),
        .I2(pwm_counter_reg[20]),
        .I3(pwm_counter_reg[17]),
        .I4(pwm_counter_reg[18]),
        .O(\pwm_counter[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \pwm_counter[0]_i_4 
       (.I0(pwm_counter_reg[14]),
        .I1(pwm_counter_reg[15]),
        .O(\pwm_counter[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFE)) 
    \pwm_counter[0]_i_5 
       (.I0(pwm_counter_reg[6]),
        .I1(pwm_counter_reg[5]),
        .I2(pwm_counter_reg[8]),
        .I3(pwm_counter_reg[7]),
        .I4(pwm_counter_reg[9]),
        .I5(\pwm_counter[0]_i_7_n_0 ),
        .O(\pwm_counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pwm_counter[0]_i_6 
       (.I0(\pwm_counter_reg_n_0_[0] ),
        .O(\pwm_counter[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \pwm_counter[0]_i_7 
       (.I0(pwm_counter_reg[11]),
        .I1(pwm_counter_reg[12]),
        .I2(pwm_counter_reg[13]),
        .I3(pwm_counter_reg[15]),
        .I4(pwm_counter_reg[10]),
        .O(\pwm_counter[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[0]_i_2_n_7 ),
        .Q(\pwm_counter_reg_n_0_[0] ),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\pwm_counter_reg[0]_i_2_n_0 ,\pwm_counter_reg[0]_i_2_n_1 ,\pwm_counter_reg[0]_i_2_n_2 ,\pwm_counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pwm_counter_reg[0]_i_2_n_4 ,\pwm_counter_reg[0]_i_2_n_5 ,\pwm_counter_reg[0]_i_2_n_6 ,\pwm_counter_reg[0]_i_2_n_7 }),
        .S({pwm_counter_reg[3],\pwm_counter_reg_n_0_[2] ,\pwm_counter_reg_n_0_[1] ,\pwm_counter[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[8]_i_1_n_5 ),
        .Q(pwm_counter_reg[10]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[8]_i_1_n_4 ),
        .Q(pwm_counter_reg[11]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[12]_i_1_n_7 ),
        .Q(pwm_counter_reg[12]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[12]_i_1 
       (.CI(\pwm_counter_reg[8]_i_1_n_0 ),
        .CO({\pwm_counter_reg[12]_i_1_n_0 ,\pwm_counter_reg[12]_i_1_n_1 ,\pwm_counter_reg[12]_i_1_n_2 ,\pwm_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[12]_i_1_n_4 ,\pwm_counter_reg[12]_i_1_n_5 ,\pwm_counter_reg[12]_i_1_n_6 ,\pwm_counter_reg[12]_i_1_n_7 }),
        .S(pwm_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[12]_i_1_n_6 ),
        .Q(pwm_counter_reg[13]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[12]_i_1_n_5 ),
        .Q(pwm_counter_reg[14]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[12]_i_1_n_4 ),
        .Q(pwm_counter_reg[15]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[16]_i_1_n_7 ),
        .Q(pwm_counter_reg[16]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[16]_i_1 
       (.CI(\pwm_counter_reg[12]_i_1_n_0 ),
        .CO({\pwm_counter_reg[16]_i_1_n_0 ,\pwm_counter_reg[16]_i_1_n_1 ,\pwm_counter_reg[16]_i_1_n_2 ,\pwm_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[16]_i_1_n_4 ,\pwm_counter_reg[16]_i_1_n_5 ,\pwm_counter_reg[16]_i_1_n_6 ,\pwm_counter_reg[16]_i_1_n_7 }),
        .S(pwm_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[16]_i_1_n_6 ),
        .Q(pwm_counter_reg[17]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[16]_i_1_n_5 ),
        .Q(pwm_counter_reg[18]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[16]_i_1_n_4 ),
        .Q(pwm_counter_reg[19]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[0]_i_2_n_6 ),
        .Q(\pwm_counter_reg_n_0_[1] ),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[20]_i_1_n_7 ),
        .Q(pwm_counter_reg[20]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[20]_i_1 
       (.CI(\pwm_counter_reg[16]_i_1_n_0 ),
        .CO({\NLW_pwm_counter_reg[20]_i_1_CO_UNCONNECTED [3],\pwm_counter_reg[20]_i_1_n_1 ,\pwm_counter_reg[20]_i_1_n_2 ,\pwm_counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[20]_i_1_n_4 ,\pwm_counter_reg[20]_i_1_n_5 ,\pwm_counter_reg[20]_i_1_n_6 ,\pwm_counter_reg[20]_i_1_n_7 }),
        .S(pwm_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[20]_i_1_n_6 ),
        .Q(pwm_counter_reg[21]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[20]_i_1_n_5 ),
        .Q(pwm_counter_reg[22]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[20]_i_1_n_4 ),
        .Q(pwm_counter_reg[23]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[0]_i_2_n_5 ),
        .Q(\pwm_counter_reg_n_0_[2] ),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[0]_i_2_n_4 ),
        .Q(pwm_counter_reg[3]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[4]_i_1_n_7 ),
        .Q(pwm_counter_reg[4]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[4]_i_1 
       (.CI(\pwm_counter_reg[0]_i_2_n_0 ),
        .CO({\pwm_counter_reg[4]_i_1_n_0 ,\pwm_counter_reg[4]_i_1_n_1 ,\pwm_counter_reg[4]_i_1_n_2 ,\pwm_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[4]_i_1_n_4 ,\pwm_counter_reg[4]_i_1_n_5 ,\pwm_counter_reg[4]_i_1_n_6 ,\pwm_counter_reg[4]_i_1_n_7 }),
        .S(pwm_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[4]_i_1_n_6 ),
        .Q(pwm_counter_reg[5]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[4]_i_1_n_5 ),
        .Q(pwm_counter_reg[6]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[4]_i_1_n_4 ),
        .Q(pwm_counter_reg[7]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[8]_i_1_n_7 ),
        .Q(pwm_counter_reg[8]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[8]_i_1 
       (.CI(\pwm_counter_reg[4]_i_1_n_0 ),
        .CO({\pwm_counter_reg[8]_i_1_n_0 ,\pwm_counter_reg[8]_i_1_n_1 ,\pwm_counter_reg[8]_i_1_n_2 ,\pwm_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[8]_i_1_n_4 ,\pwm_counter_reg[8]_i_1_n_5 ,\pwm_counter_reg[8]_i_1_n_6 ,\pwm_counter_reg[8]_i_1_n_7 }),
        .S(pwm_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\pwm_counter_reg[8]_i_1_n_6 ),
        .Q(pwm_counter_reg[9]),
        .R(\pwm_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    pwm_signal_i_1
       (.I0(pwm_signal_i_2_n_0),
        .I1(pwm_signal_i_3_n_0),
        .I2(pwm_counter_reg[20]),
        .I3(pwm_counter_reg[17]),
        .I4(pwm_counter_reg[19]),
        .O(pwm_signal_i_1_n_0));
  LUT6 #(
    .INIT(64'h45FFFFFFFFFFFFFF)) 
    pwm_signal_i_2
       (.I0(pwm_counter_reg[12]),
        .I1(pwm_signal_i_4_n_0),
        .I2(pwm_counter_reg[11]),
        .I3(pwm_counter_reg[13]),
        .I4(pwm_counter_reg[16]),
        .I5(\pwm_counter[0]_i_4_n_0 ),
        .O(pwm_signal_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_signal_i_3
       (.I0(pwm_counter_reg[23]),
        .I1(pwm_counter_reg[22]),
        .I2(pwm_counter_reg[18]),
        .I3(pwm_counter_reg[21]),
        .O(pwm_signal_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000000000001FF)) 
    pwm_signal_i_4
       (.I0(pwm_counter_reg[3]),
        .I1(pwm_counter_reg[4]),
        .I2(pwm_counter_reg[5]),
        .I3(pwm_counter_reg[6]),
        .I4(pwm_signal_i_5_n_0),
        .I5(pwm_counter_reg[10]),
        .O(pwm_signal_i_4_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    pwm_signal_i_5
       (.I0(pwm_counter_reg[8]),
        .I1(pwm_counter_reg[7]),
        .I2(pwm_counter_reg[9]),
        .O(pwm_signal_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pwm_signal_reg
       (.C(clk),
        .CE(1'b1),
        .D(pwm_signal_i_1_n_0),
        .Q(INHA),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    start_check_i_1
       (.I0(start_check_reg_n_0),
        .I1(p_1_in),
        .I2(en),
        .O(start_check_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    start_check_reg
       (.C(clk),
        .CE(1'b1),
        .D(start_check_i_1_n_0),
        .Q(start_check_reg_n_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h4F)) 
    \start_count[0]_i_1 
       (.I0(p_1_in),
        .I1(start_check_reg_n_0),
        .I2(en),
        .O(\start_count[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \start_count[0]_i_10 
       (.I0(start_count_reg[19]),
        .I1(start_count_reg[18]),
        .O(\start_count[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h55555555FFFF7757)) 
    \start_count[0]_i_3 
       (.I0(start_count_reg[27]),
        .I1(\start_count[0]_i_5_n_0 ),
        .I2(start_count_reg[21]),
        .I3(\start_count[0]_i_6_n_0 ),
        .I4(\start_count[0]_i_7_n_0 ),
        .I5(start_count_reg[26]),
        .O(p_1_in));
  LUT1 #(
    .INIT(2'h1)) 
    \start_count[0]_i_4 
       (.I0(\start_count_reg_n_0_[0] ),
        .O(\start_count[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \start_count[0]_i_5 
       (.I0(start_count_reg[23]),
        .I1(start_count_reg[22]),
        .O(\start_count[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF0455)) 
    \start_count[0]_i_6 
       (.I0(start_count_reg[17]),
        .I1(\start_count[0]_i_8_n_0 ),
        .I2(\start_count[0]_i_9_n_0 ),
        .I3(start_count_reg[16]),
        .I4(\start_count[0]_i_10_n_0 ),
        .I5(start_count_reg[20]),
        .O(\start_count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \start_count[0]_i_7 
       (.I0(start_count_reg[25]),
        .I1(start_count_reg[24]),
        .O(\start_count[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h555555557FFFFFFF)) 
    \start_count[0]_i_8 
       (.I0(start_count_reg[10]),
        .I1(start_count_reg[5]),
        .I2(start_count_reg[8]),
        .I3(start_count_reg[6]),
        .I4(start_count_reg[7]),
        .I5(start_count_reg[9]),
        .O(\start_count[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \start_count[0]_i_9 
       (.I0(start_count_reg[13]),
        .I1(start_count_reg[15]),
        .I2(start_count_reg[12]),
        .I3(start_count_reg[11]),
        .I4(start_count_reg[14]),
        .O(\start_count[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[0] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[0]_i_2_n_7 ),
        .Q(\start_count_reg_n_0_[0] ),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\start_count_reg[0]_i_2_n_0 ,\start_count_reg[0]_i_2_n_1 ,\start_count_reg[0]_i_2_n_2 ,\start_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\start_count_reg[0]_i_2_n_4 ,\start_count_reg[0]_i_2_n_5 ,\start_count_reg[0]_i_2_n_6 ,\start_count_reg[0]_i_2_n_7 }),
        .S({\start_count_reg_n_0_[3] ,\start_count_reg_n_0_[2] ,\start_count_reg_n_0_[1] ,\start_count[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[10] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[8]_i_1_n_5 ),
        .Q(start_count_reg[10]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[11] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[8]_i_1_n_4 ),
        .Q(start_count_reg[11]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[12] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[12]_i_1_n_7 ),
        .Q(start_count_reg[12]),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[12]_i_1 
       (.CI(\start_count_reg[8]_i_1_n_0 ),
        .CO({\start_count_reg[12]_i_1_n_0 ,\start_count_reg[12]_i_1_n_1 ,\start_count_reg[12]_i_1_n_2 ,\start_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[12]_i_1_n_4 ,\start_count_reg[12]_i_1_n_5 ,\start_count_reg[12]_i_1_n_6 ,\start_count_reg[12]_i_1_n_7 }),
        .S(start_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[13] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[12]_i_1_n_6 ),
        .Q(start_count_reg[13]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[14] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[12]_i_1_n_5 ),
        .Q(start_count_reg[14]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[15] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[12]_i_1_n_4 ),
        .Q(start_count_reg[15]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[16] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[16]_i_1_n_7 ),
        .Q(start_count_reg[16]),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[16]_i_1 
       (.CI(\start_count_reg[12]_i_1_n_0 ),
        .CO({\start_count_reg[16]_i_1_n_0 ,\start_count_reg[16]_i_1_n_1 ,\start_count_reg[16]_i_1_n_2 ,\start_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[16]_i_1_n_4 ,\start_count_reg[16]_i_1_n_5 ,\start_count_reg[16]_i_1_n_6 ,\start_count_reg[16]_i_1_n_7 }),
        .S(start_count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[17] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[16]_i_1_n_6 ),
        .Q(start_count_reg[17]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[18] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[16]_i_1_n_5 ),
        .Q(start_count_reg[18]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[19] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[16]_i_1_n_4 ),
        .Q(start_count_reg[19]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[1] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[0]_i_2_n_6 ),
        .Q(\start_count_reg_n_0_[1] ),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[20] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[20]_i_1_n_7 ),
        .Q(start_count_reg[20]),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[20]_i_1 
       (.CI(\start_count_reg[16]_i_1_n_0 ),
        .CO({\start_count_reg[20]_i_1_n_0 ,\start_count_reg[20]_i_1_n_1 ,\start_count_reg[20]_i_1_n_2 ,\start_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[20]_i_1_n_4 ,\start_count_reg[20]_i_1_n_5 ,\start_count_reg[20]_i_1_n_6 ,\start_count_reg[20]_i_1_n_7 }),
        .S(start_count_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[21] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[20]_i_1_n_6 ),
        .Q(start_count_reg[21]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[22] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[20]_i_1_n_5 ),
        .Q(start_count_reg[22]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[23] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[20]_i_1_n_4 ),
        .Q(start_count_reg[23]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[24] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[24]_i_1_n_7 ),
        .Q(start_count_reg[24]),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[24]_i_1 
       (.CI(\start_count_reg[20]_i_1_n_0 ),
        .CO({\NLW_start_count_reg[24]_i_1_CO_UNCONNECTED [3],\start_count_reg[24]_i_1_n_1 ,\start_count_reg[24]_i_1_n_2 ,\start_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[24]_i_1_n_4 ,\start_count_reg[24]_i_1_n_5 ,\start_count_reg[24]_i_1_n_6 ,\start_count_reg[24]_i_1_n_7 }),
        .S(start_count_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[25] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[24]_i_1_n_6 ),
        .Q(start_count_reg[25]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[26] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[24]_i_1_n_5 ),
        .Q(start_count_reg[26]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[27] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[24]_i_1_n_4 ),
        .Q(start_count_reg[27]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[2] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[0]_i_2_n_5 ),
        .Q(\start_count_reg_n_0_[2] ),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[3] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[0]_i_2_n_4 ),
        .Q(\start_count_reg_n_0_[3] ),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[4] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[4]_i_1_n_7 ),
        .Q(\start_count_reg_n_0_[4] ),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[4]_i_1 
       (.CI(\start_count_reg[0]_i_2_n_0 ),
        .CO({\start_count_reg[4]_i_1_n_0 ,\start_count_reg[4]_i_1_n_1 ,\start_count_reg[4]_i_1_n_2 ,\start_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[4]_i_1_n_4 ,\start_count_reg[4]_i_1_n_5 ,\start_count_reg[4]_i_1_n_6 ,\start_count_reg[4]_i_1_n_7 }),
        .S({start_count_reg[7:5],\start_count_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[5] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[4]_i_1_n_6 ),
        .Q(start_count_reg[5]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[6] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[4]_i_1_n_5 ),
        .Q(start_count_reg[6]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[7] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[4]_i_1_n_4 ),
        .Q(start_count_reg[7]),
        .R(\start_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[8] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[8]_i_1_n_7 ),
        .Q(start_count_reg[8]),
        .R(\start_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \start_count_reg[8]_i_1 
       (.CI(\start_count_reg[4]_i_1_n_0 ),
        .CO({\start_count_reg[8]_i_1_n_0 ,\start_count_reg[8]_i_1_n_1 ,\start_count_reg[8]_i_1_n_2 ,\start_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\start_count_reg[8]_i_1_n_4 ,\start_count_reg[8]_i_1_n_5 ,\start_count_reg[8]_i_1_n_6 ,\start_count_reg[8]_i_1_n_7 }),
        .S(start_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \start_count_reg[9] 
       (.C(clk),
        .CE(start_check_reg_n_0),
        .D(\start_count_reg[8]_i_1_n_6 ),
        .Q(start_count_reg[9]),
        .R(\start_count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFB7B7B7)) 
    \step[0]_i_1 
       (.I0(\step_reg_n_0_[0] ),
        .I1(en),
        .I2(in_startup_sync),
        .I3(\step_reg_n_0_[2] ),
        .I4(\step_reg_n_0_[1] ),
        .O(\step[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC0C40808)) 
    \step[1]_i_1 
       (.I0(\step_reg_n_0_[0] ),
        .I1(en),
        .I2(in_startup_sync),
        .I3(\step_reg_n_0_[2] ),
        .I4(\step_reg_n_0_[1] ),
        .O(\step[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC008CC00)) 
    \step[2]_i_1 
       (.I0(\step_reg_n_0_[0] ),
        .I1(en),
        .I2(in_startup_sync),
        .I3(\step_reg_n_0_[2] ),
        .I4(\step_reg_n_0_[1] ),
        .O(\step[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \step_reg[0] 
       (.C(clk_div),
        .CE(1'b1),
        .D(\step[0]_i_1_n_0 ),
        .Q(\step_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \step_reg[1] 
       (.C(clk_div),
        .CE(1'b1),
        .D(\step[1]_i_1_n_0 ),
        .Q(\step_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \step_reg[2] 
       (.C(clk_div),
        .CE(1'b1),
        .D(\step[2]_i_1_n_0 ),
        .Q(\step_reg_n_0_[2] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
