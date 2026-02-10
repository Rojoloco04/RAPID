// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Jan 29 15:15:06 2026
// Host        : MDD-ECE-HPG853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/HardSoftCodesign/Hardsoftcodesign/RAPID/RAPID.gen/sources_1/bd/top/ip/top_stepperDriver_0_0_1/top_stepperDriver_0_0_sim_netlist.v
// Design      : top_stepperDriver_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_stepperDriver_0_0,stepperDriver,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "stepperDriver,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module top_stepperDriver_0_0
   (clk,
    dir,
    en,
    phA1,
    phB1,
    phA2,
    phB2,
    reset);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input dir;
  input en;
  output phA1;
  output phB1;
  output phA2;
  output phB2;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset RST" *) (* x_interface_mode = "slave reset" *) (* x_interface_parameter = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;

  wire clk;
  wire dir;
  wire en;
  wire phA1;
  wire phA2;
  wire phB1;
  wire phB2;
  wire reset;

  top_stepperDriver_0_0_stepperDriver U0
       (.clk(clk),
        .dir(dir),
        .en(en),
        .phA1(phA1),
        .phA2(phA2),
        .phB1(phB1),
        .phB2(phB2),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "stepperDriver" *) 
module top_stepperDriver_0_0_stepperDriver
   (phA1,
    phB1,
    phA2,
    phB2,
    en,
    reset,
    clk,
    dir);
  output phA1;
  output phB1;
  output phA2;
  output phB2;
  input en;
  input reset;
  input clk;
  input dir;

  wire [1:0]NS;
  wire \NS_reg[0]_i_1_n_0 ;
  wire \NS_reg[1]_i_1_n_0 ;
  wire \PS[0]_i_1_n_0 ;
  wire \PS[1]_i_1_n_0 ;
  wire clk;
  wire clk_div;
  wire clk_div_i_1_n_0;
  wire clk_div_i_2_n_0;
  wire clk_div_i_3_n_0;
  wire counter;
  wire \counter[9]_i_2_n_0 ;
  wire \counter[9]_i_4_n_0 ;
  wire \counter[9]_i_5_n_0 ;
  wire [9:0]counter_reg;
  wire dir;
  wire en;
  wire [9:0]p_0_in;
  wire phA1;
  wire phA2;
  wire phB1;
  wire phB2;
  wire reset;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \NS_reg[0] 
       (.CLR(1'b0),
        .D(\NS_reg[0]_i_1_n_0 ),
        .G(en),
        .GE(1'b1),
        .Q(NS[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \NS_reg[0]_i_1 
       (.I0(phA1),
        .I1(dir),
        .I2(reset),
        .O(\NS_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \NS_reg[1] 
       (.CLR(1'b0),
        .D(\NS_reg[1]_i_1_n_0 ),
        .G(en),
        .GE(1'b1),
        .Q(NS[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h09)) 
    \NS_reg[1]_i_1 
       (.I0(phB1),
        .I1(dir),
        .I2(reset),
        .O(\NS_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \PS[0]_i_1 
       (.I0(NS[0]),
        .I1(reset),
        .O(\PS[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \PS[1]_i_1 
       (.I0(NS[1]),
        .I1(reset),
        .O(\PS[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \PS_reg[0] 
       (.C(clk_div),
        .CE(1'b1),
        .D(\PS[0]_i_1_n_0 ),
        .Q(phB1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \PS_reg[1] 
       (.C(clk_div),
        .CE(1'b1),
        .D(\PS[1]_i_1_n_0 ),
        .Q(phA1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF0033C8FF0000C8)) 
    clk_div_i_1
       (.I0(counter_reg[2]),
        .I1(counter_reg[4]),
        .I2(counter_reg[3]),
        .I3(counter_reg[9]),
        .I4(clk_div_i_2_n_0),
        .I5(clk_div_i_3_n_0),
        .O(clk_div_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    clk_div_i_2
       (.I0(counter_reg[7]),
        .I1(counter_reg[5]),
        .I2(counter_reg[6]),
        .I3(counter_reg[8]),
        .O(clk_div_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h01FF)) 
    clk_div_i_3
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .I2(counter_reg[2]),
        .I3(counter_reg[3]),
        .O(clk_div_i_3_n_0));
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
       (.I0(counter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter[3]_i_1 
       (.I0(counter_reg[2]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter[4]_i_1 
       (.I0(counter_reg[3]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[2]),
        .I4(counter_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[5]_i_1 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[2]),
        .I3(counter_reg[3]),
        .I4(counter_reg[4]),
        .I5(counter_reg[5]),
        .O(p_0_in[5]));
  LUT3 #(
    .INIT(8'hD2)) 
    \counter[6]_i_1 
       (.I0(counter_reg[5]),
        .I1(\counter[9]_i_5_n_0 ),
        .I2(counter_reg[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \counter[7]_i_1 
       (.I0(counter_reg[5]),
        .I1(counter_reg[6]),
        .I2(\counter[9]_i_5_n_0 ),
        .I3(counter_reg[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \counter[8]_i_1 
       (.I0(counter_reg[6]),
        .I1(counter_reg[5]),
        .I2(counter_reg[7]),
        .I3(\counter[9]_i_5_n_0 ),
        .I4(counter_reg[8]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'h0000FFFF0000FE00)) 
    \counter[9]_i_1 
       (.I0(counter_reg[2]),
        .I1(counter_reg[1]),
        .I2(counter_reg[0]),
        .I3(counter_reg[3]),
        .I4(\counter[9]_i_4_n_0 ),
        .I5(counter_reg[4]),
        .O(counter));
  LUT6 #(
    .INIT(64'hFFFFFFFF00015555)) 
    \counter[9]_i_2 
       (.I0(counter_reg[4]),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[2]),
        .I4(counter_reg[3]),
        .I5(\counter[9]_i_4_n_0 ),
        .O(\counter[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF00008000)) 
    \counter[9]_i_3 
       (.I0(counter_reg[7]),
        .I1(counter_reg[5]),
        .I2(counter_reg[6]),
        .I3(counter_reg[8]),
        .I4(\counter[9]_i_5_n_0 ),
        .I5(counter_reg[9]),
        .O(p_0_in[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter[9]_i_4 
       (.I0(counter_reg[8]),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(counter_reg[7]),
        .I4(counter_reg[9]),
        .O(\counter[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter[9]_i_5 
       (.I0(counter_reg[4]),
        .I1(counter_reg[3]),
        .I2(counter_reg[2]),
        .I3(counter_reg[0]),
        .I4(counter_reg[1]),
        .O(\counter[9]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(counter_reg[0]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(counter_reg[1]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(counter_reg[2]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(counter_reg[3]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(counter_reg[4]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(counter_reg[5]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(counter_reg[6]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(counter_reg[7]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[8]),
        .Q(counter_reg[8]),
        .R(counter));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(\counter[9]_i_2_n_0 ),
        .D(p_0_in[9]),
        .Q(counter_reg[9]),
        .R(counter));
  LUT1 #(
    .INIT(2'h1)) 
    phA2_INST_0
       (.I0(phA1),
        .O(phA2));
  LUT1 #(
    .INIT(2'h1)) 
    phB2_INST_0
       (.I0(phB1),
        .O(phB2));
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
