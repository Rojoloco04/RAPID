// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Apr  9 15:31:41 2026
// Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_stepperDriver_0_0_1/top_stepperDriver_0_0_sim_netlist.v
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
    dir_out,
    en,
    pwm_out_step,
    prox_in,
    zero_req,
    en_out,
    num_steps,
    step_go,
    step_total_out);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input dir;
  output dir_out;
  input en;
  output pwm_out_step;
  input prox_in;
  input zero_req;
  output en_out;
  input [20:0]num_steps;
  input step_go;
  output [20:0]step_total_out;

  wire clk;
  wire dir;
  wire dir_out;
  wire en;
  wire en_out;
  wire [20:0]num_steps;
  wire prox_in;
  wire pwm_out_step;
  wire step_go;
  wire [20:0]step_total_out;
  wire zero_req;

  top_stepperDriver_0_0_stepperDriver U0
       (.clk(clk),
        .dir(dir),
        .dir_out(dir_out),
        .en(en),
        .en_out(en_out),
        .num_steps(num_steps[19:0]),
        .prox_in(prox_in),
        .pwm_out_step(pwm_out_step),
        .step_go(step_go),
        .step_total_out(step_total_out),
        .zero_req(zero_req));
endmodule

(* ORIG_REF_NAME = "stepperDriver" *) 
module top_stepperDriver_0_0_stepperDriver
   (step_total_out,
    pwm_out_step,
    en_out,
    dir_out,
    dir,
    prox_in,
    clk,
    step_go,
    zero_req,
    num_steps,
    en);
  output [20:0]step_total_out;
  output pwm_out_step;
  output en_out;
  output dir_out;
  input dir;
  input prox_in;
  input clk;
  input step_go;
  input zero_req;
  input [19:0]num_steps;
  input en;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_10_n_0 ;
  wire \FSM_sequential_state[2]_i_11_n_0 ;
  wire \FSM_sequential_state[2]_i_12_n_0 ;
  wire \FSM_sequential_state[2]_i_13_n_0 ;
  wire \FSM_sequential_state[2]_i_14_n_0 ;
  wire \FSM_sequential_state[2]_i_15_n_0 ;
  wire \FSM_sequential_state[2]_i_16_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire \FSM_sequential_state[2]_i_8_n_0 ;
  wire \FSM_sequential_state[2]_i_9_n_0 ;
  wire clk;
  wire dir;
  wire dir_out;
  wire dir_sig_i_1_n_0;
  wire en;
  wire en_out;
  wire en_sig;
  wire [19:1]in6;
  wire [19:0]num_steps;
  wire p_0_in;
  wire \prox_debounce_count[0]_i_1_n_0 ;
  wire \prox_debounce_count[0]_i_2_n_0 ;
  wire \prox_debounce_count[0]_i_4_n_0 ;
  wire \prox_debounce_count[0]_i_5_n_0 ;
  wire \prox_debounce_count[0]_i_6_n_0 ;
  wire \prox_debounce_count[0]_i_7_n_0 ;
  wire [20:4]prox_debounce_count_reg;
  wire \prox_debounce_count_reg[0]_i_3_n_0 ;
  wire \prox_debounce_count_reg[0]_i_3_n_1 ;
  wire \prox_debounce_count_reg[0]_i_3_n_2 ;
  wire \prox_debounce_count_reg[0]_i_3_n_3 ;
  wire \prox_debounce_count_reg[0]_i_3_n_4 ;
  wire \prox_debounce_count_reg[0]_i_3_n_5 ;
  wire \prox_debounce_count_reg[0]_i_3_n_6 ;
  wire \prox_debounce_count_reg[0]_i_3_n_7 ;
  wire \prox_debounce_count_reg[12]_i_1_n_0 ;
  wire \prox_debounce_count_reg[12]_i_1_n_1 ;
  wire \prox_debounce_count_reg[12]_i_1_n_2 ;
  wire \prox_debounce_count_reg[12]_i_1_n_3 ;
  wire \prox_debounce_count_reg[12]_i_1_n_4 ;
  wire \prox_debounce_count_reg[12]_i_1_n_5 ;
  wire \prox_debounce_count_reg[12]_i_1_n_6 ;
  wire \prox_debounce_count_reg[12]_i_1_n_7 ;
  wire \prox_debounce_count_reg[16]_i_1_n_0 ;
  wire \prox_debounce_count_reg[16]_i_1_n_1 ;
  wire \prox_debounce_count_reg[16]_i_1_n_2 ;
  wire \prox_debounce_count_reg[16]_i_1_n_3 ;
  wire \prox_debounce_count_reg[16]_i_1_n_4 ;
  wire \prox_debounce_count_reg[16]_i_1_n_5 ;
  wire \prox_debounce_count_reg[16]_i_1_n_6 ;
  wire \prox_debounce_count_reg[16]_i_1_n_7 ;
  wire \prox_debounce_count_reg[20]_i_1_n_7 ;
  wire \prox_debounce_count_reg[4]_i_1_n_0 ;
  wire \prox_debounce_count_reg[4]_i_1_n_1 ;
  wire \prox_debounce_count_reg[4]_i_1_n_2 ;
  wire \prox_debounce_count_reg[4]_i_1_n_3 ;
  wire \prox_debounce_count_reg[4]_i_1_n_4 ;
  wire \prox_debounce_count_reg[4]_i_1_n_5 ;
  wire \prox_debounce_count_reg[4]_i_1_n_6 ;
  wire \prox_debounce_count_reg[4]_i_1_n_7 ;
  wire \prox_debounce_count_reg[8]_i_1_n_0 ;
  wire \prox_debounce_count_reg[8]_i_1_n_1 ;
  wire \prox_debounce_count_reg[8]_i_1_n_2 ;
  wire \prox_debounce_count_reg[8]_i_1_n_3 ;
  wire \prox_debounce_count_reg[8]_i_1_n_4 ;
  wire \prox_debounce_count_reg[8]_i_1_n_5 ;
  wire \prox_debounce_count_reg[8]_i_1_n_6 ;
  wire \prox_debounce_count_reg[8]_i_1_n_7 ;
  wire \prox_debounce_count_reg_n_0_[0] ;
  wire \prox_debounce_count_reg_n_0_[1] ;
  wire \prox_debounce_count_reg_n_0_[2] ;
  wire \prox_debounce_count_reg_n_0_[3] ;
  wire prox_in;
  wire prox_stable;
  wire prox_stable_i_1_n_0;
  (* async_reg = "true" *) wire prox_sync1;
  (* async_reg = "true" *) wire prox_sync2;
  wire pwm_out_step;
  wire pwm_sig;
  wire pwm_sig1__0;
  wire pwm_sig_i_2_n_0;
  wire pwm_sig_i_3_n_0;
  wire pwm_sig_i_4_n_0;
  wire pwm_sig_i_5_n_0;
  wire pwm_sig_i_6_n_0;
  wire pwm_sig_i_7_n_0;
  wire run_clk;
  wire run_clk1;
  wire run_clk1_carry__0_i_1_n_0;
  wire run_clk1_carry__0_i_2_n_0;
  wire run_clk1_carry__0_i_3_n_0;
  wire run_clk1_carry__0_i_4_n_0;
  wire run_clk1_carry__0_i_5_n_0;
  wire run_clk1_carry__0_i_6_n_0;
  wire run_clk1_carry__0_i_7_n_0;
  wire run_clk1_carry__0_n_0;
  wire run_clk1_carry__0_n_1;
  wire run_clk1_carry__0_n_2;
  wire run_clk1_carry__0_n_3;
  wire run_clk1_carry__1_i_1_n_0;
  wire run_clk1_carry__1_i_2_n_0;
  wire run_clk1_carry__1_i_3_n_0;
  wire run_clk1_carry__1_i_4_n_0;
  wire run_clk1_carry__1_n_1;
  wire run_clk1_carry__1_n_2;
  wire run_clk1_carry__1_n_3;
  wire run_clk1_carry_i_1_n_0;
  wire run_clk1_carry_i_2_n_0;
  wire run_clk1_carry_i_3_n_0;
  wire run_clk1_carry_i_4_n_0;
  wire run_clk1_carry_i_5_n_0;
  wire run_clk1_carry_i_6_n_0;
  wire run_clk1_carry_n_0;
  wire run_clk1_carry_n_1;
  wire run_clk1_carry_n_2;
  wire run_clk1_carry_n_3;
  wire run_clk_i_1_n_0;
  wire run_clk_prev;
  wire run_counter;
  wire \run_counter[0]_i_3_n_0 ;
  wire \run_counter[0]_i_4_n_0 ;
  wire \run_counter[0]_i_5_n_0 ;
  wire \run_counter[0]_i_6_n_0 ;
  wire \run_counter[0]_i_7_n_0 ;
  wire \run_counter[0]_i_8_n_0 ;
  wire [26:3]run_counter_reg;
  wire \run_counter_reg[0]_i_2_n_0 ;
  wire \run_counter_reg[0]_i_2_n_1 ;
  wire \run_counter_reg[0]_i_2_n_2 ;
  wire \run_counter_reg[0]_i_2_n_3 ;
  wire \run_counter_reg[0]_i_2_n_4 ;
  wire \run_counter_reg[0]_i_2_n_5 ;
  wire \run_counter_reg[0]_i_2_n_6 ;
  wire \run_counter_reg[0]_i_2_n_7 ;
  wire \run_counter_reg[12]_i_1_n_0 ;
  wire \run_counter_reg[12]_i_1_n_1 ;
  wire \run_counter_reg[12]_i_1_n_2 ;
  wire \run_counter_reg[12]_i_1_n_3 ;
  wire \run_counter_reg[12]_i_1_n_4 ;
  wire \run_counter_reg[12]_i_1_n_5 ;
  wire \run_counter_reg[12]_i_1_n_6 ;
  wire \run_counter_reg[12]_i_1_n_7 ;
  wire \run_counter_reg[16]_i_1_n_0 ;
  wire \run_counter_reg[16]_i_1_n_1 ;
  wire \run_counter_reg[16]_i_1_n_2 ;
  wire \run_counter_reg[16]_i_1_n_3 ;
  wire \run_counter_reg[16]_i_1_n_4 ;
  wire \run_counter_reg[16]_i_1_n_5 ;
  wire \run_counter_reg[16]_i_1_n_6 ;
  wire \run_counter_reg[16]_i_1_n_7 ;
  wire \run_counter_reg[20]_i_1_n_0 ;
  wire \run_counter_reg[20]_i_1_n_1 ;
  wire \run_counter_reg[20]_i_1_n_2 ;
  wire \run_counter_reg[20]_i_1_n_3 ;
  wire \run_counter_reg[20]_i_1_n_4 ;
  wire \run_counter_reg[20]_i_1_n_5 ;
  wire \run_counter_reg[20]_i_1_n_6 ;
  wire \run_counter_reg[20]_i_1_n_7 ;
  wire \run_counter_reg[24]_i_1_n_2 ;
  wire \run_counter_reg[24]_i_1_n_3 ;
  wire \run_counter_reg[24]_i_1_n_5 ;
  wire \run_counter_reg[24]_i_1_n_6 ;
  wire \run_counter_reg[24]_i_1_n_7 ;
  wire \run_counter_reg[4]_i_1_n_0 ;
  wire \run_counter_reg[4]_i_1_n_1 ;
  wire \run_counter_reg[4]_i_1_n_2 ;
  wire \run_counter_reg[4]_i_1_n_3 ;
  wire \run_counter_reg[4]_i_1_n_4 ;
  wire \run_counter_reg[4]_i_1_n_5 ;
  wire \run_counter_reg[4]_i_1_n_6 ;
  wire \run_counter_reg[4]_i_1_n_7 ;
  wire \run_counter_reg[8]_i_1_n_0 ;
  wire \run_counter_reg[8]_i_1_n_1 ;
  wire \run_counter_reg[8]_i_1_n_2 ;
  wire \run_counter_reg[8]_i_1_n_3 ;
  wire \run_counter_reg[8]_i_1_n_4 ;
  wire \run_counter_reg[8]_i_1_n_5 ;
  wire \run_counter_reg[8]_i_1_n_6 ;
  wire \run_counter_reg[8]_i_1_n_7 ;
  wire \run_counter_reg_n_0_[0] ;
  wire \run_counter_reg_n_0_[1] ;
  wire \run_counter_reg_n_0_[2] ;
  wire [2:0]state;
  wire [2:0]state__0;
  wire step_go;
  wire step_go_prev;
  wire step_total;
  wire step_total0_carry__0_i_1_n_0;
  wire step_total0_carry__0_i_2_n_0;
  wire step_total0_carry__0_i_3_n_0;
  wire step_total0_carry__0_i_4_n_0;
  wire step_total0_carry__0_n_0;
  wire step_total0_carry__0_n_1;
  wire step_total0_carry__0_n_2;
  wire step_total0_carry__0_n_3;
  wire step_total0_carry__0_n_4;
  wire step_total0_carry__0_n_5;
  wire step_total0_carry__0_n_6;
  wire step_total0_carry__0_n_7;
  wire step_total0_carry__1_i_1_n_0;
  wire step_total0_carry__1_i_2_n_0;
  wire step_total0_carry__1_i_3_n_0;
  wire step_total0_carry__1_i_4_n_0;
  wire step_total0_carry__1_n_0;
  wire step_total0_carry__1_n_1;
  wire step_total0_carry__1_n_2;
  wire step_total0_carry__1_n_3;
  wire step_total0_carry__1_n_4;
  wire step_total0_carry__1_n_5;
  wire step_total0_carry__1_n_6;
  wire step_total0_carry__1_n_7;
  wire step_total0_carry__2_i_1_n_0;
  wire step_total0_carry__2_i_2_n_0;
  wire step_total0_carry__2_i_3_n_0;
  wire step_total0_carry__2_i_4_n_0;
  wire step_total0_carry__2_n_0;
  wire step_total0_carry__2_n_1;
  wire step_total0_carry__2_n_2;
  wire step_total0_carry__2_n_3;
  wire step_total0_carry__2_n_4;
  wire step_total0_carry__2_n_5;
  wire step_total0_carry__2_n_6;
  wire step_total0_carry__2_n_7;
  wire step_total0_carry__3_i_1_n_0;
  wire step_total0_carry__3_i_2_n_0;
  wire step_total0_carry__3_i_3_n_0;
  wire step_total0_carry__3_i_4_n_0;
  wire step_total0_carry__3_n_1;
  wire step_total0_carry__3_n_2;
  wire step_total0_carry__3_n_3;
  wire step_total0_carry__3_n_4;
  wire step_total0_carry__3_n_5;
  wire step_total0_carry__3_n_6;
  wire step_total0_carry__3_n_7;
  wire step_total0_carry_i_1_n_0;
  wire step_total0_carry_i_2_n_0;
  wire step_total0_carry_i_3_n_0;
  wire step_total0_carry_i_4_n_0;
  wire step_total0_carry_n_0;
  wire step_total0_carry_n_1;
  wire step_total0_carry_n_2;
  wire step_total0_carry_n_3;
  wire step_total0_carry_n_4;
  wire step_total0_carry_n_5;
  wire step_total0_carry_n_6;
  wire step_total0_carry_n_7;
  wire \step_total[0]_i_1_n_0 ;
  wire \step_total[20]_i_1_n_0 ;
  wire \step_total[20]_i_3_n_0 ;
  wire \step_total[20]_i_4_n_0 ;
  wire [20:0]step_total_out;
  wire [19:0]steps_remaining;
  wire steps_remaining0_carry__0_i_1_n_0;
  wire steps_remaining0_carry__0_i_2_n_0;
  wire steps_remaining0_carry__0_i_3_n_0;
  wire steps_remaining0_carry__0_i_4_n_0;
  wire steps_remaining0_carry__0_n_0;
  wire steps_remaining0_carry__0_n_1;
  wire steps_remaining0_carry__0_n_2;
  wire steps_remaining0_carry__0_n_3;
  wire steps_remaining0_carry__1_i_1_n_0;
  wire steps_remaining0_carry__1_i_2_n_0;
  wire steps_remaining0_carry__1_i_3_n_0;
  wire steps_remaining0_carry__1_i_4_n_0;
  wire steps_remaining0_carry__1_n_0;
  wire steps_remaining0_carry__1_n_1;
  wire steps_remaining0_carry__1_n_2;
  wire steps_remaining0_carry__1_n_3;
  wire steps_remaining0_carry__2_i_1_n_0;
  wire steps_remaining0_carry__2_i_2_n_0;
  wire steps_remaining0_carry__2_i_3_n_0;
  wire steps_remaining0_carry__2_i_4_n_0;
  wire steps_remaining0_carry__2_n_0;
  wire steps_remaining0_carry__2_n_1;
  wire steps_remaining0_carry__2_n_2;
  wire steps_remaining0_carry__2_n_3;
  wire steps_remaining0_carry__3_i_1_n_0;
  wire steps_remaining0_carry__3_i_2_n_0;
  wire steps_remaining0_carry__3_i_3_n_0;
  wire steps_remaining0_carry__3_n_2;
  wire steps_remaining0_carry__3_n_3;
  wire steps_remaining0_carry_i_1_n_0;
  wire steps_remaining0_carry_i_2_n_0;
  wire steps_remaining0_carry_i_3_n_0;
  wire steps_remaining0_carry_i_4_n_0;
  wire steps_remaining0_carry_n_0;
  wire steps_remaining0_carry_n_1;
  wire steps_remaining0_carry_n_2;
  wire steps_remaining0_carry_n_3;
  wire steps_remaining_1;
  wire \steps_remaining_reg_n_0_[0] ;
  wire \steps_remaining_reg_n_0_[10] ;
  wire \steps_remaining_reg_n_0_[11] ;
  wire \steps_remaining_reg_n_0_[12] ;
  wire \steps_remaining_reg_n_0_[13] ;
  wire \steps_remaining_reg_n_0_[14] ;
  wire \steps_remaining_reg_n_0_[15] ;
  wire \steps_remaining_reg_n_0_[16] ;
  wire \steps_remaining_reg_n_0_[17] ;
  wire \steps_remaining_reg_n_0_[18] ;
  wire \steps_remaining_reg_n_0_[19] ;
  wire \steps_remaining_reg_n_0_[1] ;
  wire \steps_remaining_reg_n_0_[2] ;
  wire \steps_remaining_reg_n_0_[3] ;
  wire \steps_remaining_reg_n_0_[4] ;
  wire \steps_remaining_reg_n_0_[5] ;
  wire \steps_remaining_reg_n_0_[6] ;
  wire \steps_remaining_reg_n_0_[7] ;
  wire \steps_remaining_reg_n_0_[8] ;
  wire \steps_remaining_reg_n_0_[9] ;
  wire wakeup_counter;
  wire [17:1]wakeup_counter0;
  wire wakeup_counter0_carry__0_n_0;
  wire wakeup_counter0_carry__0_n_1;
  wire wakeup_counter0_carry__0_n_2;
  wire wakeup_counter0_carry__0_n_3;
  wire wakeup_counter0_carry__1_n_0;
  wire wakeup_counter0_carry__1_n_1;
  wire wakeup_counter0_carry__1_n_2;
  wire wakeup_counter0_carry__1_n_3;
  wire wakeup_counter0_carry__2_n_0;
  wire wakeup_counter0_carry__2_n_1;
  wire wakeup_counter0_carry__2_n_2;
  wire wakeup_counter0_carry__2_n_3;
  wire wakeup_counter0_carry_n_0;
  wire wakeup_counter0_carry_n_1;
  wire wakeup_counter0_carry_n_2;
  wire wakeup_counter0_carry_n_3;
  wire \wakeup_counter[0]_i_1_n_0 ;
  wire \wakeup_counter[17]_i_1_n_0 ;
  wire \wakeup_counter_reg_n_0_[0] ;
  wire \wakeup_counter_reg_n_0_[10] ;
  wire \wakeup_counter_reg_n_0_[11] ;
  wire \wakeup_counter_reg_n_0_[12] ;
  wire \wakeup_counter_reg_n_0_[13] ;
  wire \wakeup_counter_reg_n_0_[14] ;
  wire \wakeup_counter_reg_n_0_[15] ;
  wire \wakeup_counter_reg_n_0_[16] ;
  wire \wakeup_counter_reg_n_0_[17] ;
  wire \wakeup_counter_reg_n_0_[1] ;
  wire \wakeup_counter_reg_n_0_[2] ;
  wire \wakeup_counter_reg_n_0_[3] ;
  wire \wakeup_counter_reg_n_0_[4] ;
  wire \wakeup_counter_reg_n_0_[5] ;
  wire \wakeup_counter_reg_n_0_[6] ;
  wire \wakeup_counter_reg_n_0_[7] ;
  wire \wakeup_counter_reg_n_0_[8] ;
  wire \wakeup_counter_reg_n_0_[9] ;
  wire zero_clk;
  wire zero_clk1;
  wire zero_clk1_carry__0_i_1_n_0;
  wire zero_clk1_carry__0_i_2_n_0;
  wire zero_clk1_carry__0_i_3_n_0;
  wire zero_clk1_carry__0_i_4_n_0;
  wire zero_clk1_carry__0_i_5_n_0;
  wire zero_clk1_carry__0_i_6_n_0;
  wire zero_clk1_carry__0_i_7_n_0;
  wire zero_clk1_carry__0_n_0;
  wire zero_clk1_carry__0_n_1;
  wire zero_clk1_carry__0_n_2;
  wire zero_clk1_carry__0_n_3;
  wire zero_clk1_carry__1_i_1_n_0;
  wire zero_clk1_carry__1_i_2_n_0;
  wire zero_clk1_carry__1_i_3_n_0;
  wire zero_clk1_carry__1_i_4_n_0;
  wire zero_clk1_carry__1_n_1;
  wire zero_clk1_carry__1_n_2;
  wire zero_clk1_carry__1_n_3;
  wire zero_clk1_carry_i_1_n_0;
  wire zero_clk1_carry_i_2_n_0;
  wire zero_clk1_carry_i_3_n_0;
  wire zero_clk1_carry_i_4_n_0;
  wire zero_clk1_carry_i_5_n_0;
  wire zero_clk1_carry_i_6_n_0;
  wire zero_clk1_carry_n_0;
  wire zero_clk1_carry_n_1;
  wire zero_clk1_carry_n_2;
  wire zero_clk1_carry_n_3;
  wire zero_clk_i_1_n_0;
  wire zero_clk_prev;
  wire zero_counter;
  wire \zero_counter[0]_i_3_n_0 ;
  wire \zero_counter[0]_i_4_n_0 ;
  wire \zero_counter[0]_i_5_n_0 ;
  wire \zero_counter[0]_i_6_n_0 ;
  wire \zero_counter[0]_i_7_n_0 ;
  wire \zero_counter[0]_i_8_n_0 ;
  wire [26:3]zero_counter_reg;
  wire \zero_counter_reg[0]_i_2_n_0 ;
  wire \zero_counter_reg[0]_i_2_n_1 ;
  wire \zero_counter_reg[0]_i_2_n_2 ;
  wire \zero_counter_reg[0]_i_2_n_3 ;
  wire \zero_counter_reg[0]_i_2_n_4 ;
  wire \zero_counter_reg[0]_i_2_n_5 ;
  wire \zero_counter_reg[0]_i_2_n_6 ;
  wire \zero_counter_reg[0]_i_2_n_7 ;
  wire \zero_counter_reg[12]_i_1_n_0 ;
  wire \zero_counter_reg[12]_i_1_n_1 ;
  wire \zero_counter_reg[12]_i_1_n_2 ;
  wire \zero_counter_reg[12]_i_1_n_3 ;
  wire \zero_counter_reg[12]_i_1_n_4 ;
  wire \zero_counter_reg[12]_i_1_n_5 ;
  wire \zero_counter_reg[12]_i_1_n_6 ;
  wire \zero_counter_reg[12]_i_1_n_7 ;
  wire \zero_counter_reg[16]_i_1_n_0 ;
  wire \zero_counter_reg[16]_i_1_n_1 ;
  wire \zero_counter_reg[16]_i_1_n_2 ;
  wire \zero_counter_reg[16]_i_1_n_3 ;
  wire \zero_counter_reg[16]_i_1_n_4 ;
  wire \zero_counter_reg[16]_i_1_n_5 ;
  wire \zero_counter_reg[16]_i_1_n_6 ;
  wire \zero_counter_reg[16]_i_1_n_7 ;
  wire \zero_counter_reg[20]_i_1_n_0 ;
  wire \zero_counter_reg[20]_i_1_n_1 ;
  wire \zero_counter_reg[20]_i_1_n_2 ;
  wire \zero_counter_reg[20]_i_1_n_3 ;
  wire \zero_counter_reg[20]_i_1_n_4 ;
  wire \zero_counter_reg[20]_i_1_n_5 ;
  wire \zero_counter_reg[20]_i_1_n_6 ;
  wire \zero_counter_reg[20]_i_1_n_7 ;
  wire \zero_counter_reg[24]_i_1_n_2 ;
  wire \zero_counter_reg[24]_i_1_n_3 ;
  wire \zero_counter_reg[24]_i_1_n_5 ;
  wire \zero_counter_reg[24]_i_1_n_6 ;
  wire \zero_counter_reg[24]_i_1_n_7 ;
  wire \zero_counter_reg[4]_i_1_n_0 ;
  wire \zero_counter_reg[4]_i_1_n_1 ;
  wire \zero_counter_reg[4]_i_1_n_2 ;
  wire \zero_counter_reg[4]_i_1_n_3 ;
  wire \zero_counter_reg[4]_i_1_n_4 ;
  wire \zero_counter_reg[4]_i_1_n_5 ;
  wire \zero_counter_reg[4]_i_1_n_6 ;
  wire \zero_counter_reg[4]_i_1_n_7 ;
  wire \zero_counter_reg[8]_i_1_n_0 ;
  wire \zero_counter_reg[8]_i_1_n_1 ;
  wire \zero_counter_reg[8]_i_1_n_2 ;
  wire \zero_counter_reg[8]_i_1_n_3 ;
  wire \zero_counter_reg[8]_i_1_n_4 ;
  wire \zero_counter_reg[8]_i_1_n_5 ;
  wire \zero_counter_reg[8]_i_1_n_6 ;
  wire \zero_counter_reg[8]_i_1_n_7 ;
  wire \zero_counter_reg_n_0_[0] ;
  wire \zero_counter_reg_n_0_[1] ;
  wire \zero_counter_reg_n_0_[2] ;
  wire zero_req;
  wire zero_req_prev;
  wire [3:0]\NLW_prox_debounce_count_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_prox_debounce_count_reg[20]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_run_clk1_carry_O_UNCONNECTED;
  wire [3:0]NLW_run_clk1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_run_clk1_carry__1_O_UNCONNECTED;
  wire [3:2]\NLW_run_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_run_counter_reg[24]_i_1_O_UNCONNECTED ;
  wire [3:3]NLW_step_total0_carry__3_CO_UNCONNECTED;
  wire [3:2]NLW_steps_remaining0_carry__3_CO_UNCONNECTED;
  wire [3:3]NLW_steps_remaining0_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_wakeup_counter0_carry__3_CO_UNCONNECTED;
  wire [3:1]NLW_wakeup_counter0_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_zero_clk1_carry_O_UNCONNECTED;
  wire [3:0]NLW_zero_clk1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_zero_clk1_carry__1_O_UNCONNECTED;
  wire [3:2]\NLW_zero_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_zero_counter_reg[24]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hAAAAAAAAB8B8BAB8)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state__0[0]),
        .I1(\FSM_sequential_state[2]_i_3_n_0 ),
        .I2(state[0]),
        .I3(\FSM_sequential_state[0]_i_3_n_0 ),
        .I4(p_0_in),
        .I5(\FSM_sequential_state[2]_i_6_n_0 ),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000D00000FFFF)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(zero_req),
        .I1(zero_req_prev),
        .I2(state[1]),
        .I3(en),
        .I4(state[2]),
        .I5(state[0]),
        .O(state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[0]_i_3 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\FSM_sequential_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABBABAAAA88A8)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state__0[1]),
        .I1(\FSM_sequential_state[2]_i_3_n_0 ),
        .I2(\FSM_sequential_state[2]_i_4_n_0 ),
        .I3(p_0_in),
        .I4(\FSM_sequential_state[2]_i_6_n_0 ),
        .I5(state[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000F0DD0)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(zero_req),
        .I1(zero_req_prev),
        .I2(state[2]),
        .I3(state[0]),
        .I4(state[1]),
        .O(state__0[1]));
  LUT6 #(
    .INIT(64'hAAAABBABAAAA88A8)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state__0[2]),
        .I1(\FSM_sequential_state[2]_i_3_n_0 ),
        .I2(\FSM_sequential_state[2]_i_4_n_0 ),
        .I3(p_0_in),
        .I4(\FSM_sequential_state[2]_i_6_n_0 ),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_state[2]_i_10 
       (.I0(state[0]),
        .I1(state[2]),
        .O(\FSM_sequential_state[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \FSM_sequential_state[2]_i_11 
       (.I0(\FSM_sequential_state[2]_i_14_n_0 ),
        .I1(num_steps[5]),
        .I2(num_steps[0]),
        .I3(num_steps[7]),
        .I4(num_steps[6]),
        .I5(\FSM_sequential_state[2]_i_15_n_0 ),
        .O(\FSM_sequential_state[2]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \FSM_sequential_state[2]_i_12 
       (.I0(num_steps[16]),
        .I1(num_steps[17]),
        .I2(num_steps[18]),
        .I3(num_steps[19]),
        .I4(\FSM_sequential_state[2]_i_16_n_0 ),
        .O(\FSM_sequential_state[2]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_sequential_state[2]_i_13 
       (.I0(\wakeup_counter_reg_n_0_[4] ),
        .I1(\wakeup_counter_reg_n_0_[5] ),
        .I2(\wakeup_counter_reg_n_0_[6] ),
        .I3(\wakeup_counter_reg_n_0_[8] ),
        .I4(\wakeup_counter_reg_n_0_[7] ),
        .O(\FSM_sequential_state[2]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_state[2]_i_14 
       (.I0(num_steps[11]),
        .I1(num_steps[10]),
        .I2(num_steps[9]),
        .I3(num_steps[8]),
        .O(\FSM_sequential_state[2]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_state[2]_i_15 
       (.I0(num_steps[4]),
        .I1(num_steps[3]),
        .I2(num_steps[2]),
        .I3(num_steps[1]),
        .O(\FSM_sequential_state[2]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_state[2]_i_16 
       (.I0(num_steps[15]),
        .I1(num_steps[14]),
        .I2(num_steps[13]),
        .I3(num_steps[12]),
        .O(\FSM_sequential_state[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h00000000D0000000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(zero_req),
        .I1(zero_req_prev),
        .I2(en),
        .I3(state[0]),
        .I4(state[1]),
        .I5(state[2]),
        .O(state__0[2]));
  LUT6 #(
    .INIT(64'h00FC00CC0000CCAA)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(prox_stable),
        .I1(pwm_sig1__0),
        .I2(pwm_sig_i_3_n_0),
        .I3(state[2]),
        .I4(state[1]),
        .I5(state[0]),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h000BFFFF)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(\FSM_sequential_state[2]_i_8_n_0 ),
        .I1(\wakeup_counter_reg_n_0_[14] ),
        .I2(\wakeup_counter_reg_n_0_[15] ),
        .I3(\wakeup_counter_reg_n_0_[16] ),
        .I4(\wakeup_counter_reg_n_0_[17] ),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0000080008000800)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(\FSM_sequential_state[2]_i_9_n_0 ),
        .I1(\FSM_sequential_state[2]_i_10_n_0 ),
        .I2(step_go_prev),
        .I3(step_go),
        .I4(\FSM_sequential_state[2]_i_11_n_0 ),
        .I5(\FSM_sequential_state[2]_i_12_n_0 ),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_7 
       (.I0(zero_req),
        .I1(zero_req_prev),
        .O(pwm_sig1__0));
  LUT6 #(
    .INIT(64'h0101010101010111)) 
    \FSM_sequential_state[2]_i_8 
       (.I0(\wakeup_counter_reg_n_0_[13] ),
        .I1(\wakeup_counter_reg_n_0_[12] ),
        .I2(\wakeup_counter_reg_n_0_[11] ),
        .I3(\wakeup_counter_reg_n_0_[10] ),
        .I4(\wakeup_counter_reg_n_0_[9] ),
        .I5(\FSM_sequential_state[2]_i_13_n_0 ),
        .O(\FSM_sequential_state[2]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_9 
       (.I0(en),
        .I1(state[1]),
        .O(\FSM_sequential_state[2]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "running:011,done:100,idle:001,wakeup:010,zeroing:000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "running:011,done:100,idle:001,wakeup:010,zeroing:000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "running:011,done:100,idle:001,wakeup:010,zeroing:000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEFE82028)) 
    dir_sig_i_1
       (.I0(dir),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(dir_out),
        .O(dir_sig_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dir_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(dir_sig_i_1_n_0),
        .Q(dir_out),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h31)) 
    en_sig_i_1
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .O(en_sig));
  FDRE #(
    .INIT(1'b0)) 
    en_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(en_sig),
        .Q(en_out),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \prox_debounce_count[0]_i_1 
       (.I0(prox_sync2),
        .O(\prox_debounce_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h555555555555DFFF)) 
    \prox_debounce_count[0]_i_2 
       (.I0(prox_debounce_count_reg[20]),
        .I1(\prox_debounce_count[0]_i_4_n_0 ),
        .I2(prox_debounce_count_reg[16]),
        .I3(prox_debounce_count_reg[17]),
        .I4(prox_debounce_count_reg[19]),
        .I5(prox_debounce_count_reg[18]),
        .O(\prox_debounce_count[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000010FF)) 
    \prox_debounce_count[0]_i_4 
       (.I0(prox_debounce_count_reg[10]),
        .I1(prox_debounce_count_reg[11]),
        .I2(\prox_debounce_count[0]_i_6_n_0 ),
        .I3(prox_debounce_count_reg[12]),
        .I4(\prox_debounce_count[0]_i_7_n_0 ),
        .O(\prox_debounce_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \prox_debounce_count[0]_i_5 
       (.I0(\prox_debounce_count_reg_n_0_[0] ),
        .O(\prox_debounce_count[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5555555557FFFFFF)) 
    \prox_debounce_count[0]_i_6 
       (.I0(prox_debounce_count_reg[9]),
        .I1(prox_debounce_count_reg[5]),
        .I2(prox_debounce_count_reg[4]),
        .I3(prox_debounce_count_reg[6]),
        .I4(prox_debounce_count_reg[7]),
        .I5(prox_debounce_count_reg[8]),
        .O(\prox_debounce_count[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \prox_debounce_count[0]_i_7 
       (.I0(prox_debounce_count_reg[15]),
        .I1(prox_debounce_count_reg[13]),
        .I2(prox_debounce_count_reg[14]),
        .O(\prox_debounce_count[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[0] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[0]_i_3_n_7 ),
        .Q(\prox_debounce_count_reg_n_0_[0] ),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\prox_debounce_count_reg[0]_i_3_n_0 ,\prox_debounce_count_reg[0]_i_3_n_1 ,\prox_debounce_count_reg[0]_i_3_n_2 ,\prox_debounce_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\prox_debounce_count_reg[0]_i_3_n_4 ,\prox_debounce_count_reg[0]_i_3_n_5 ,\prox_debounce_count_reg[0]_i_3_n_6 ,\prox_debounce_count_reg[0]_i_3_n_7 }),
        .S({\prox_debounce_count_reg_n_0_[3] ,\prox_debounce_count_reg_n_0_[2] ,\prox_debounce_count_reg_n_0_[1] ,\prox_debounce_count[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[10] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[8]_i_1_n_5 ),
        .Q(prox_debounce_count_reg[10]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[11] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[8]_i_1_n_4 ),
        .Q(prox_debounce_count_reg[11]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[12] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[12]_i_1_n_7 ),
        .Q(prox_debounce_count_reg[12]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[12]_i_1 
       (.CI(\prox_debounce_count_reg[8]_i_1_n_0 ),
        .CO({\prox_debounce_count_reg[12]_i_1_n_0 ,\prox_debounce_count_reg[12]_i_1_n_1 ,\prox_debounce_count_reg[12]_i_1_n_2 ,\prox_debounce_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prox_debounce_count_reg[12]_i_1_n_4 ,\prox_debounce_count_reg[12]_i_1_n_5 ,\prox_debounce_count_reg[12]_i_1_n_6 ,\prox_debounce_count_reg[12]_i_1_n_7 }),
        .S(prox_debounce_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[13] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[12]_i_1_n_6 ),
        .Q(prox_debounce_count_reg[13]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[14] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[12]_i_1_n_5 ),
        .Q(prox_debounce_count_reg[14]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[15] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[12]_i_1_n_4 ),
        .Q(prox_debounce_count_reg[15]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[16] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[16]_i_1_n_7 ),
        .Q(prox_debounce_count_reg[16]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[16]_i_1 
       (.CI(\prox_debounce_count_reg[12]_i_1_n_0 ),
        .CO({\prox_debounce_count_reg[16]_i_1_n_0 ,\prox_debounce_count_reg[16]_i_1_n_1 ,\prox_debounce_count_reg[16]_i_1_n_2 ,\prox_debounce_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prox_debounce_count_reg[16]_i_1_n_4 ,\prox_debounce_count_reg[16]_i_1_n_5 ,\prox_debounce_count_reg[16]_i_1_n_6 ,\prox_debounce_count_reg[16]_i_1_n_7 }),
        .S(prox_debounce_count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[17] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[16]_i_1_n_6 ),
        .Q(prox_debounce_count_reg[17]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[18] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[16]_i_1_n_5 ),
        .Q(prox_debounce_count_reg[18]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[19] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[16]_i_1_n_4 ),
        .Q(prox_debounce_count_reg[19]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[1] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[0]_i_3_n_6 ),
        .Q(\prox_debounce_count_reg_n_0_[1] ),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[20] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[20]_i_1_n_7 ),
        .Q(prox_debounce_count_reg[20]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[20]_i_1 
       (.CI(\prox_debounce_count_reg[16]_i_1_n_0 ),
        .CO(\NLW_prox_debounce_count_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_prox_debounce_count_reg[20]_i_1_O_UNCONNECTED [3:1],\prox_debounce_count_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,prox_debounce_count_reg[20]}));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[2] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[0]_i_3_n_5 ),
        .Q(\prox_debounce_count_reg_n_0_[2] ),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[3] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[0]_i_3_n_4 ),
        .Q(\prox_debounce_count_reg_n_0_[3] ),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[4] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[4]_i_1_n_7 ),
        .Q(prox_debounce_count_reg[4]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[4]_i_1 
       (.CI(\prox_debounce_count_reg[0]_i_3_n_0 ),
        .CO({\prox_debounce_count_reg[4]_i_1_n_0 ,\prox_debounce_count_reg[4]_i_1_n_1 ,\prox_debounce_count_reg[4]_i_1_n_2 ,\prox_debounce_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prox_debounce_count_reg[4]_i_1_n_4 ,\prox_debounce_count_reg[4]_i_1_n_5 ,\prox_debounce_count_reg[4]_i_1_n_6 ,\prox_debounce_count_reg[4]_i_1_n_7 }),
        .S(prox_debounce_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[5] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[4]_i_1_n_6 ),
        .Q(prox_debounce_count_reg[5]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[6] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[4]_i_1_n_5 ),
        .Q(prox_debounce_count_reg[6]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[7] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[4]_i_1_n_4 ),
        .Q(prox_debounce_count_reg[7]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[8] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[8]_i_1_n_7 ),
        .Q(prox_debounce_count_reg[8]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \prox_debounce_count_reg[8]_i_1 
       (.CI(\prox_debounce_count_reg[4]_i_1_n_0 ),
        .CO({\prox_debounce_count_reg[8]_i_1_n_0 ,\prox_debounce_count_reg[8]_i_1_n_1 ,\prox_debounce_count_reg[8]_i_1_n_2 ,\prox_debounce_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prox_debounce_count_reg[8]_i_1_n_4 ,\prox_debounce_count_reg[8]_i_1_n_5 ,\prox_debounce_count_reg[8]_i_1_n_6 ,\prox_debounce_count_reg[8]_i_1_n_7 }),
        .S(prox_debounce_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \prox_debounce_count_reg[9] 
       (.C(clk),
        .CE(\prox_debounce_count[0]_i_2_n_0 ),
        .D(\prox_debounce_count_reg[8]_i_1_n_6 ),
        .Q(prox_debounce_count_reg[9]),
        .R(\prox_debounce_count[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB0)) 
    prox_stable_i_1
       (.I0(prox_stable),
        .I1(\prox_debounce_count[0]_i_2_n_0 ),
        .I2(prox_sync2),
        .O(prox_stable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    prox_stable_reg
       (.C(clk),
        .CE(1'b1),
        .D(prox_stable_i_1_n_0),
        .Q(prox_stable),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    prox_sync1_reg
       (.C(clk),
        .CE(1'b1),
        .D(prox_in),
        .Q(prox_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    prox_sync2_reg
       (.C(clk),
        .CE(1'b1),
        .D(prox_sync1),
        .Q(prox_sync2),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    pwm_sig_i_1
       (.I0(pwm_sig_i_2_n_0),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(en),
        .I5(zero_clk),
        .O(pwm_sig));
  LUT6 #(
    .INIT(64'h0000000080008080)) 
    pwm_sig_i_2
       (.I0(\FSM_sequential_state[0]_i_3_n_0 ),
        .I1(state[0]),
        .I2(run_clk),
        .I3(zero_req_prev),
        .I4(zero_req),
        .I5(pwm_sig_i_3_n_0),
        .O(pwm_sig_i_2_n_0));
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    pwm_sig_i_3
       (.I0(pwm_sig_i_4_n_0),
        .I1(pwm_sig_i_5_n_0),
        .I2(pwm_sig_i_6_n_0),
        .I3(pwm_sig_i_7_n_0),
        .I4(en),
        .O(pwm_sig_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_sig_i_4
       (.I0(\steps_remaining_reg_n_0_[6] ),
        .I1(\steps_remaining_reg_n_0_[7] ),
        .I2(\steps_remaining_reg_n_0_[8] ),
        .I3(\steps_remaining_reg_n_0_[9] ),
        .O(pwm_sig_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    pwm_sig_i_5
       (.I0(\steps_remaining_reg_n_0_[14] ),
        .I1(\steps_remaining_reg_n_0_[15] ),
        .I2(\steps_remaining_reg_n_0_[18] ),
        .I3(\steps_remaining_reg_n_0_[19] ),
        .I4(\steps_remaining_reg_n_0_[17] ),
        .I5(\steps_remaining_reg_n_0_[16] ),
        .O(pwm_sig_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    pwm_sig_i_6
       (.I0(\steps_remaining_reg_n_0_[13] ),
        .I1(\steps_remaining_reg_n_0_[12] ),
        .I2(\steps_remaining_reg_n_0_[11] ),
        .I3(\steps_remaining_reg_n_0_[10] ),
        .I4(\steps_remaining_reg_n_0_[0] ),
        .I5(\steps_remaining_reg_n_0_[1] ),
        .O(pwm_sig_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    pwm_sig_i_7
       (.I0(\steps_remaining_reg_n_0_[2] ),
        .I1(\steps_remaining_reg_n_0_[3] ),
        .I2(\steps_remaining_reg_n_0_[4] ),
        .I3(\steps_remaining_reg_n_0_[5] ),
        .O(pwm_sig_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pwm_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(pwm_sig),
        .Q(pwm_out_step),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 run_clk1_carry
       (.CI(1'b0),
        .CO({run_clk1_carry_n_0,run_clk1_carry_n_1,run_clk1_carry_n_2,run_clk1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,run_clk1_carry_i_1_n_0,run_clk1_carry_i_2_n_0}),
        .O(NLW_run_clk1_carry_O_UNCONNECTED[3:0]),
        .S({run_clk1_carry_i_3_n_0,run_clk1_carry_i_4_n_0,run_clk1_carry_i_5_n_0,run_clk1_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 run_clk1_carry__0
       (.CI(run_clk1_carry_n_0),
        .CO({run_clk1_carry__0_n_0,run_clk1_carry__0_n_1,run_clk1_carry__0_n_2,run_clk1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,run_clk1_carry__0_i_1_n_0,run_clk1_carry__0_i_2_n_0,run_clk1_carry__0_i_3_n_0}),
        .O(NLW_run_clk1_carry__0_O_UNCONNECTED[3:0]),
        .S({run_clk1_carry__0_i_4_n_0,run_clk1_carry__0_i_5_n_0,run_clk1_carry__0_i_6_n_0,run_clk1_carry__0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h7)) 
    run_clk1_carry__0_i_1
       (.I0(run_counter_reg[17]),
        .I1(run_counter_reg[16]),
        .O(run_clk1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    run_clk1_carry__0_i_2
       (.I0(run_counter_reg[15]),
        .I1(run_counter_reg[14]),
        .O(run_clk1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry__0_i_3
       (.I0(run_counter_reg[12]),
        .I1(run_counter_reg[13]),
        .O(run_clk1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry__0_i_4
       (.I0(run_counter_reg[19]),
        .I1(run_counter_reg[18]),
        .O(run_clk1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    run_clk1_carry__0_i_5
       (.I0(run_counter_reg[16]),
        .I1(run_counter_reg[17]),
        .O(run_clk1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    run_clk1_carry__0_i_6
       (.I0(run_counter_reg[14]),
        .I1(run_counter_reg[15]),
        .O(run_clk1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    run_clk1_carry__0_i_7
       (.I0(run_counter_reg[12]),
        .I1(run_counter_reg[13]),
        .O(run_clk1_carry__0_i_7_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 run_clk1_carry__1
       (.CI(run_clk1_carry__0_n_0),
        .CO({run_clk1,run_clk1_carry__1_n_1,run_clk1_carry__1_n_2,run_clk1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_run_clk1_carry__1_O_UNCONNECTED[3:0]),
        .S({run_clk1_carry__1_i_1_n_0,run_clk1_carry__1_i_2_n_0,run_clk1_carry__1_i_3_n_0,run_clk1_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    run_clk1_carry__1_i_1
       (.I0(run_counter_reg[26]),
        .O(run_clk1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry__1_i_2
       (.I0(run_counter_reg[25]),
        .I1(run_counter_reg[24]),
        .O(run_clk1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry__1_i_3
       (.I0(run_counter_reg[23]),
        .I1(run_counter_reg[22]),
        .O(run_clk1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry__1_i_4
       (.I0(run_counter_reg[21]),
        .I1(run_counter_reg[20]),
        .O(run_clk1_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    run_clk1_carry_i_1
       (.I0(run_counter_reg[7]),
        .O(run_clk1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry_i_2
       (.I0(run_counter_reg[5]),
        .I1(run_counter_reg[4]),
        .O(run_clk1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry_i_3
       (.I0(run_counter_reg[11]),
        .I1(run_counter_reg[10]),
        .O(run_clk1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    run_clk1_carry_i_4
       (.I0(run_counter_reg[8]),
        .I1(run_counter_reg[9]),
        .O(run_clk1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    run_clk1_carry_i_5
       (.I0(run_counter_reg[7]),
        .I1(run_counter_reg[6]),
        .O(run_clk1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    run_clk1_carry_i_6
       (.I0(run_counter_reg[4]),
        .I1(run_counter_reg[5]),
        .O(run_clk1_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    run_clk_i_1
       (.I0(run_clk1),
        .I1(run_counter_reg[17]),
        .I2(run_counter_reg[26]),
        .I3(\run_counter[0]_i_3_n_0 ),
        .I4(\run_counter[0]_i_4_n_0 ),
        .I5(\run_counter[0]_i_5_n_0 ),
        .O(run_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    run_clk_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(run_clk),
        .Q(run_clk_prev),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    run_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(run_clk_i_1_n_0),
        .Q(run_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h5555545555555555)) 
    \run_counter[0]_i_1 
       (.I0(run_clk1),
        .I1(run_counter_reg[17]),
        .I2(run_counter_reg[26]),
        .I3(\run_counter[0]_i_3_n_0 ),
        .I4(\run_counter[0]_i_4_n_0 ),
        .I5(\run_counter[0]_i_5_n_0 ),
        .O(run_counter));
  LUT2 #(
    .INIT(4'h1)) 
    \run_counter[0]_i_3 
       (.I0(run_counter_reg[21]),
        .I1(run_counter_reg[20]),
        .O(\run_counter[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \run_counter[0]_i_4 
       (.I0(run_counter_reg[24]),
        .I1(run_counter_reg[25]),
        .I2(run_counter_reg[19]),
        .I3(run_counter_reg[18]),
        .I4(run_counter_reg[23]),
        .I5(run_counter_reg[22]),
        .O(\run_counter[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4FFFFFFFFFFFFFFF)) 
    \run_counter[0]_i_5 
       (.I0(run_counter_reg[12]),
        .I1(\run_counter[0]_i_7_n_0 ),
        .I2(run_counter_reg[16]),
        .I3(run_counter_reg[13]),
        .I4(run_counter_reg[14]),
        .I5(run_counter_reg[15]),
        .O(\run_counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \run_counter[0]_i_6 
       (.I0(\run_counter_reg_n_0_[0] ),
        .O(\run_counter[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h11111115FFFFFFFF)) 
    \run_counter[0]_i_7 
       (.I0(\run_counter[0]_i_8_n_0 ),
        .I1(run_counter_reg[6]),
        .I2(run_counter_reg[4]),
        .I3(run_counter_reg[5]),
        .I4(run_counter_reg[3]),
        .I5(run_counter_reg[11]),
        .O(\run_counter[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \run_counter[0]_i_8 
       (.I0(run_counter_reg[10]),
        .I1(run_counter_reg[7]),
        .I2(run_counter_reg[8]),
        .I3(run_counter_reg[9]),
        .O(\run_counter[0]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[0]_i_2_n_7 ),
        .Q(\run_counter_reg_n_0_[0] ),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\run_counter_reg[0]_i_2_n_0 ,\run_counter_reg[0]_i_2_n_1 ,\run_counter_reg[0]_i_2_n_2 ,\run_counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\run_counter_reg[0]_i_2_n_4 ,\run_counter_reg[0]_i_2_n_5 ,\run_counter_reg[0]_i_2_n_6 ,\run_counter_reg[0]_i_2_n_7 }),
        .S({run_counter_reg[3],\run_counter_reg_n_0_[2] ,\run_counter_reg_n_0_[1] ,\run_counter[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[8]_i_1_n_5 ),
        .Q(run_counter_reg[10]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[8]_i_1_n_4 ),
        .Q(run_counter_reg[11]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[12]_i_1_n_7 ),
        .Q(run_counter_reg[12]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[12]_i_1 
       (.CI(\run_counter_reg[8]_i_1_n_0 ),
        .CO({\run_counter_reg[12]_i_1_n_0 ,\run_counter_reg[12]_i_1_n_1 ,\run_counter_reg[12]_i_1_n_2 ,\run_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\run_counter_reg[12]_i_1_n_4 ,\run_counter_reg[12]_i_1_n_5 ,\run_counter_reg[12]_i_1_n_6 ,\run_counter_reg[12]_i_1_n_7 }),
        .S(run_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[12]_i_1_n_6 ),
        .Q(run_counter_reg[13]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[12]_i_1_n_5 ),
        .Q(run_counter_reg[14]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[12]_i_1_n_4 ),
        .Q(run_counter_reg[15]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[16]_i_1_n_7 ),
        .Q(run_counter_reg[16]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[16]_i_1 
       (.CI(\run_counter_reg[12]_i_1_n_0 ),
        .CO({\run_counter_reg[16]_i_1_n_0 ,\run_counter_reg[16]_i_1_n_1 ,\run_counter_reg[16]_i_1_n_2 ,\run_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\run_counter_reg[16]_i_1_n_4 ,\run_counter_reg[16]_i_1_n_5 ,\run_counter_reg[16]_i_1_n_6 ,\run_counter_reg[16]_i_1_n_7 }),
        .S(run_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[16]_i_1_n_6 ),
        .Q(run_counter_reg[17]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[16]_i_1_n_5 ),
        .Q(run_counter_reg[18]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[16]_i_1_n_4 ),
        .Q(run_counter_reg[19]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[0]_i_2_n_6 ),
        .Q(\run_counter_reg_n_0_[1] ),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[20]_i_1_n_7 ),
        .Q(run_counter_reg[20]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[20]_i_1 
       (.CI(\run_counter_reg[16]_i_1_n_0 ),
        .CO({\run_counter_reg[20]_i_1_n_0 ,\run_counter_reg[20]_i_1_n_1 ,\run_counter_reg[20]_i_1_n_2 ,\run_counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\run_counter_reg[20]_i_1_n_4 ,\run_counter_reg[20]_i_1_n_5 ,\run_counter_reg[20]_i_1_n_6 ,\run_counter_reg[20]_i_1_n_7 }),
        .S(run_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[20]_i_1_n_6 ),
        .Q(run_counter_reg[21]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[20]_i_1_n_5 ),
        .Q(run_counter_reg[22]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[20]_i_1_n_4 ),
        .Q(run_counter_reg[23]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[24]_i_1_n_7 ),
        .Q(run_counter_reg[24]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[24]_i_1 
       (.CI(\run_counter_reg[20]_i_1_n_0 ),
        .CO({\NLW_run_counter_reg[24]_i_1_CO_UNCONNECTED [3:2],\run_counter_reg[24]_i_1_n_2 ,\run_counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_run_counter_reg[24]_i_1_O_UNCONNECTED [3],\run_counter_reg[24]_i_1_n_5 ,\run_counter_reg[24]_i_1_n_6 ,\run_counter_reg[24]_i_1_n_7 }),
        .S({1'b0,run_counter_reg[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[24]_i_1_n_6 ),
        .Q(run_counter_reg[25]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[24]_i_1_n_5 ),
        .Q(run_counter_reg[26]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[0]_i_2_n_5 ),
        .Q(\run_counter_reg_n_0_[2] ),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[0]_i_2_n_4 ),
        .Q(run_counter_reg[3]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[4]_i_1_n_7 ),
        .Q(run_counter_reg[4]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[4]_i_1 
       (.CI(\run_counter_reg[0]_i_2_n_0 ),
        .CO({\run_counter_reg[4]_i_1_n_0 ,\run_counter_reg[4]_i_1_n_1 ,\run_counter_reg[4]_i_1_n_2 ,\run_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\run_counter_reg[4]_i_1_n_4 ,\run_counter_reg[4]_i_1_n_5 ,\run_counter_reg[4]_i_1_n_6 ,\run_counter_reg[4]_i_1_n_7 }),
        .S(run_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[4]_i_1_n_6 ),
        .Q(run_counter_reg[5]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[4]_i_1_n_5 ),
        .Q(run_counter_reg[6]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[4]_i_1_n_4 ),
        .Q(run_counter_reg[7]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[8]_i_1_n_7 ),
        .Q(run_counter_reg[8]),
        .R(run_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \run_counter_reg[8]_i_1 
       (.CI(\run_counter_reg[4]_i_1_n_0 ),
        .CO({\run_counter_reg[8]_i_1_n_0 ,\run_counter_reg[8]_i_1_n_1 ,\run_counter_reg[8]_i_1_n_2 ,\run_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\run_counter_reg[8]_i_1_n_4 ,\run_counter_reg[8]_i_1_n_5 ,\run_counter_reg[8]_i_1_n_6 ,\run_counter_reg[8]_i_1_n_7 }),
        .S(run_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \run_counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\run_counter_reg[8]_i_1_n_6 ),
        .Q(run_counter_reg[9]),
        .R(run_counter));
  FDRE #(
    .INIT(1'b0)) 
    step_go_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(step_go),
        .Q(step_go_prev),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 step_total0_carry
       (.CI(1'b0),
        .CO({step_total0_carry_n_0,step_total0_carry_n_1,step_total0_carry_n_2,step_total0_carry_n_3}),
        .CYINIT(step_total_out[0]),
        .DI({step_total_out[3:1],dir}),
        .O({step_total0_carry_n_4,step_total0_carry_n_5,step_total0_carry_n_6,step_total0_carry_n_7}),
        .S({step_total0_carry_i_1_n_0,step_total0_carry_i_2_n_0,step_total0_carry_i_3_n_0,step_total0_carry_i_4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 step_total0_carry__0
       (.CI(step_total0_carry_n_0),
        .CO({step_total0_carry__0_n_0,step_total0_carry__0_n_1,step_total0_carry__0_n_2,step_total0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(step_total_out[7:4]),
        .O({step_total0_carry__0_n_4,step_total0_carry__0_n_5,step_total0_carry__0_n_6,step_total0_carry__0_n_7}),
        .S({step_total0_carry__0_i_1_n_0,step_total0_carry__0_i_2_n_0,step_total0_carry__0_i_3_n_0,step_total0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__0_i_1
       (.I0(step_total_out[7]),
        .I1(step_total_out[8]),
        .O(step_total0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__0_i_2
       (.I0(step_total_out[6]),
        .I1(step_total_out[7]),
        .O(step_total0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__0_i_3
       (.I0(step_total_out[5]),
        .I1(step_total_out[6]),
        .O(step_total0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__0_i_4
       (.I0(step_total_out[4]),
        .I1(step_total_out[5]),
        .O(step_total0_carry__0_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 step_total0_carry__1
       (.CI(step_total0_carry__0_n_0),
        .CO({step_total0_carry__1_n_0,step_total0_carry__1_n_1,step_total0_carry__1_n_2,step_total0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(step_total_out[11:8]),
        .O({step_total0_carry__1_n_4,step_total0_carry__1_n_5,step_total0_carry__1_n_6,step_total0_carry__1_n_7}),
        .S({step_total0_carry__1_i_1_n_0,step_total0_carry__1_i_2_n_0,step_total0_carry__1_i_3_n_0,step_total0_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__1_i_1
       (.I0(step_total_out[11]),
        .I1(step_total_out[12]),
        .O(step_total0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__1_i_2
       (.I0(step_total_out[10]),
        .I1(step_total_out[11]),
        .O(step_total0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__1_i_3
       (.I0(step_total_out[9]),
        .I1(step_total_out[10]),
        .O(step_total0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__1_i_4
       (.I0(step_total_out[8]),
        .I1(step_total_out[9]),
        .O(step_total0_carry__1_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 step_total0_carry__2
       (.CI(step_total0_carry__1_n_0),
        .CO({step_total0_carry__2_n_0,step_total0_carry__2_n_1,step_total0_carry__2_n_2,step_total0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(step_total_out[15:12]),
        .O({step_total0_carry__2_n_4,step_total0_carry__2_n_5,step_total0_carry__2_n_6,step_total0_carry__2_n_7}),
        .S({step_total0_carry__2_i_1_n_0,step_total0_carry__2_i_2_n_0,step_total0_carry__2_i_3_n_0,step_total0_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__2_i_1
       (.I0(step_total_out[15]),
        .I1(step_total_out[16]),
        .O(step_total0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__2_i_2
       (.I0(step_total_out[14]),
        .I1(step_total_out[15]),
        .O(step_total0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__2_i_3
       (.I0(step_total_out[13]),
        .I1(step_total_out[14]),
        .O(step_total0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__2_i_4
       (.I0(step_total_out[12]),
        .I1(step_total_out[13]),
        .O(step_total0_carry__2_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 step_total0_carry__3
       (.CI(step_total0_carry__2_n_0),
        .CO({NLW_step_total0_carry__3_CO_UNCONNECTED[3],step_total0_carry__3_n_1,step_total0_carry__3_n_2,step_total0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,step_total_out[18:16]}),
        .O({step_total0_carry__3_n_4,step_total0_carry__3_n_5,step_total0_carry__3_n_6,step_total0_carry__3_n_7}),
        .S({step_total0_carry__3_i_1_n_0,step_total0_carry__3_i_2_n_0,step_total0_carry__3_i_3_n_0,step_total0_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__3_i_1
       (.I0(step_total_out[19]),
        .I1(step_total_out[20]),
        .O(step_total0_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__3_i_2
       (.I0(step_total_out[18]),
        .I1(step_total_out[19]),
        .O(step_total0_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__3_i_3
       (.I0(step_total_out[17]),
        .I1(step_total_out[18]),
        .O(step_total0_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry__3_i_4
       (.I0(step_total_out[16]),
        .I1(step_total_out[17]),
        .O(step_total0_carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry_i_1
       (.I0(step_total_out[3]),
        .I1(step_total_out[4]),
        .O(step_total0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry_i_2
       (.I0(step_total_out[2]),
        .I1(step_total_out[3]),
        .O(step_total0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry_i_3
       (.I0(step_total_out[1]),
        .I1(step_total_out[2]),
        .O(step_total0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    step_total0_carry_i_4
       (.I0(step_total_out[1]),
        .I1(dir),
        .O(step_total0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \step_total[0]_i_1 
       (.I0(step_total_out[0]),
        .O(\step_total[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEE00EFEEEE0000)) 
    \step_total[20]_i_1 
       (.I0(\step_total[20]_i_3_n_0 ),
        .I1(\step_total[20]_i_4_n_0 ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .I5(prox_stable),
        .O(\step_total[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0004)) 
    \step_total[20]_i_2 
       (.I0(state[1]),
        .I1(prox_stable),
        .I2(state[2]),
        .I3(state[0]),
        .I4(\step_total[20]_i_4_n_0 ),
        .I5(\step_total[20]_i_3_n_0 ),
        .O(step_total));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \step_total[20]_i_3 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(run_clk_prev),
        .I4(run_clk),
        .I5(pwm_sig_i_3_n_0),
        .O(\step_total[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \step_total[20]_i_4 
       (.I0(en),
        .I1(state[1]),
        .I2(zero_clk_prev),
        .I3(zero_clk),
        .I4(state[2]),
        .I5(state[0]),
        .O(\step_total[20]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[0] 
       (.C(clk),
        .CE(step_total),
        .D(\step_total[0]_i_1_n_0 ),
        .Q(step_total_out[0]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[10] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__1_n_6),
        .Q(step_total_out[10]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[11] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__1_n_5),
        .Q(step_total_out[11]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[12] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__1_n_4),
        .Q(step_total_out[12]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[13] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__2_n_7),
        .Q(step_total_out[13]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[14] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__2_n_6),
        .Q(step_total_out[14]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[15] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__2_n_5),
        .Q(step_total_out[15]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[16] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__2_n_4),
        .Q(step_total_out[16]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[17] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__3_n_7),
        .Q(step_total_out[17]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[18] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__3_n_6),
        .Q(step_total_out[18]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[19] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__3_n_5),
        .Q(step_total_out[19]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[1] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry_n_7),
        .Q(step_total_out[1]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[20] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__3_n_4),
        .Q(step_total_out[20]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[2] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry_n_6),
        .Q(step_total_out[2]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[3] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry_n_5),
        .Q(step_total_out[3]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[4] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry_n_4),
        .Q(step_total_out[4]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[5] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__0_n_7),
        .Q(step_total_out[5]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[6] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__0_n_6),
        .Q(step_total_out[6]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[7] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__0_n_5),
        .Q(step_total_out[7]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[8] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__0_n_4),
        .Q(step_total_out[8]),
        .R(\step_total[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \step_total_reg[9] 
       (.C(clk),
        .CE(step_total),
        .D(step_total0_carry__1_n_7),
        .Q(step_total_out[9]),
        .R(\step_total[20]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 steps_remaining0_carry
       (.CI(1'b0),
        .CO({steps_remaining0_carry_n_0,steps_remaining0_carry_n_1,steps_remaining0_carry_n_2,steps_remaining0_carry_n_3}),
        .CYINIT(\steps_remaining_reg_n_0_[0] ),
        .DI({\steps_remaining_reg_n_0_[4] ,\steps_remaining_reg_n_0_[3] ,\steps_remaining_reg_n_0_[2] ,\steps_remaining_reg_n_0_[1] }),
        .O(in6[4:1]),
        .S({steps_remaining0_carry_i_1_n_0,steps_remaining0_carry_i_2_n_0,steps_remaining0_carry_i_3_n_0,steps_remaining0_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 steps_remaining0_carry__0
       (.CI(steps_remaining0_carry_n_0),
        .CO({steps_remaining0_carry__0_n_0,steps_remaining0_carry__0_n_1,steps_remaining0_carry__0_n_2,steps_remaining0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\steps_remaining_reg_n_0_[8] ,\steps_remaining_reg_n_0_[7] ,\steps_remaining_reg_n_0_[6] ,\steps_remaining_reg_n_0_[5] }),
        .O(in6[8:5]),
        .S({steps_remaining0_carry__0_i_1_n_0,steps_remaining0_carry__0_i_2_n_0,steps_remaining0_carry__0_i_3_n_0,steps_remaining0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__0_i_1
       (.I0(\steps_remaining_reg_n_0_[8] ),
        .O(steps_remaining0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__0_i_2
       (.I0(\steps_remaining_reg_n_0_[7] ),
        .O(steps_remaining0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__0_i_3
       (.I0(\steps_remaining_reg_n_0_[6] ),
        .O(steps_remaining0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__0_i_4
       (.I0(\steps_remaining_reg_n_0_[5] ),
        .O(steps_remaining0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 steps_remaining0_carry__1
       (.CI(steps_remaining0_carry__0_n_0),
        .CO({steps_remaining0_carry__1_n_0,steps_remaining0_carry__1_n_1,steps_remaining0_carry__1_n_2,steps_remaining0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\steps_remaining_reg_n_0_[12] ,\steps_remaining_reg_n_0_[11] ,\steps_remaining_reg_n_0_[10] ,\steps_remaining_reg_n_0_[9] }),
        .O(in6[12:9]),
        .S({steps_remaining0_carry__1_i_1_n_0,steps_remaining0_carry__1_i_2_n_0,steps_remaining0_carry__1_i_3_n_0,steps_remaining0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__1_i_1
       (.I0(\steps_remaining_reg_n_0_[12] ),
        .O(steps_remaining0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__1_i_2
       (.I0(\steps_remaining_reg_n_0_[11] ),
        .O(steps_remaining0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__1_i_3
       (.I0(\steps_remaining_reg_n_0_[10] ),
        .O(steps_remaining0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__1_i_4
       (.I0(\steps_remaining_reg_n_0_[9] ),
        .O(steps_remaining0_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 steps_remaining0_carry__2
       (.CI(steps_remaining0_carry__1_n_0),
        .CO({steps_remaining0_carry__2_n_0,steps_remaining0_carry__2_n_1,steps_remaining0_carry__2_n_2,steps_remaining0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\steps_remaining_reg_n_0_[16] ,\steps_remaining_reg_n_0_[15] ,\steps_remaining_reg_n_0_[14] ,\steps_remaining_reg_n_0_[13] }),
        .O(in6[16:13]),
        .S({steps_remaining0_carry__2_i_1_n_0,steps_remaining0_carry__2_i_2_n_0,steps_remaining0_carry__2_i_3_n_0,steps_remaining0_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__2_i_1
       (.I0(\steps_remaining_reg_n_0_[16] ),
        .O(steps_remaining0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__2_i_2
       (.I0(\steps_remaining_reg_n_0_[15] ),
        .O(steps_remaining0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__2_i_3
       (.I0(\steps_remaining_reg_n_0_[14] ),
        .O(steps_remaining0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__2_i_4
       (.I0(\steps_remaining_reg_n_0_[13] ),
        .O(steps_remaining0_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 steps_remaining0_carry__3
       (.CI(steps_remaining0_carry__2_n_0),
        .CO({NLW_steps_remaining0_carry__3_CO_UNCONNECTED[3:2],steps_remaining0_carry__3_n_2,steps_remaining0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\steps_remaining_reg_n_0_[18] ,\steps_remaining_reg_n_0_[17] }),
        .O({NLW_steps_remaining0_carry__3_O_UNCONNECTED[3],in6[19:17]}),
        .S({1'b0,steps_remaining0_carry__3_i_1_n_0,steps_remaining0_carry__3_i_2_n_0,steps_remaining0_carry__3_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__3_i_1
       (.I0(\steps_remaining_reg_n_0_[19] ),
        .O(steps_remaining0_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__3_i_2
       (.I0(\steps_remaining_reg_n_0_[18] ),
        .O(steps_remaining0_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry__3_i_3
       (.I0(\steps_remaining_reg_n_0_[17] ),
        .O(steps_remaining0_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry_i_1
       (.I0(\steps_remaining_reg_n_0_[4] ),
        .O(steps_remaining0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry_i_2
       (.I0(\steps_remaining_reg_n_0_[3] ),
        .O(steps_remaining0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry_i_3
       (.I0(\steps_remaining_reg_n_0_[2] ),
        .O(steps_remaining0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    steps_remaining0_carry_i_4
       (.I0(\steps_remaining_reg_n_0_[1] ),
        .O(steps_remaining0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00550CCC)) 
    \steps_remaining[0]_i_1 
       (.I0(\steps_remaining_reg_n_0_[0] ),
        .I1(num_steps[0]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[0]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[10]_i_1 
       (.I0(in6[10]),
        .I1(num_steps[10]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[10]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[11]_i_1 
       (.I0(in6[11]),
        .I1(num_steps[11]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[11]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[12]_i_1 
       (.I0(in6[12]),
        .I1(num_steps[12]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[12]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[13]_i_1 
       (.I0(in6[13]),
        .I1(num_steps[13]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[13]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[14]_i_1 
       (.I0(in6[14]),
        .I1(num_steps[14]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[14]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[15]_i_1 
       (.I0(in6[15]),
        .I1(num_steps[15]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[15]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[16]_i_1 
       (.I0(in6[16]),
        .I1(num_steps[16]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[16]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[17]_i_1 
       (.I0(in6[17]),
        .I1(num_steps[17]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[17]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[18]_i_1 
       (.I0(in6[18]),
        .I1(num_steps[18]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[18]));
  LUT2 #(
    .INIT(4'hE)) 
    \steps_remaining[19]_i_1 
       (.I0(\step_total[20]_i_3_n_0 ),
        .I1(\FSM_sequential_state[2]_i_6_n_0 ),
        .O(steps_remaining_1));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[19]_i_2 
       (.I0(in6[19]),
        .I1(num_steps[19]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[1]_i_1 
       (.I0(in6[1]),
        .I1(num_steps[1]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[2]_i_1 
       (.I0(in6[2]),
        .I1(num_steps[2]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[2]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[3]_i_1 
       (.I0(in6[3]),
        .I1(num_steps[3]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[3]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[4]_i_1 
       (.I0(in6[4]),
        .I1(num_steps[4]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[4]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[5]_i_1 
       (.I0(in6[5]),
        .I1(num_steps[5]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[5]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[6]_i_1 
       (.I0(in6[6]),
        .I1(num_steps[6]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[6]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[7]_i_1 
       (.I0(in6[7]),
        .I1(num_steps[7]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[7]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[8]_i_1 
       (.I0(in6[8]),
        .I1(num_steps[8]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[8]));
  LUT5 #(
    .INIT(32'h00AA0CCC)) 
    \steps_remaining[9]_i_1 
       (.I0(in6[9]),
        .I1(num_steps[9]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(steps_remaining[9]));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[0] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[0]),
        .Q(\steps_remaining_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[10] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[10]),
        .Q(\steps_remaining_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[11] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[11]),
        .Q(\steps_remaining_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[12] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[12]),
        .Q(\steps_remaining_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[13] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[13]),
        .Q(\steps_remaining_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[14] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[14]),
        .Q(\steps_remaining_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[15] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[15]),
        .Q(\steps_remaining_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[16] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[16]),
        .Q(\steps_remaining_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[17] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[17]),
        .Q(\steps_remaining_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[18] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[18]),
        .Q(\steps_remaining_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[19] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[19]),
        .Q(\steps_remaining_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[1] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[1]),
        .Q(\steps_remaining_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[2] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[2]),
        .Q(\steps_remaining_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[3] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[3]),
        .Q(\steps_remaining_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[4] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[4]),
        .Q(\steps_remaining_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[5] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[5]),
        .Q(\steps_remaining_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[6] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[6]),
        .Q(\steps_remaining_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[7] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[7]),
        .Q(\steps_remaining_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[8] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[8]),
        .Q(\steps_remaining_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \steps_remaining_reg[9] 
       (.C(clk),
        .CE(steps_remaining_1),
        .D(steps_remaining[9]),
        .Q(\steps_remaining_reg_n_0_[9] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wakeup_counter0_carry
       (.CI(1'b0),
        .CO({wakeup_counter0_carry_n_0,wakeup_counter0_carry_n_1,wakeup_counter0_carry_n_2,wakeup_counter0_carry_n_3}),
        .CYINIT(\wakeup_counter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wakeup_counter0[4:1]),
        .S({\wakeup_counter_reg_n_0_[4] ,\wakeup_counter_reg_n_0_[3] ,\wakeup_counter_reg_n_0_[2] ,\wakeup_counter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wakeup_counter0_carry__0
       (.CI(wakeup_counter0_carry_n_0),
        .CO({wakeup_counter0_carry__0_n_0,wakeup_counter0_carry__0_n_1,wakeup_counter0_carry__0_n_2,wakeup_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wakeup_counter0[8:5]),
        .S({\wakeup_counter_reg_n_0_[8] ,\wakeup_counter_reg_n_0_[7] ,\wakeup_counter_reg_n_0_[6] ,\wakeup_counter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wakeup_counter0_carry__1
       (.CI(wakeup_counter0_carry__0_n_0),
        .CO({wakeup_counter0_carry__1_n_0,wakeup_counter0_carry__1_n_1,wakeup_counter0_carry__1_n_2,wakeup_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wakeup_counter0[12:9]),
        .S({\wakeup_counter_reg_n_0_[12] ,\wakeup_counter_reg_n_0_[11] ,\wakeup_counter_reg_n_0_[10] ,\wakeup_counter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wakeup_counter0_carry__2
       (.CI(wakeup_counter0_carry__1_n_0),
        .CO({wakeup_counter0_carry__2_n_0,wakeup_counter0_carry__2_n_1,wakeup_counter0_carry__2_n_2,wakeup_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(wakeup_counter0[16:13]),
        .S({\wakeup_counter_reg_n_0_[16] ,\wakeup_counter_reg_n_0_[15] ,\wakeup_counter_reg_n_0_[14] ,\wakeup_counter_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wakeup_counter0_carry__3
       (.CI(wakeup_counter0_carry__2_n_0),
        .CO(NLW_wakeup_counter0_carry__3_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_wakeup_counter0_carry__3_O_UNCONNECTED[3:1],wakeup_counter0[17]}),
        .S({1'b0,1'b0,1'b0,\wakeup_counter_reg_n_0_[17] }));
  LUT1 #(
    .INIT(2'h1)) 
    \wakeup_counter[0]_i_1 
       (.I0(\wakeup_counter_reg_n_0_[0] ),
        .O(\wakeup_counter[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAA0BAA)) 
    \wakeup_counter[17]_i_1 
       (.I0(\FSM_sequential_state[2]_i_6_n_0 ),
        .I1(state[0]),
        .I2(p_0_in),
        .I3(state[1]),
        .I4(state[2]),
        .O(\wakeup_counter[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF04)) 
    \wakeup_counter[17]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(\FSM_sequential_state[2]_i_6_n_0 ),
        .O(wakeup_counter));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[0] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(\wakeup_counter[0]_i_1_n_0 ),
        .Q(\wakeup_counter_reg_n_0_[0] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[10] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[10]),
        .Q(\wakeup_counter_reg_n_0_[10] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[11] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[11]),
        .Q(\wakeup_counter_reg_n_0_[11] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[12] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[12]),
        .Q(\wakeup_counter_reg_n_0_[12] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[13] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[13]),
        .Q(\wakeup_counter_reg_n_0_[13] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[14] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[14]),
        .Q(\wakeup_counter_reg_n_0_[14] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[15] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[15]),
        .Q(\wakeup_counter_reg_n_0_[15] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[16] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[16]),
        .Q(\wakeup_counter_reg_n_0_[16] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[17] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[17]),
        .Q(\wakeup_counter_reg_n_0_[17] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[1] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[1]),
        .Q(\wakeup_counter_reg_n_0_[1] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[2] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[2]),
        .Q(\wakeup_counter_reg_n_0_[2] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[3] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[3]),
        .Q(\wakeup_counter_reg_n_0_[3] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[4] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[4]),
        .Q(\wakeup_counter_reg_n_0_[4] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[5] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[5]),
        .Q(\wakeup_counter_reg_n_0_[5] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[6] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[6]),
        .Q(\wakeup_counter_reg_n_0_[6] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[7] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[7]),
        .Q(\wakeup_counter_reg_n_0_[7] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[8] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[8]),
        .Q(\wakeup_counter_reg_n_0_[8] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wakeup_counter_reg[9] 
       (.C(clk),
        .CE(wakeup_counter),
        .D(wakeup_counter0[9]),
        .Q(\wakeup_counter_reg_n_0_[9] ),
        .R(\wakeup_counter[17]_i_1_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 zero_clk1_carry
       (.CI(1'b0),
        .CO({zero_clk1_carry_n_0,zero_clk1_carry_n_1,zero_clk1_carry_n_2,zero_clk1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,zero_clk1_carry_i_1_n_0,zero_clk1_carry_i_2_n_0}),
        .O(NLW_zero_clk1_carry_O_UNCONNECTED[3:0]),
        .S({zero_clk1_carry_i_3_n_0,zero_clk1_carry_i_4_n_0,zero_clk1_carry_i_5_n_0,zero_clk1_carry_i_6_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 zero_clk1_carry__0
       (.CI(zero_clk1_carry_n_0),
        .CO({zero_clk1_carry__0_n_0,zero_clk1_carry__0_n_1,zero_clk1_carry__0_n_2,zero_clk1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,zero_clk1_carry__0_i_1_n_0,zero_clk1_carry__0_i_2_n_0,zero_clk1_carry__0_i_3_n_0}),
        .O(NLW_zero_clk1_carry__0_O_UNCONNECTED[3:0]),
        .S({zero_clk1_carry__0_i_4_n_0,zero_clk1_carry__0_i_5_n_0,zero_clk1_carry__0_i_6_n_0,zero_clk1_carry__0_i_7_n_0}));
  LUT2 #(
    .INIT(4'h7)) 
    zero_clk1_carry__0_i_1
       (.I0(zero_counter_reg[17]),
        .I1(zero_counter_reg[16]),
        .O(zero_clk1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    zero_clk1_carry__0_i_2
       (.I0(zero_counter_reg[15]),
        .I1(zero_counter_reg[14]),
        .O(zero_clk1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry__0_i_3
       (.I0(zero_counter_reg[12]),
        .I1(zero_counter_reg[13]),
        .O(zero_clk1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry__0_i_4
       (.I0(zero_counter_reg[19]),
        .I1(zero_counter_reg[18]),
        .O(zero_clk1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    zero_clk1_carry__0_i_5
       (.I0(zero_counter_reg[16]),
        .I1(zero_counter_reg[17]),
        .O(zero_clk1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    zero_clk1_carry__0_i_6
       (.I0(zero_counter_reg[14]),
        .I1(zero_counter_reg[15]),
        .O(zero_clk1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    zero_clk1_carry__0_i_7
       (.I0(zero_counter_reg[12]),
        .I1(zero_counter_reg[13]),
        .O(zero_clk1_carry__0_i_7_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 zero_clk1_carry__1
       (.CI(zero_clk1_carry__0_n_0),
        .CO({zero_clk1,zero_clk1_carry__1_n_1,zero_clk1_carry__1_n_2,zero_clk1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_zero_clk1_carry__1_O_UNCONNECTED[3:0]),
        .S({zero_clk1_carry__1_i_1_n_0,zero_clk1_carry__1_i_2_n_0,zero_clk1_carry__1_i_3_n_0,zero_clk1_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    zero_clk1_carry__1_i_1
       (.I0(zero_counter_reg[26]),
        .O(zero_clk1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry__1_i_2
       (.I0(zero_counter_reg[25]),
        .I1(zero_counter_reg[24]),
        .O(zero_clk1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry__1_i_3
       (.I0(zero_counter_reg[23]),
        .I1(zero_counter_reg[22]),
        .O(zero_clk1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry__1_i_4
       (.I0(zero_counter_reg[21]),
        .I1(zero_counter_reg[20]),
        .O(zero_clk1_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    zero_clk1_carry_i_1
       (.I0(zero_counter_reg[7]),
        .O(zero_clk1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry_i_2
       (.I0(zero_counter_reg[5]),
        .I1(zero_counter_reg[4]),
        .O(zero_clk1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry_i_3
       (.I0(zero_counter_reg[11]),
        .I1(zero_counter_reg[10]),
        .O(zero_clk1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    zero_clk1_carry_i_4
       (.I0(zero_counter_reg[8]),
        .I1(zero_counter_reg[9]),
        .O(zero_clk1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    zero_clk1_carry_i_5
       (.I0(zero_counter_reg[7]),
        .I1(zero_counter_reg[6]),
        .O(zero_clk1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    zero_clk1_carry_i_6
       (.I0(zero_counter_reg[4]),
        .I1(zero_counter_reg[5]),
        .O(zero_clk1_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    zero_clk_i_1
       (.I0(zero_clk1),
        .I1(zero_counter_reg[17]),
        .I2(zero_counter_reg[26]),
        .I3(\zero_counter[0]_i_3_n_0 ),
        .I4(\zero_counter[0]_i_4_n_0 ),
        .I5(\zero_counter[0]_i_5_n_0 ),
        .O(zero_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    zero_clk_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(zero_clk),
        .Q(zero_clk_prev),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    zero_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(zero_clk_i_1_n_0),
        .Q(zero_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h5555545555555555)) 
    \zero_counter[0]_i_1 
       (.I0(zero_clk1),
        .I1(zero_counter_reg[17]),
        .I2(zero_counter_reg[26]),
        .I3(\zero_counter[0]_i_3_n_0 ),
        .I4(\zero_counter[0]_i_4_n_0 ),
        .I5(\zero_counter[0]_i_5_n_0 ),
        .O(zero_counter));
  LUT2 #(
    .INIT(4'h1)) 
    \zero_counter[0]_i_3 
       (.I0(zero_counter_reg[21]),
        .I1(zero_counter_reg[20]),
        .O(\zero_counter[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \zero_counter[0]_i_4 
       (.I0(zero_counter_reg[24]),
        .I1(zero_counter_reg[25]),
        .I2(zero_counter_reg[19]),
        .I3(zero_counter_reg[18]),
        .I4(zero_counter_reg[23]),
        .I5(zero_counter_reg[22]),
        .O(\zero_counter[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4FFFFFFFFFFFFFFF)) 
    \zero_counter[0]_i_5 
       (.I0(zero_counter_reg[12]),
        .I1(\zero_counter[0]_i_7_n_0 ),
        .I2(zero_counter_reg[16]),
        .I3(zero_counter_reg[13]),
        .I4(zero_counter_reg[14]),
        .I5(zero_counter_reg[15]),
        .O(\zero_counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \zero_counter[0]_i_6 
       (.I0(\zero_counter_reg_n_0_[0] ),
        .O(\zero_counter[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h11111115FFFFFFFF)) 
    \zero_counter[0]_i_7 
       (.I0(\zero_counter[0]_i_8_n_0 ),
        .I1(zero_counter_reg[6]),
        .I2(zero_counter_reg[4]),
        .I3(zero_counter_reg[5]),
        .I4(zero_counter_reg[3]),
        .I5(zero_counter_reg[11]),
        .O(\zero_counter[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \zero_counter[0]_i_8 
       (.I0(zero_counter_reg[10]),
        .I1(zero_counter_reg[7]),
        .I2(zero_counter_reg[8]),
        .I3(zero_counter_reg[9]),
        .O(\zero_counter[0]_i_8_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \zero_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[0]_i_2_n_7 ),
        .Q(\zero_counter_reg_n_0_[0] ),
        .S(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\zero_counter_reg[0]_i_2_n_0 ,\zero_counter_reg[0]_i_2_n_1 ,\zero_counter_reg[0]_i_2_n_2 ,\zero_counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\zero_counter_reg[0]_i_2_n_4 ,\zero_counter_reg[0]_i_2_n_5 ,\zero_counter_reg[0]_i_2_n_6 ,\zero_counter_reg[0]_i_2_n_7 }),
        .S({zero_counter_reg[3],\zero_counter_reg_n_0_[2] ,\zero_counter_reg_n_0_[1] ,\zero_counter[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[8]_i_1_n_5 ),
        .Q(zero_counter_reg[10]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[8]_i_1_n_4 ),
        .Q(zero_counter_reg[11]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[12]_i_1_n_7 ),
        .Q(zero_counter_reg[12]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[12]_i_1 
       (.CI(\zero_counter_reg[8]_i_1_n_0 ),
        .CO({\zero_counter_reg[12]_i_1_n_0 ,\zero_counter_reg[12]_i_1_n_1 ,\zero_counter_reg[12]_i_1_n_2 ,\zero_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\zero_counter_reg[12]_i_1_n_4 ,\zero_counter_reg[12]_i_1_n_5 ,\zero_counter_reg[12]_i_1_n_6 ,\zero_counter_reg[12]_i_1_n_7 }),
        .S(zero_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[12]_i_1_n_6 ),
        .Q(zero_counter_reg[13]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[12]_i_1_n_5 ),
        .Q(zero_counter_reg[14]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[12]_i_1_n_4 ),
        .Q(zero_counter_reg[15]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[16]_i_1_n_7 ),
        .Q(zero_counter_reg[16]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[16]_i_1 
       (.CI(\zero_counter_reg[12]_i_1_n_0 ),
        .CO({\zero_counter_reg[16]_i_1_n_0 ,\zero_counter_reg[16]_i_1_n_1 ,\zero_counter_reg[16]_i_1_n_2 ,\zero_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\zero_counter_reg[16]_i_1_n_4 ,\zero_counter_reg[16]_i_1_n_5 ,\zero_counter_reg[16]_i_1_n_6 ,\zero_counter_reg[16]_i_1_n_7 }),
        .S(zero_counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[16]_i_1_n_6 ),
        .Q(zero_counter_reg[17]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[16]_i_1_n_5 ),
        .Q(zero_counter_reg[18]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[16]_i_1_n_4 ),
        .Q(zero_counter_reg[19]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[0]_i_2_n_6 ),
        .Q(\zero_counter_reg_n_0_[1] ),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[20]_i_1_n_7 ),
        .Q(zero_counter_reg[20]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[20]_i_1 
       (.CI(\zero_counter_reg[16]_i_1_n_0 ),
        .CO({\zero_counter_reg[20]_i_1_n_0 ,\zero_counter_reg[20]_i_1_n_1 ,\zero_counter_reg[20]_i_1_n_2 ,\zero_counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\zero_counter_reg[20]_i_1_n_4 ,\zero_counter_reg[20]_i_1_n_5 ,\zero_counter_reg[20]_i_1_n_6 ,\zero_counter_reg[20]_i_1_n_7 }),
        .S(zero_counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[20]_i_1_n_6 ),
        .Q(zero_counter_reg[21]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[20]_i_1_n_5 ),
        .Q(zero_counter_reg[22]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[20]_i_1_n_4 ),
        .Q(zero_counter_reg[23]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[24]_i_1_n_7 ),
        .Q(zero_counter_reg[24]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[24]_i_1 
       (.CI(\zero_counter_reg[20]_i_1_n_0 ),
        .CO({\NLW_zero_counter_reg[24]_i_1_CO_UNCONNECTED [3:2],\zero_counter_reg[24]_i_1_n_2 ,\zero_counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_zero_counter_reg[24]_i_1_O_UNCONNECTED [3],\zero_counter_reg[24]_i_1_n_5 ,\zero_counter_reg[24]_i_1_n_6 ,\zero_counter_reg[24]_i_1_n_7 }),
        .S({1'b0,zero_counter_reg[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[24]_i_1_n_6 ),
        .Q(zero_counter_reg[25]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[24]_i_1_n_5 ),
        .Q(zero_counter_reg[26]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[0]_i_2_n_5 ),
        .Q(\zero_counter_reg_n_0_[2] ),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[0]_i_2_n_4 ),
        .Q(zero_counter_reg[3]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[4]_i_1_n_7 ),
        .Q(zero_counter_reg[4]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[4]_i_1 
       (.CI(\zero_counter_reg[0]_i_2_n_0 ),
        .CO({\zero_counter_reg[4]_i_1_n_0 ,\zero_counter_reg[4]_i_1_n_1 ,\zero_counter_reg[4]_i_1_n_2 ,\zero_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\zero_counter_reg[4]_i_1_n_4 ,\zero_counter_reg[4]_i_1_n_5 ,\zero_counter_reg[4]_i_1_n_6 ,\zero_counter_reg[4]_i_1_n_7 }),
        .S(zero_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[4]_i_1_n_6 ),
        .Q(zero_counter_reg[5]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[4]_i_1_n_5 ),
        .Q(zero_counter_reg[6]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[4]_i_1_n_4 ),
        .Q(zero_counter_reg[7]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[8]_i_1_n_7 ),
        .Q(zero_counter_reg[8]),
        .R(zero_counter));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \zero_counter_reg[8]_i_1 
       (.CI(\zero_counter_reg[4]_i_1_n_0 ),
        .CO({\zero_counter_reg[8]_i_1_n_0 ,\zero_counter_reg[8]_i_1_n_1 ,\zero_counter_reg[8]_i_1_n_2 ,\zero_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\zero_counter_reg[8]_i_1_n_4 ,\zero_counter_reg[8]_i_1_n_5 ,\zero_counter_reg[8]_i_1_n_6 ,\zero_counter_reg[8]_i_1_n_7 }),
        .S(zero_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \zero_counter_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_counter_reg[8]_i_1_n_6 ),
        .Q(zero_counter_reg[9]),
        .R(zero_counter));
  FDRE #(
    .INIT(1'b0)) 
    zero_req_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(zero_req),
        .Q(zero_req_prev),
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
