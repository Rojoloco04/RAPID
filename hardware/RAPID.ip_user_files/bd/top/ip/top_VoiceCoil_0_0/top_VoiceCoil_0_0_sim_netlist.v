// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Apr  9 15:31:41 2026
// Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_VoiceCoil_0_0/top_VoiceCoil_0_0_sim_netlist.v
// Design      : top_VoiceCoil_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_VoiceCoil_0_0,VoiceCoil,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "VoiceCoil,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module top_VoiceCoil_0_0
   (clk,
    PWM1,
    PWM1r,
    PWM2,
    PWM2r);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  output PWM1;
  output PWM1r;
  output PWM2;
  output PWM2r;

  wire PWM1r;
  wire PWM2r;
  wire clk;

  assign PWM1 = PWM1r;
  assign PWM2 = PWM2r;
  top_VoiceCoil_0_0_VoiceCoil U0
       (.PWM1r(PWM1r),
        .PWM2r(PWM2r),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "VoiceCoil" *) 
module top_VoiceCoil_0_0_VoiceCoil
   (PWM1r,
    PWM2r,
    clk);
  output PWM1r;
  output PWM2r;
  input clk;

  wire PWM1r;
  wire PWM2r;
  wire PWM_1_sig21_in;
  wire PWM_1_sig2_carry__0_i_1_n_0;
  wire PWM_1_sig2_carry__0_i_2_n_0;
  wire PWM_1_sig2_carry__0_i_3_n_0;
  wire PWM_1_sig2_carry__0_i_4_n_0;
  wire PWM_1_sig2_carry__0_n_3;
  wire PWM_1_sig2_carry__0_n_5;
  wire PWM_1_sig2_carry_i_1_n_0;
  wire PWM_1_sig2_carry_i_2_n_0;
  wire PWM_1_sig2_carry_i_3_n_0;
  wire PWM_1_sig2_carry_i_4_n_0;
  wire PWM_1_sig2_carry_i_5_n_0;
  wire PWM_1_sig2_carry_i_6_n_0;
  wire PWM_1_sig2_carry_n_0;
  wire PWM_1_sig2_carry_n_1;
  wire PWM_1_sig2_carry_n_2;
  wire PWM_1_sig2_carry_n_3;
  wire PWM_2_sig20_in;
  wire PWM_2_sig2_carry__0_i_1_n_0;
  wire PWM_2_sig2_carry__0_i_2_n_0;
  wire PWM_2_sig2_carry__0_i_3_n_0;
  wire PWM_2_sig2_carry__0_i_4_n_0;
  wire PWM_2_sig2_carry__0_n_3;
  wire PWM_2_sig2_carry__0_n_5;
  wire PWM_2_sig2_carry_i_1_n_0;
  wire PWM_2_sig2_carry_i_2_n_0;
  wire PWM_2_sig2_carry_i_3_n_0;
  wire PWM_2_sig2_carry_i_4_n_0;
  wire PWM_2_sig2_carry_i_5_n_0;
  wire PWM_2_sig2_carry_i_6_n_0;
  wire PWM_2_sig2_carry_n_0;
  wire PWM_2_sig2_carry_n_1;
  wire PWM_2_sig2_carry_n_2;
  wire PWM_2_sig2_carry_n_3;
  wire clk;
  wire \clk_div_cnt1[0]_i_2_n_0 ;
  wire [11:0]clk_div_cnt1_reg;
  wire \clk_div_cnt1_reg[0]_i_1_n_0 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_1 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_2 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_3 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_4 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_5 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_6 ;
  wire \clk_div_cnt1_reg[0]_i_1_n_7 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_0 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_1 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_2 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_3 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_4 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_5 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_6 ;
  wire \clk_div_cnt1_reg[4]_i_1_n_7 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_1 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_2 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_3 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_4 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_5 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_6 ;
  wire \clk_div_cnt1_reg[8]_i_1_n_7 ;
  wire \clk_div_cnt2[0]_i_2_n_0 ;
  wire [11:0]clk_div_cnt2_reg;
  wire \clk_div_cnt2_reg[0]_i_1_n_0 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_1 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_2 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_3 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_4 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_5 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_6 ;
  wire \clk_div_cnt2_reg[0]_i_1_n_7 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_0 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_1 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_2 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_3 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_4 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_5 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_6 ;
  wire \clk_div_cnt2_reg[4]_i_1_n_7 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_1 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_2 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_3 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_4 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_5 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_6 ;
  wire \clk_div_cnt2_reg[8]_i_1_n_7 ;
  wire [3:0]NLW_PWM_1_sig2_carry_O_UNCONNECTED;
  wire [3:2]NLW_PWM_1_sig2_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_PWM_1_sig2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_PWM_2_sig2_carry_O_UNCONNECTED;
  wire [3:2]NLW_PWM_2_sig2_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_PWM_2_sig2_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_clk_div_cnt1_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_clk_div_cnt2_reg[8]_i_1_CO_UNCONNECTED ;

  CARRY4 PWM_1_sig2_carry
       (.CI(1'b0),
        .CO({PWM_1_sig2_carry_n_0,PWM_1_sig2_carry_n_1,PWM_1_sig2_carry_n_2,PWM_1_sig2_carry_n_3}),
        .CYINIT(1'b1),
        .DI({PWM_1_sig2_carry_i_1_n_0,1'b0,1'b0,PWM_1_sig2_carry_i_2_n_0}),
        .O(NLW_PWM_1_sig2_carry_O_UNCONNECTED[3:0]),
        .S({PWM_1_sig2_carry_i_3_n_0,PWM_1_sig2_carry_i_4_n_0,PWM_1_sig2_carry_i_5_n_0,PWM_1_sig2_carry_i_6_n_0}));
  CARRY4 PWM_1_sig2_carry__0
       (.CI(PWM_1_sig2_carry_n_0),
        .CO({NLW_PWM_1_sig2_carry__0_CO_UNCONNECTED[3:2],PWM_1_sig21_in,PWM_1_sig2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,PWM_1_sig2_carry__0_i_1_n_0,PWM_1_sig2_carry__0_i_2_n_0}),
        .O({NLW_PWM_1_sig2_carry__0_O_UNCONNECTED[3],PWM_1_sig2_carry__0_n_5,NLW_PWM_1_sig2_carry__0_O_UNCONNECTED[1:0]}),
        .S({1'b0,1'b1,PWM_1_sig2_carry__0_i_3_n_0,PWM_1_sig2_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h7)) 
    PWM_1_sig2_carry__0_i_1
       (.I0(clk_div_cnt1_reg[10]),
        .I1(clk_div_cnt1_reg[11]),
        .O(PWM_1_sig2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    PWM_1_sig2_carry__0_i_2
       (.I0(clk_div_cnt1_reg[8]),
        .I1(clk_div_cnt1_reg[9]),
        .O(PWM_1_sig2_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PWM_1_sig2_carry__0_i_3
       (.I0(clk_div_cnt1_reg[10]),
        .I1(clk_div_cnt1_reg[11]),
        .O(PWM_1_sig2_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PWM_1_sig2_carry__0_i_4
       (.I0(clk_div_cnt1_reg[8]),
        .I1(clk_div_cnt1_reg[9]),
        .O(PWM_1_sig2_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_1_sig2_carry_i_1
       (.I0(clk_div_cnt1_reg[6]),
        .I1(clk_div_cnt1_reg[7]),
        .O(PWM_1_sig2_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    PWM_1_sig2_carry_i_2
       (.I0(clk_div_cnt1_reg[1]),
        .O(PWM_1_sig2_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    PWM_1_sig2_carry_i_3
       (.I0(clk_div_cnt1_reg[6]),
        .I1(clk_div_cnt1_reg[7]),
        .O(PWM_1_sig2_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_1_sig2_carry_i_4
       (.I0(clk_div_cnt1_reg[4]),
        .I1(clk_div_cnt1_reg[5]),
        .O(PWM_1_sig2_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_1_sig2_carry_i_5
       (.I0(clk_div_cnt1_reg[2]),
        .I1(clk_div_cnt1_reg[3]),
        .O(PWM_1_sig2_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    PWM_1_sig2_carry_i_6
       (.I0(clk_div_cnt1_reg[1]),
        .I1(clk_div_cnt1_reg[0]),
        .O(PWM_1_sig2_carry_i_6_n_0));
  FDRE PWM_1_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(PWM_1_sig2_carry__0_n_5),
        .Q(PWM1r),
        .R(1'b0));
  CARRY4 PWM_2_sig2_carry
       (.CI(1'b0),
        .CO({PWM_2_sig2_carry_n_0,PWM_2_sig2_carry_n_1,PWM_2_sig2_carry_n_2,PWM_2_sig2_carry_n_3}),
        .CYINIT(1'b1),
        .DI({PWM_2_sig2_carry_i_1_n_0,1'b0,1'b0,PWM_2_sig2_carry_i_2_n_0}),
        .O(NLW_PWM_2_sig2_carry_O_UNCONNECTED[3:0]),
        .S({PWM_2_sig2_carry_i_3_n_0,PWM_2_sig2_carry_i_4_n_0,PWM_2_sig2_carry_i_5_n_0,PWM_2_sig2_carry_i_6_n_0}));
  CARRY4 PWM_2_sig2_carry__0
       (.CI(PWM_2_sig2_carry_n_0),
        .CO({NLW_PWM_2_sig2_carry__0_CO_UNCONNECTED[3:2],PWM_2_sig20_in,PWM_2_sig2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,PWM_2_sig2_carry__0_i_1_n_0,PWM_2_sig2_carry__0_i_2_n_0}),
        .O({NLW_PWM_2_sig2_carry__0_O_UNCONNECTED[3],PWM_2_sig2_carry__0_n_5,NLW_PWM_2_sig2_carry__0_O_UNCONNECTED[1:0]}),
        .S({1'b0,1'b1,PWM_2_sig2_carry__0_i_3_n_0,PWM_2_sig2_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h7)) 
    PWM_2_sig2_carry__0_i_1
       (.I0(clk_div_cnt2_reg[10]),
        .I1(clk_div_cnt2_reg[11]),
        .O(PWM_2_sig2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    PWM_2_sig2_carry__0_i_2
       (.I0(clk_div_cnt2_reg[8]),
        .I1(clk_div_cnt2_reg[9]),
        .O(PWM_2_sig2_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PWM_2_sig2_carry__0_i_3
       (.I0(clk_div_cnt2_reg[10]),
        .I1(clk_div_cnt2_reg[11]),
        .O(PWM_2_sig2_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PWM_2_sig2_carry__0_i_4
       (.I0(clk_div_cnt2_reg[8]),
        .I1(clk_div_cnt2_reg[9]),
        .O(PWM_2_sig2_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_2_sig2_carry_i_1
       (.I0(clk_div_cnt2_reg[6]),
        .I1(clk_div_cnt2_reg[7]),
        .O(PWM_2_sig2_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    PWM_2_sig2_carry_i_2
       (.I0(clk_div_cnt2_reg[1]),
        .O(PWM_2_sig2_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    PWM_2_sig2_carry_i_3
       (.I0(clk_div_cnt2_reg[6]),
        .I1(clk_div_cnt2_reg[7]),
        .O(PWM_2_sig2_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_2_sig2_carry_i_4
       (.I0(clk_div_cnt2_reg[4]),
        .I1(clk_div_cnt2_reg[5]),
        .O(PWM_2_sig2_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_2_sig2_carry_i_5
       (.I0(clk_div_cnt2_reg[2]),
        .I1(clk_div_cnt2_reg[3]),
        .O(PWM_2_sig2_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    PWM_2_sig2_carry_i_6
       (.I0(clk_div_cnt2_reg[1]),
        .I1(clk_div_cnt2_reg[0]),
        .O(PWM_2_sig2_carry_i_6_n_0));
  FDRE PWM_2_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(PWM_2_sig2_carry__0_n_5),
        .Q(PWM2r),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div_cnt1[0]_i_2 
       (.I0(clk_div_cnt1_reg[0]),
        .O(\clk_div_cnt1[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[0]_i_1_n_7 ),
        .Q(clk_div_cnt1_reg[0]),
        .R(PWM_1_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt1_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clk_div_cnt1_reg[0]_i_1_n_0 ,\clk_div_cnt1_reg[0]_i_1_n_1 ,\clk_div_cnt1_reg[0]_i_1_n_2 ,\clk_div_cnt1_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk_div_cnt1_reg[0]_i_1_n_4 ,\clk_div_cnt1_reg[0]_i_1_n_5 ,\clk_div_cnt1_reg[0]_i_1_n_6 ,\clk_div_cnt1_reg[0]_i_1_n_7 }),
        .S({clk_div_cnt1_reg[3:1],\clk_div_cnt1[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[8]_i_1_n_5 ),
        .Q(clk_div_cnt1_reg[10]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[8]_i_1_n_4 ),
        .Q(clk_div_cnt1_reg[11]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[0]_i_1_n_6 ),
        .Q(clk_div_cnt1_reg[1]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[0]_i_1_n_5 ),
        .Q(clk_div_cnt1_reg[2]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[0]_i_1_n_4 ),
        .Q(clk_div_cnt1_reg[3]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[4]_i_1_n_7 ),
        .Q(clk_div_cnt1_reg[4]),
        .R(PWM_1_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt1_reg[4]_i_1 
       (.CI(\clk_div_cnt1_reg[0]_i_1_n_0 ),
        .CO({\clk_div_cnt1_reg[4]_i_1_n_0 ,\clk_div_cnt1_reg[4]_i_1_n_1 ,\clk_div_cnt1_reg[4]_i_1_n_2 ,\clk_div_cnt1_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_div_cnt1_reg[4]_i_1_n_4 ,\clk_div_cnt1_reg[4]_i_1_n_5 ,\clk_div_cnt1_reg[4]_i_1_n_6 ,\clk_div_cnt1_reg[4]_i_1_n_7 }),
        .S(clk_div_cnt1_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[4]_i_1_n_6 ),
        .Q(clk_div_cnt1_reg[5]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[4]_i_1_n_5 ),
        .Q(clk_div_cnt1_reg[6]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[4]_i_1_n_4 ),
        .Q(clk_div_cnt1_reg[7]),
        .R(PWM_1_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[8]_i_1_n_7 ),
        .Q(clk_div_cnt1_reg[8]),
        .R(PWM_1_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt1_reg[8]_i_1 
       (.CI(\clk_div_cnt1_reg[4]_i_1_n_0 ),
        .CO({\NLW_clk_div_cnt1_reg[8]_i_1_CO_UNCONNECTED [3],\clk_div_cnt1_reg[8]_i_1_n_1 ,\clk_div_cnt1_reg[8]_i_1_n_2 ,\clk_div_cnt1_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_div_cnt1_reg[8]_i_1_n_4 ,\clk_div_cnt1_reg[8]_i_1_n_5 ,\clk_div_cnt1_reg[8]_i_1_n_6 ,\clk_div_cnt1_reg[8]_i_1_n_7 }),
        .S(clk_div_cnt1_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt1_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt1_reg[8]_i_1_n_6 ),
        .Q(clk_div_cnt1_reg[9]),
        .R(PWM_1_sig2_carry__0_n_5));
  LUT1 #(
    .INIT(2'h1)) 
    \clk_div_cnt2[0]_i_2 
       (.I0(clk_div_cnt2_reg[0]),
        .O(\clk_div_cnt2[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[0]_i_1_n_7 ),
        .Q(clk_div_cnt2_reg[0]),
        .R(PWM_2_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt2_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clk_div_cnt2_reg[0]_i_1_n_0 ,\clk_div_cnt2_reg[0]_i_1_n_1 ,\clk_div_cnt2_reg[0]_i_1_n_2 ,\clk_div_cnt2_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clk_div_cnt2_reg[0]_i_1_n_4 ,\clk_div_cnt2_reg[0]_i_1_n_5 ,\clk_div_cnt2_reg[0]_i_1_n_6 ,\clk_div_cnt2_reg[0]_i_1_n_7 }),
        .S({clk_div_cnt2_reg[3:1],\clk_div_cnt2[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[8]_i_1_n_5 ),
        .Q(clk_div_cnt2_reg[10]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[8]_i_1_n_4 ),
        .Q(clk_div_cnt2_reg[11]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[0]_i_1_n_6 ),
        .Q(clk_div_cnt2_reg[1]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[0]_i_1_n_5 ),
        .Q(clk_div_cnt2_reg[2]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[0]_i_1_n_4 ),
        .Q(clk_div_cnt2_reg[3]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[4]_i_1_n_7 ),
        .Q(clk_div_cnt2_reg[4]),
        .R(PWM_2_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt2_reg[4]_i_1 
       (.CI(\clk_div_cnt2_reg[0]_i_1_n_0 ),
        .CO({\clk_div_cnt2_reg[4]_i_1_n_0 ,\clk_div_cnt2_reg[4]_i_1_n_1 ,\clk_div_cnt2_reg[4]_i_1_n_2 ,\clk_div_cnt2_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_div_cnt2_reg[4]_i_1_n_4 ,\clk_div_cnt2_reg[4]_i_1_n_5 ,\clk_div_cnt2_reg[4]_i_1_n_6 ,\clk_div_cnt2_reg[4]_i_1_n_7 }),
        .S(clk_div_cnt2_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[4]_i_1_n_6 ),
        .Q(clk_div_cnt2_reg[5]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[4]_i_1_n_5 ),
        .Q(clk_div_cnt2_reg[6]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[4]_i_1_n_4 ),
        .Q(clk_div_cnt2_reg[7]),
        .R(PWM_2_sig2_carry__0_n_5));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[8]_i_1_n_7 ),
        .Q(clk_div_cnt2_reg[8]),
        .R(PWM_2_sig2_carry__0_n_5));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clk_div_cnt2_reg[8]_i_1 
       (.CI(\clk_div_cnt2_reg[4]_i_1_n_0 ),
        .CO({\NLW_clk_div_cnt2_reg[8]_i_1_CO_UNCONNECTED [3],\clk_div_cnt2_reg[8]_i_1_n_1 ,\clk_div_cnt2_reg[8]_i_1_n_2 ,\clk_div_cnt2_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clk_div_cnt2_reg[8]_i_1_n_4 ,\clk_div_cnt2_reg[8]_i_1_n_5 ,\clk_div_cnt2_reg[8]_i_1_n_6 ,\clk_div_cnt2_reg[8]_i_1_n_7 }),
        .S(clk_div_cnt2_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clk_div_cnt2_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\clk_div_cnt2_reg[8]_i_1_n_6 ),
        .Q(clk_div_cnt2_reg[9]),
        .R(PWM_2_sig2_carry__0_n_5));
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
