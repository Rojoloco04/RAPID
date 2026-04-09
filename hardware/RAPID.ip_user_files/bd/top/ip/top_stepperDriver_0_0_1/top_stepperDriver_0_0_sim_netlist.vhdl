-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Apr  9 15:31:41 2026
-- Host        : MDD-ECE-HP3853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/jparrack/Desktop/RAPID/hardware/RAPID.gen/sources_1/bd/top/ip/top_stepperDriver_0_0_1/top_stepperDriver_0_0_sim_netlist.vhdl
-- Design      : top_stepperDriver_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_stepperDriver_0_0_stepperDriver is
  port (
    step_total_out : out STD_LOGIC_VECTOR ( 20 downto 0 );
    pwm_out_step : out STD_LOGIC;
    en_out : out STD_LOGIC;
    dir_out : out STD_LOGIC;
    dir : in STD_LOGIC;
    prox_in : in STD_LOGIC;
    clk : in STD_LOGIC;
    step_go : in STD_LOGIC;
    zero_req : in STD_LOGIC;
    num_steps : in STD_LOGIC_VECTOR ( 19 downto 0 );
    en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_stepperDriver_0_0_stepperDriver : entity is "stepperDriver";
end top_stepperDriver_0_0_stepperDriver;

architecture STRUCTURE of top_stepperDriver_0_0_stepperDriver is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_12_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_13_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_15_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_16_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_9_n_0\ : STD_LOGIC;
  signal \^dir_out\ : STD_LOGIC;
  signal dir_sig_i_1_n_0 : STD_LOGIC;
  signal en_sig : STD_LOGIC;
  signal in6 : STD_LOGIC_VECTOR ( 19 downto 1 );
  signal p_0_in : STD_LOGIC;
  signal \prox_debounce_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \prox_debounce_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \prox_debounce_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \prox_debounce_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \prox_debounce_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \prox_debounce_count[0]_i_7_n_0\ : STD_LOGIC;
  signal prox_debounce_count_reg : STD_LOGIC_VECTOR ( 20 downto 4 );
  signal \prox_debounce_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \prox_debounce_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \prox_debounce_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \prox_debounce_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \prox_debounce_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \prox_debounce_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \prox_debounce_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \prox_debounce_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \prox_debounce_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \prox_debounce_count_reg_n_0_[3]\ : STD_LOGIC;
  signal prox_stable : STD_LOGIC;
  signal prox_stable_i_1_n_0 : STD_LOGIC;
  signal prox_sync1 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of prox_sync1 : signal is "true";
  signal prox_sync2 : STD_LOGIC;
  attribute async_reg of prox_sync2 : signal is "true";
  signal pwm_sig : STD_LOGIC;
  signal \pwm_sig1__0\ : STD_LOGIC;
  signal pwm_sig_i_2_n_0 : STD_LOGIC;
  signal pwm_sig_i_3_n_0 : STD_LOGIC;
  signal pwm_sig_i_4_n_0 : STD_LOGIC;
  signal pwm_sig_i_5_n_0 : STD_LOGIC;
  signal pwm_sig_i_6_n_0 : STD_LOGIC;
  signal pwm_sig_i_7_n_0 : STD_LOGIC;
  signal run_clk : STD_LOGIC;
  signal run_clk1 : STD_LOGIC;
  signal \run_clk1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__0_n_1\ : STD_LOGIC;
  signal \run_clk1_carry__0_n_2\ : STD_LOGIC;
  signal \run_clk1_carry__0_n_3\ : STD_LOGIC;
  signal \run_clk1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \run_clk1_carry__1_n_1\ : STD_LOGIC;
  signal \run_clk1_carry__1_n_2\ : STD_LOGIC;
  signal \run_clk1_carry__1_n_3\ : STD_LOGIC;
  signal run_clk1_carry_i_1_n_0 : STD_LOGIC;
  signal run_clk1_carry_i_2_n_0 : STD_LOGIC;
  signal run_clk1_carry_i_3_n_0 : STD_LOGIC;
  signal run_clk1_carry_i_4_n_0 : STD_LOGIC;
  signal run_clk1_carry_i_5_n_0 : STD_LOGIC;
  signal run_clk1_carry_i_6_n_0 : STD_LOGIC;
  signal run_clk1_carry_n_0 : STD_LOGIC;
  signal run_clk1_carry_n_1 : STD_LOGIC;
  signal run_clk1_carry_n_2 : STD_LOGIC;
  signal run_clk1_carry_n_3 : STD_LOGIC;
  signal run_clk_i_1_n_0 : STD_LOGIC;
  signal run_clk_prev : STD_LOGIC;
  signal run_counter : STD_LOGIC;
  signal \run_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \run_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \run_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \run_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \run_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \run_counter[0]_i_8_n_0\ : STD_LOGIC;
  signal run_counter_reg : STD_LOGIC_VECTOR ( 26 downto 3 );
  signal \run_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \run_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \run_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \run_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \run_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \run_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal step_go_prev : STD_LOGIC;
  signal step_total : STD_LOGIC;
  signal \step_total0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \step_total0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \step_total0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \step_total0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \step_total0_carry__0_n_0\ : STD_LOGIC;
  signal \step_total0_carry__0_n_1\ : STD_LOGIC;
  signal \step_total0_carry__0_n_2\ : STD_LOGIC;
  signal \step_total0_carry__0_n_3\ : STD_LOGIC;
  signal \step_total0_carry__0_n_4\ : STD_LOGIC;
  signal \step_total0_carry__0_n_5\ : STD_LOGIC;
  signal \step_total0_carry__0_n_6\ : STD_LOGIC;
  signal \step_total0_carry__0_n_7\ : STD_LOGIC;
  signal \step_total0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \step_total0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \step_total0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \step_total0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \step_total0_carry__1_n_0\ : STD_LOGIC;
  signal \step_total0_carry__1_n_1\ : STD_LOGIC;
  signal \step_total0_carry__1_n_2\ : STD_LOGIC;
  signal \step_total0_carry__1_n_3\ : STD_LOGIC;
  signal \step_total0_carry__1_n_4\ : STD_LOGIC;
  signal \step_total0_carry__1_n_5\ : STD_LOGIC;
  signal \step_total0_carry__1_n_6\ : STD_LOGIC;
  signal \step_total0_carry__1_n_7\ : STD_LOGIC;
  signal \step_total0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \step_total0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \step_total0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \step_total0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \step_total0_carry__2_n_0\ : STD_LOGIC;
  signal \step_total0_carry__2_n_1\ : STD_LOGIC;
  signal \step_total0_carry__2_n_2\ : STD_LOGIC;
  signal \step_total0_carry__2_n_3\ : STD_LOGIC;
  signal \step_total0_carry__2_n_4\ : STD_LOGIC;
  signal \step_total0_carry__2_n_5\ : STD_LOGIC;
  signal \step_total0_carry__2_n_6\ : STD_LOGIC;
  signal \step_total0_carry__2_n_7\ : STD_LOGIC;
  signal \step_total0_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \step_total0_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \step_total0_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \step_total0_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \step_total0_carry__3_n_1\ : STD_LOGIC;
  signal \step_total0_carry__3_n_2\ : STD_LOGIC;
  signal \step_total0_carry__3_n_3\ : STD_LOGIC;
  signal \step_total0_carry__3_n_4\ : STD_LOGIC;
  signal \step_total0_carry__3_n_5\ : STD_LOGIC;
  signal \step_total0_carry__3_n_6\ : STD_LOGIC;
  signal \step_total0_carry__3_n_7\ : STD_LOGIC;
  signal step_total0_carry_i_1_n_0 : STD_LOGIC;
  signal step_total0_carry_i_2_n_0 : STD_LOGIC;
  signal step_total0_carry_i_3_n_0 : STD_LOGIC;
  signal step_total0_carry_i_4_n_0 : STD_LOGIC;
  signal step_total0_carry_n_0 : STD_LOGIC;
  signal step_total0_carry_n_1 : STD_LOGIC;
  signal step_total0_carry_n_2 : STD_LOGIC;
  signal step_total0_carry_n_3 : STD_LOGIC;
  signal step_total0_carry_n_4 : STD_LOGIC;
  signal step_total0_carry_n_5 : STD_LOGIC;
  signal step_total0_carry_n_6 : STD_LOGIC;
  signal step_total0_carry_n_7 : STD_LOGIC;
  signal \step_total[0]_i_1_n_0\ : STD_LOGIC;
  signal \step_total[20]_i_1_n_0\ : STD_LOGIC;
  signal \step_total[20]_i_3_n_0\ : STD_LOGIC;
  signal \step_total[20]_i_4_n_0\ : STD_LOGIC;
  signal \^step_total_out\ : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal steps_remaining : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \steps_remaining0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_n_1\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_n_2\ : STD_LOGIC;
  signal \steps_remaining0_carry__0_n_3\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_n_1\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_n_2\ : STD_LOGIC;
  signal \steps_remaining0_carry__1_n_3\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_n_1\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_n_2\ : STD_LOGIC;
  signal \steps_remaining0_carry__2_n_3\ : STD_LOGIC;
  signal \steps_remaining0_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \steps_remaining0_carry__3_n_2\ : STD_LOGIC;
  signal \steps_remaining0_carry__3_n_3\ : STD_LOGIC;
  signal steps_remaining0_carry_i_1_n_0 : STD_LOGIC;
  signal steps_remaining0_carry_i_2_n_0 : STD_LOGIC;
  signal steps_remaining0_carry_i_3_n_0 : STD_LOGIC;
  signal steps_remaining0_carry_i_4_n_0 : STD_LOGIC;
  signal steps_remaining0_carry_n_0 : STD_LOGIC;
  signal steps_remaining0_carry_n_1 : STD_LOGIC;
  signal steps_remaining0_carry_n_2 : STD_LOGIC;
  signal steps_remaining0_carry_n_3 : STD_LOGIC;
  signal steps_remaining_1 : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[0]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[10]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[11]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[12]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[13]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[14]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[15]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[16]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[17]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[18]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[19]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[1]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[2]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[3]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[4]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[5]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[6]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[7]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[8]\ : STD_LOGIC;
  signal \steps_remaining_reg_n_0_[9]\ : STD_LOGIC;
  signal wakeup_counter : STD_LOGIC;
  signal wakeup_counter0 : STD_LOGIC_VECTOR ( 17 downto 1 );
  signal \wakeup_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \wakeup_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \wakeup_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \wakeup_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \wakeup_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \wakeup_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \wakeup_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \wakeup_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \wakeup_counter0_carry__2_n_0\ : STD_LOGIC;
  signal \wakeup_counter0_carry__2_n_1\ : STD_LOGIC;
  signal \wakeup_counter0_carry__2_n_2\ : STD_LOGIC;
  signal \wakeup_counter0_carry__2_n_3\ : STD_LOGIC;
  signal wakeup_counter0_carry_n_0 : STD_LOGIC;
  signal wakeup_counter0_carry_n_1 : STD_LOGIC;
  signal wakeup_counter0_carry_n_2 : STD_LOGIC;
  signal wakeup_counter0_carry_n_3 : STD_LOGIC;
  signal \wakeup_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \wakeup_counter[17]_i_1_n_0\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \wakeup_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal zero_clk : STD_LOGIC;
  signal zero_clk1 : STD_LOGIC;
  signal \zero_clk1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__0_n_1\ : STD_LOGIC;
  signal \zero_clk1_carry__0_n_2\ : STD_LOGIC;
  signal \zero_clk1_carry__0_n_3\ : STD_LOGIC;
  signal \zero_clk1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \zero_clk1_carry__1_n_1\ : STD_LOGIC;
  signal \zero_clk1_carry__1_n_2\ : STD_LOGIC;
  signal \zero_clk1_carry__1_n_3\ : STD_LOGIC;
  signal zero_clk1_carry_i_1_n_0 : STD_LOGIC;
  signal zero_clk1_carry_i_2_n_0 : STD_LOGIC;
  signal zero_clk1_carry_i_3_n_0 : STD_LOGIC;
  signal zero_clk1_carry_i_4_n_0 : STD_LOGIC;
  signal zero_clk1_carry_i_5_n_0 : STD_LOGIC;
  signal zero_clk1_carry_i_6_n_0 : STD_LOGIC;
  signal zero_clk1_carry_n_0 : STD_LOGIC;
  signal zero_clk1_carry_n_1 : STD_LOGIC;
  signal zero_clk1_carry_n_2 : STD_LOGIC;
  signal zero_clk1_carry_n_3 : STD_LOGIC;
  signal zero_clk_i_1_n_0 : STD_LOGIC;
  signal zero_clk_prev : STD_LOGIC;
  signal zero_counter : STD_LOGIC;
  signal \zero_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \zero_counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \zero_counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \zero_counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \zero_counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \zero_counter[0]_i_8_n_0\ : STD_LOGIC;
  signal zero_counter_reg : STD_LOGIC_VECTOR ( 26 downto 3 );
  signal \zero_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \zero_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \zero_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \zero_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \zero_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal zero_req_prev : STD_LOGIC;
  signal \NLW_prox_debounce_count_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_prox_debounce_count_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_run_clk1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_run_clk1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_run_clk1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_run_counter_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_run_counter_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_step_total0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_steps_remaining0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_steps_remaining0_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wakeup_counter0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wakeup_counter0_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_zero_clk1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_clk1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_clk1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_zero_counter_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_zero_counter_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_10\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_4\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "running:011,done:100,idle:001,wakeup:010,zeroing:000";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "running:011,done:100,idle:001,wakeup:010,zeroing:000";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "running:011,done:100,idle:001,wakeup:010,zeroing:000";
  attribute SOFT_HLUTNM of en_sig_i_1 : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \prox_debounce_count_reg[8]_i_1\ : label is 11;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of prox_sync1_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of prox_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of prox_sync2_reg : label is std.standard.true;
  attribute KEEP of prox_sync2_reg : label is "yes";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of run_clk1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \run_clk1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \run_clk1_carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \run_counter_reg[8]_i_1\ : label is 11;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of step_total0_carry : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \step_total0_carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \step_total0_carry__1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \step_total0_carry__2\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \step_total0_carry__3\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of steps_remaining0_carry : label is 35;
  attribute ADDER_THRESHOLD of \steps_remaining0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \steps_remaining0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \steps_remaining0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \steps_remaining0_carry__3\ : label is 35;
  attribute SOFT_HLUTNM of \steps_remaining[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \steps_remaining[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \steps_remaining[2]_i_1\ : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD of wakeup_counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \wakeup_counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \wakeup_counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \wakeup_counter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \wakeup_counter0_carry__3\ : label is 35;
  attribute COMPARATOR_THRESHOLD of zero_clk1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \zero_clk1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \zero_clk1_carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \zero_counter_reg[8]_i_1\ : label is 11;
begin
  dir_out <= \^dir_out\;
  step_total_out(20 downto 0) <= \^step_total_out\(20 downto 0);
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAB8B8BAB8"
    )
        port map (
      I0 => \state__0\(0),
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => state(0),
      I3 => \FSM_sequential_state[0]_i_3_n_0\,
      I4 => p_0_in,
      I5 => \FSM_sequential_state[2]_i_6_n_0\,
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000D00000FFFF"
    )
        port map (
      I0 => zero_req,
      I1 => zero_req_prev,
      I2 => state(1),
      I3 => en,
      I4 => state(2),
      I5 => state(0),
      O => \state__0\(0)
    );
\FSM_sequential_state[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      O => \FSM_sequential_state[0]_i_3_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABBABAAAA88A8"
    )
        port map (
      I0 => \state__0\(1),
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => p_0_in,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => state(1),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000F0DD0"
    )
        port map (
      I0 => zero_req,
      I1 => zero_req_prev,
      I2 => state(2),
      I3 => state(0),
      I4 => state(1),
      O => \state__0\(1)
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABBABAAAA88A8"
    )
        port map (
      I0 => \state__0\(2),
      I1 => \FSM_sequential_state[2]_i_3_n_0\,
      I2 => \FSM_sequential_state[2]_i_4_n_0\,
      I3 => p_0_in,
      I4 => \FSM_sequential_state[2]_i_6_n_0\,
      I5 => state(2),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      O => \FSM_sequential_state[2]_i_10_n_0\
    );
\FSM_sequential_state[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_14_n_0\,
      I1 => num_steps(5),
      I2 => num_steps(0),
      I3 => num_steps(7),
      I4 => num_steps(6),
      I5 => \FSM_sequential_state[2]_i_15_n_0\,
      O => \FSM_sequential_state[2]_i_11_n_0\
    );
\FSM_sequential_state[2]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => num_steps(16),
      I1 => num_steps(17),
      I2 => num_steps(18),
      I3 => num_steps(19),
      I4 => \FSM_sequential_state[2]_i_16_n_0\,
      O => \FSM_sequential_state[2]_i_12_n_0\
    );
\FSM_sequential_state[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \wakeup_counter_reg_n_0_[4]\,
      I1 => \wakeup_counter_reg_n_0_[5]\,
      I2 => \wakeup_counter_reg_n_0_[6]\,
      I3 => \wakeup_counter_reg_n_0_[8]\,
      I4 => \wakeup_counter_reg_n_0_[7]\,
      O => \FSM_sequential_state[2]_i_13_n_0\
    );
\FSM_sequential_state[2]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => num_steps(11),
      I1 => num_steps(10),
      I2 => num_steps(9),
      I3 => num_steps(8),
      O => \FSM_sequential_state[2]_i_14_n_0\
    );
\FSM_sequential_state[2]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_steps(4),
      I1 => num_steps(3),
      I2 => num_steps(2),
      I3 => num_steps(1),
      O => \FSM_sequential_state[2]_i_15_n_0\
    );
\FSM_sequential_state[2]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => num_steps(15),
      I1 => num_steps(14),
      I2 => num_steps(13),
      I3 => num_steps(12),
      O => \FSM_sequential_state[2]_i_16_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000D0000000"
    )
        port map (
      I0 => zero_req,
      I1 => zero_req_prev,
      I2 => en,
      I3 => state(0),
      I4 => state(1),
      I5 => state(2),
      O => \state__0\(2)
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FC00CC0000CCAA"
    )
        port map (
      I0 => prox_stable,
      I1 => \pwm_sig1__0\,
      I2 => pwm_sig_i_3_n_0,
      I3 => state(2),
      I4 => state(1),
      I5 => state(0),
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000BFFFF"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_8_n_0\,
      I1 => \wakeup_counter_reg_n_0_[14]\,
      I2 => \wakeup_counter_reg_n_0_[15]\,
      I3 => \wakeup_counter_reg_n_0_[16]\,
      I4 => \wakeup_counter_reg_n_0_[17]\,
      O => p_0_in
    );
\FSM_sequential_state[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080008000800"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_9_n_0\,
      I1 => \FSM_sequential_state[2]_i_10_n_0\,
      I2 => step_go_prev,
      I3 => step_go,
      I4 => \FSM_sequential_state[2]_i_11_n_0\,
      I5 => \FSM_sequential_state[2]_i_12_n_0\,
      O => \FSM_sequential_state[2]_i_6_n_0\
    );
\FSM_sequential_state[2]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => zero_req,
      I1 => zero_req_prev,
      O => \pwm_sig1__0\
    );
\FSM_sequential_state[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010101010111"
    )
        port map (
      I0 => \wakeup_counter_reg_n_0_[13]\,
      I1 => \wakeup_counter_reg_n_0_[12]\,
      I2 => \wakeup_counter_reg_n_0_[11]\,
      I3 => \wakeup_counter_reg_n_0_[10]\,
      I4 => \wakeup_counter_reg_n_0_[9]\,
      I5 => \FSM_sequential_state[2]_i_13_n_0\,
      O => \FSM_sequential_state[2]_i_8_n_0\
    );
\FSM_sequential_state[2]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => en,
      I1 => state(1),
      O => \FSM_sequential_state[2]_i_9_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2),
      R => '0'
    );
dir_sig_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFE82028"
    )
        port map (
      I0 => dir,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      I4 => \^dir_out\,
      O => dir_sig_i_1_n_0
    );
dir_sig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dir_sig_i_1_n_0,
      Q => \^dir_out\,
      R => '0'
    );
en_sig_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"31"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => state(1),
      O => en_sig
    );
en_sig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => en_sig,
      Q => en_out,
      R => '0'
    );
\prox_debounce_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => prox_sync2,
      O => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555555555DFFF"
    )
        port map (
      I0 => prox_debounce_count_reg(20),
      I1 => \prox_debounce_count[0]_i_4_n_0\,
      I2 => prox_debounce_count_reg(16),
      I3 => prox_debounce_count_reg(17),
      I4 => prox_debounce_count_reg(19),
      I5 => prox_debounce_count_reg(18),
      O => \prox_debounce_count[0]_i_2_n_0\
    );
\prox_debounce_count[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000010FF"
    )
        port map (
      I0 => prox_debounce_count_reg(10),
      I1 => prox_debounce_count_reg(11),
      I2 => \prox_debounce_count[0]_i_6_n_0\,
      I3 => prox_debounce_count_reg(12),
      I4 => \prox_debounce_count[0]_i_7_n_0\,
      O => \prox_debounce_count[0]_i_4_n_0\
    );
\prox_debounce_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \prox_debounce_count_reg_n_0_[0]\,
      O => \prox_debounce_count[0]_i_5_n_0\
    );
\prox_debounce_count[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555557FFFFFF"
    )
        port map (
      I0 => prox_debounce_count_reg(9),
      I1 => prox_debounce_count_reg(5),
      I2 => prox_debounce_count_reg(4),
      I3 => prox_debounce_count_reg(6),
      I4 => prox_debounce_count_reg(7),
      I5 => prox_debounce_count_reg(8),
      O => \prox_debounce_count[0]_i_6_n_0\
    );
\prox_debounce_count[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => prox_debounce_count_reg(15),
      I1 => prox_debounce_count_reg(13),
      I2 => prox_debounce_count_reg(14),
      O => \prox_debounce_count[0]_i_7_n_0\
    );
\prox_debounce_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[0]_i_3_n_7\,
      Q => \prox_debounce_count_reg_n_0_[0]\,
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \prox_debounce_count_reg[0]_i_3_n_0\,
      CO(2) => \prox_debounce_count_reg[0]_i_3_n_1\,
      CO(1) => \prox_debounce_count_reg[0]_i_3_n_2\,
      CO(0) => \prox_debounce_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \prox_debounce_count_reg[0]_i_3_n_4\,
      O(2) => \prox_debounce_count_reg[0]_i_3_n_5\,
      O(1) => \prox_debounce_count_reg[0]_i_3_n_6\,
      O(0) => \prox_debounce_count_reg[0]_i_3_n_7\,
      S(3) => \prox_debounce_count_reg_n_0_[3]\,
      S(2) => \prox_debounce_count_reg_n_0_[2]\,
      S(1) => \prox_debounce_count_reg_n_0_[1]\,
      S(0) => \prox_debounce_count[0]_i_5_n_0\
    );
\prox_debounce_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[8]_i_1_n_5\,
      Q => prox_debounce_count_reg(10),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[8]_i_1_n_4\,
      Q => prox_debounce_count_reg(11),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[12]_i_1_n_7\,
      Q => prox_debounce_count_reg(12),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \prox_debounce_count_reg[8]_i_1_n_0\,
      CO(3) => \prox_debounce_count_reg[12]_i_1_n_0\,
      CO(2) => \prox_debounce_count_reg[12]_i_1_n_1\,
      CO(1) => \prox_debounce_count_reg[12]_i_1_n_2\,
      CO(0) => \prox_debounce_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \prox_debounce_count_reg[12]_i_1_n_4\,
      O(2) => \prox_debounce_count_reg[12]_i_1_n_5\,
      O(1) => \prox_debounce_count_reg[12]_i_1_n_6\,
      O(0) => \prox_debounce_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => prox_debounce_count_reg(15 downto 12)
    );
\prox_debounce_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[12]_i_1_n_6\,
      Q => prox_debounce_count_reg(13),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[12]_i_1_n_5\,
      Q => prox_debounce_count_reg(14),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[12]_i_1_n_4\,
      Q => prox_debounce_count_reg(15),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[16]_i_1_n_7\,
      Q => prox_debounce_count_reg(16),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \prox_debounce_count_reg[12]_i_1_n_0\,
      CO(3) => \prox_debounce_count_reg[16]_i_1_n_0\,
      CO(2) => \prox_debounce_count_reg[16]_i_1_n_1\,
      CO(1) => \prox_debounce_count_reg[16]_i_1_n_2\,
      CO(0) => \prox_debounce_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \prox_debounce_count_reg[16]_i_1_n_4\,
      O(2) => \prox_debounce_count_reg[16]_i_1_n_5\,
      O(1) => \prox_debounce_count_reg[16]_i_1_n_6\,
      O(0) => \prox_debounce_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => prox_debounce_count_reg(19 downto 16)
    );
\prox_debounce_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[16]_i_1_n_6\,
      Q => prox_debounce_count_reg(17),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[16]_i_1_n_5\,
      Q => prox_debounce_count_reg(18),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[16]_i_1_n_4\,
      Q => prox_debounce_count_reg(19),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[0]_i_3_n_6\,
      Q => \prox_debounce_count_reg_n_0_[1]\,
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[20]_i_1_n_7\,
      Q => prox_debounce_count_reg(20),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \prox_debounce_count_reg[16]_i_1_n_0\,
      CO(3 downto 0) => \NLW_prox_debounce_count_reg[20]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_prox_debounce_count_reg[20]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \prox_debounce_count_reg[20]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => prox_debounce_count_reg(20)
    );
\prox_debounce_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[0]_i_3_n_5\,
      Q => \prox_debounce_count_reg_n_0_[2]\,
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[0]_i_3_n_4\,
      Q => \prox_debounce_count_reg_n_0_[3]\,
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[4]_i_1_n_7\,
      Q => prox_debounce_count_reg(4),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \prox_debounce_count_reg[0]_i_3_n_0\,
      CO(3) => \prox_debounce_count_reg[4]_i_1_n_0\,
      CO(2) => \prox_debounce_count_reg[4]_i_1_n_1\,
      CO(1) => \prox_debounce_count_reg[4]_i_1_n_2\,
      CO(0) => \prox_debounce_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \prox_debounce_count_reg[4]_i_1_n_4\,
      O(2) => \prox_debounce_count_reg[4]_i_1_n_5\,
      O(1) => \prox_debounce_count_reg[4]_i_1_n_6\,
      O(0) => \prox_debounce_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => prox_debounce_count_reg(7 downto 4)
    );
\prox_debounce_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[4]_i_1_n_6\,
      Q => prox_debounce_count_reg(5),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[4]_i_1_n_5\,
      Q => prox_debounce_count_reg(6),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[4]_i_1_n_4\,
      Q => prox_debounce_count_reg(7),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[8]_i_1_n_7\,
      Q => prox_debounce_count_reg(8),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
\prox_debounce_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \prox_debounce_count_reg[4]_i_1_n_0\,
      CO(3) => \prox_debounce_count_reg[8]_i_1_n_0\,
      CO(2) => \prox_debounce_count_reg[8]_i_1_n_1\,
      CO(1) => \prox_debounce_count_reg[8]_i_1_n_2\,
      CO(0) => \prox_debounce_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \prox_debounce_count_reg[8]_i_1_n_4\,
      O(2) => \prox_debounce_count_reg[8]_i_1_n_5\,
      O(1) => \prox_debounce_count_reg[8]_i_1_n_6\,
      O(0) => \prox_debounce_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => prox_debounce_count_reg(11 downto 8)
    );
\prox_debounce_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \prox_debounce_count[0]_i_2_n_0\,
      D => \prox_debounce_count_reg[8]_i_1_n_6\,
      Q => prox_debounce_count_reg(9),
      R => \prox_debounce_count[0]_i_1_n_0\
    );
prox_stable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => prox_stable,
      I1 => \prox_debounce_count[0]_i_2_n_0\,
      I2 => prox_sync2,
      O => prox_stable_i_1_n_0
    );
prox_stable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => prox_stable_i_1_n_0,
      Q => prox_stable,
      R => '0'
    );
prox_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => prox_in,
      Q => prox_sync1,
      R => '0'
    );
prox_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => prox_sync1,
      Q => prox_sync2,
      R => '0'
    );
pwm_sig_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAAAAAAA"
    )
        port map (
      I0 => pwm_sig_i_2_n_0,
      I1 => state(0),
      I2 => state(2),
      I3 => state(1),
      I4 => en,
      I5 => zero_clk,
      O => pwm_sig
    );
pwm_sig_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080008080"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_3_n_0\,
      I1 => state(0),
      I2 => run_clk,
      I3 => zero_req_prev,
      I4 => zero_req,
      I5 => pwm_sig_i_3_n_0,
      O => pwm_sig_i_2_n_0
    );
pwm_sig_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => pwm_sig_i_4_n_0,
      I1 => pwm_sig_i_5_n_0,
      I2 => pwm_sig_i_6_n_0,
      I3 => pwm_sig_i_7_n_0,
      I4 => en,
      O => pwm_sig_i_3_n_0
    );
pwm_sig_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[6]\,
      I1 => \steps_remaining_reg_n_0_[7]\,
      I2 => \steps_remaining_reg_n_0_[8]\,
      I3 => \steps_remaining_reg_n_0_[9]\,
      O => pwm_sig_i_4_n_0
    );
pwm_sig_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[14]\,
      I1 => \steps_remaining_reg_n_0_[15]\,
      I2 => \steps_remaining_reg_n_0_[18]\,
      I3 => \steps_remaining_reg_n_0_[19]\,
      I4 => \steps_remaining_reg_n_0_[17]\,
      I5 => \steps_remaining_reg_n_0_[16]\,
      O => pwm_sig_i_5_n_0
    );
pwm_sig_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[13]\,
      I1 => \steps_remaining_reg_n_0_[12]\,
      I2 => \steps_remaining_reg_n_0_[11]\,
      I3 => \steps_remaining_reg_n_0_[10]\,
      I4 => \steps_remaining_reg_n_0_[0]\,
      I5 => \steps_remaining_reg_n_0_[1]\,
      O => pwm_sig_i_6_n_0
    );
pwm_sig_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[2]\,
      I1 => \steps_remaining_reg_n_0_[3]\,
      I2 => \steps_remaining_reg_n_0_[4]\,
      I3 => \steps_remaining_reg_n_0_[5]\,
      O => pwm_sig_i_7_n_0
    );
pwm_sig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => pwm_sig,
      Q => pwm_out_step,
      R => '0'
    );
run_clk1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => run_clk1_carry_n_0,
      CO(2) => run_clk1_carry_n_1,
      CO(1) => run_clk1_carry_n_2,
      CO(0) => run_clk1_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => run_clk1_carry_i_1_n_0,
      DI(0) => run_clk1_carry_i_2_n_0,
      O(3 downto 0) => NLW_run_clk1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => run_clk1_carry_i_3_n_0,
      S(2) => run_clk1_carry_i_4_n_0,
      S(1) => run_clk1_carry_i_5_n_0,
      S(0) => run_clk1_carry_i_6_n_0
    );
\run_clk1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => run_clk1_carry_n_0,
      CO(3) => \run_clk1_carry__0_n_0\,
      CO(2) => \run_clk1_carry__0_n_1\,
      CO(1) => \run_clk1_carry__0_n_2\,
      CO(0) => \run_clk1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \run_clk1_carry__0_i_1_n_0\,
      DI(1) => \run_clk1_carry__0_i_2_n_0\,
      DI(0) => \run_clk1_carry__0_i_3_n_0\,
      O(3 downto 0) => \NLW_run_clk1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \run_clk1_carry__0_i_4_n_0\,
      S(2) => \run_clk1_carry__0_i_5_n_0\,
      S(1) => \run_clk1_carry__0_i_6_n_0\,
      S(0) => \run_clk1_carry__0_i_7_n_0\
    );
\run_clk1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => run_counter_reg(17),
      I1 => run_counter_reg(16),
      O => \run_clk1_carry__0_i_1_n_0\
    );
\run_clk1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => run_counter_reg(15),
      I1 => run_counter_reg(14),
      O => \run_clk1_carry__0_i_2_n_0\
    );
\run_clk1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(12),
      I1 => run_counter_reg(13),
      O => \run_clk1_carry__0_i_3_n_0\
    );
\run_clk1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(19),
      I1 => run_counter_reg(18),
      O => \run_clk1_carry__0_i_4_n_0\
    );
\run_clk1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => run_counter_reg(16),
      I1 => run_counter_reg(17),
      O => \run_clk1_carry__0_i_5_n_0\
    );
\run_clk1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => run_counter_reg(14),
      I1 => run_counter_reg(15),
      O => \run_clk1_carry__0_i_6_n_0\
    );
\run_clk1_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => run_counter_reg(12),
      I1 => run_counter_reg(13),
      O => \run_clk1_carry__0_i_7_n_0\
    );
\run_clk1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_clk1_carry__0_n_0\,
      CO(3) => run_clk1,
      CO(2) => \run_clk1_carry__1_n_1\,
      CO(1) => \run_clk1_carry__1_n_2\,
      CO(0) => \run_clk1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_run_clk1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \run_clk1_carry__1_i_1_n_0\,
      S(2) => \run_clk1_carry__1_i_2_n_0\,
      S(1) => \run_clk1_carry__1_i_3_n_0\,
      S(0) => \run_clk1_carry__1_i_4_n_0\
    );
\run_clk1_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(26),
      O => \run_clk1_carry__1_i_1_n_0\
    );
\run_clk1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(25),
      I1 => run_counter_reg(24),
      O => \run_clk1_carry__1_i_2_n_0\
    );
\run_clk1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(23),
      I1 => run_counter_reg(22),
      O => \run_clk1_carry__1_i_3_n_0\
    );
\run_clk1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(21),
      I1 => run_counter_reg(20),
      O => \run_clk1_carry__1_i_4_n_0\
    );
run_clk1_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(7),
      O => run_clk1_carry_i_1_n_0
    );
run_clk1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(5),
      I1 => run_counter_reg(4),
      O => run_clk1_carry_i_2_n_0
    );
run_clk1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(11),
      I1 => run_counter_reg(10),
      O => run_clk1_carry_i_3_n_0
    );
run_clk1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(8),
      I1 => run_counter_reg(9),
      O => run_clk1_carry_i_4_n_0
    );
run_clk1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => run_counter_reg(7),
      I1 => run_counter_reg(6),
      O => run_clk1_carry_i_5_n_0
    );
run_clk1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => run_counter_reg(4),
      I1 => run_counter_reg(5),
      O => run_clk1_carry_i_6_n_0
    );
run_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAAAAA"
    )
        port map (
      I0 => run_clk1,
      I1 => run_counter_reg(17),
      I2 => run_counter_reg(26),
      I3 => \run_counter[0]_i_3_n_0\,
      I4 => \run_counter[0]_i_4_n_0\,
      I5 => \run_counter[0]_i_5_n_0\,
      O => run_clk_i_1_n_0
    );
run_clk_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => run_clk,
      Q => run_clk_prev,
      R => '0'
    );
run_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => run_clk_i_1_n_0,
      Q => run_clk,
      R => '0'
    );
\run_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555545555555555"
    )
        port map (
      I0 => run_clk1,
      I1 => run_counter_reg(17),
      I2 => run_counter_reg(26),
      I3 => \run_counter[0]_i_3_n_0\,
      I4 => \run_counter[0]_i_4_n_0\,
      I5 => \run_counter[0]_i_5_n_0\,
      O => run_counter
    );
\run_counter[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_counter_reg(21),
      I1 => run_counter_reg(20),
      O => \run_counter[0]_i_3_n_0\
    );
\run_counter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => run_counter_reg(24),
      I1 => run_counter_reg(25),
      I2 => run_counter_reg(19),
      I3 => run_counter_reg(18),
      I4 => run_counter_reg(23),
      I5 => run_counter_reg(22),
      O => \run_counter[0]_i_4_n_0\
    );
\run_counter[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => run_counter_reg(12),
      I1 => \run_counter[0]_i_7_n_0\,
      I2 => run_counter_reg(16),
      I3 => run_counter_reg(13),
      I4 => run_counter_reg(14),
      I5 => run_counter_reg(15),
      O => \run_counter[0]_i_5_n_0\
    );
\run_counter[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \run_counter_reg_n_0_[0]\,
      O => \run_counter[0]_i_6_n_0\
    );
\run_counter[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11111115FFFFFFFF"
    )
        port map (
      I0 => \run_counter[0]_i_8_n_0\,
      I1 => run_counter_reg(6),
      I2 => run_counter_reg(4),
      I3 => run_counter_reg(5),
      I4 => run_counter_reg(3),
      I5 => run_counter_reg(11),
      O => \run_counter[0]_i_7_n_0\
    );
\run_counter[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => run_counter_reg(10),
      I1 => run_counter_reg(7),
      I2 => run_counter_reg(8),
      I3 => run_counter_reg(9),
      O => \run_counter[0]_i_8_n_0\
    );
\run_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[0]_i_2_n_7\,
      Q => \run_counter_reg_n_0_[0]\,
      R => run_counter
    );
\run_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \run_counter_reg[0]_i_2_n_0\,
      CO(2) => \run_counter_reg[0]_i_2_n_1\,
      CO(1) => \run_counter_reg[0]_i_2_n_2\,
      CO(0) => \run_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \run_counter_reg[0]_i_2_n_4\,
      O(2) => \run_counter_reg[0]_i_2_n_5\,
      O(1) => \run_counter_reg[0]_i_2_n_6\,
      O(0) => \run_counter_reg[0]_i_2_n_7\,
      S(3) => run_counter_reg(3),
      S(2) => \run_counter_reg_n_0_[2]\,
      S(1) => \run_counter_reg_n_0_[1]\,
      S(0) => \run_counter[0]_i_6_n_0\
    );
\run_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[8]_i_1_n_5\,
      Q => run_counter_reg(10),
      R => run_counter
    );
\run_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[8]_i_1_n_4\,
      Q => run_counter_reg(11),
      R => run_counter
    );
\run_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[12]_i_1_n_7\,
      Q => run_counter_reg(12),
      R => run_counter
    );
\run_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[8]_i_1_n_0\,
      CO(3) => \run_counter_reg[12]_i_1_n_0\,
      CO(2) => \run_counter_reg[12]_i_1_n_1\,
      CO(1) => \run_counter_reg[12]_i_1_n_2\,
      CO(0) => \run_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \run_counter_reg[12]_i_1_n_4\,
      O(2) => \run_counter_reg[12]_i_1_n_5\,
      O(1) => \run_counter_reg[12]_i_1_n_6\,
      O(0) => \run_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => run_counter_reg(15 downto 12)
    );
\run_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[12]_i_1_n_6\,
      Q => run_counter_reg(13),
      R => run_counter
    );
\run_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[12]_i_1_n_5\,
      Q => run_counter_reg(14),
      R => run_counter
    );
\run_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[12]_i_1_n_4\,
      Q => run_counter_reg(15),
      R => run_counter
    );
\run_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[16]_i_1_n_7\,
      Q => run_counter_reg(16),
      R => run_counter
    );
\run_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[12]_i_1_n_0\,
      CO(3) => \run_counter_reg[16]_i_1_n_0\,
      CO(2) => \run_counter_reg[16]_i_1_n_1\,
      CO(1) => \run_counter_reg[16]_i_1_n_2\,
      CO(0) => \run_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \run_counter_reg[16]_i_1_n_4\,
      O(2) => \run_counter_reg[16]_i_1_n_5\,
      O(1) => \run_counter_reg[16]_i_1_n_6\,
      O(0) => \run_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => run_counter_reg(19 downto 16)
    );
\run_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[16]_i_1_n_6\,
      Q => run_counter_reg(17),
      R => run_counter
    );
\run_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[16]_i_1_n_5\,
      Q => run_counter_reg(18),
      R => run_counter
    );
\run_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[16]_i_1_n_4\,
      Q => run_counter_reg(19),
      R => run_counter
    );
\run_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[0]_i_2_n_6\,
      Q => \run_counter_reg_n_0_[1]\,
      R => run_counter
    );
\run_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[20]_i_1_n_7\,
      Q => run_counter_reg(20),
      R => run_counter
    );
\run_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[16]_i_1_n_0\,
      CO(3) => \run_counter_reg[20]_i_1_n_0\,
      CO(2) => \run_counter_reg[20]_i_1_n_1\,
      CO(1) => \run_counter_reg[20]_i_1_n_2\,
      CO(0) => \run_counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \run_counter_reg[20]_i_1_n_4\,
      O(2) => \run_counter_reg[20]_i_1_n_5\,
      O(1) => \run_counter_reg[20]_i_1_n_6\,
      O(0) => \run_counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => run_counter_reg(23 downto 20)
    );
\run_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[20]_i_1_n_6\,
      Q => run_counter_reg(21),
      R => run_counter
    );
\run_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[20]_i_1_n_5\,
      Q => run_counter_reg(22),
      R => run_counter
    );
\run_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[20]_i_1_n_4\,
      Q => run_counter_reg(23),
      R => run_counter
    );
\run_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[24]_i_1_n_7\,
      Q => run_counter_reg(24),
      R => run_counter
    );
\run_counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[20]_i_1_n_0\,
      CO(3 downto 2) => \NLW_run_counter_reg[24]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \run_counter_reg[24]_i_1_n_2\,
      CO(0) => \run_counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_run_counter_reg[24]_i_1_O_UNCONNECTED\(3),
      O(2) => \run_counter_reg[24]_i_1_n_5\,
      O(1) => \run_counter_reg[24]_i_1_n_6\,
      O(0) => \run_counter_reg[24]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => run_counter_reg(26 downto 24)
    );
\run_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[24]_i_1_n_6\,
      Q => run_counter_reg(25),
      R => run_counter
    );
\run_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[24]_i_1_n_5\,
      Q => run_counter_reg(26),
      R => run_counter
    );
\run_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[0]_i_2_n_5\,
      Q => \run_counter_reg_n_0_[2]\,
      R => run_counter
    );
\run_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[0]_i_2_n_4\,
      Q => run_counter_reg(3),
      R => run_counter
    );
\run_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[4]_i_1_n_7\,
      Q => run_counter_reg(4),
      R => run_counter
    );
\run_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[0]_i_2_n_0\,
      CO(3) => \run_counter_reg[4]_i_1_n_0\,
      CO(2) => \run_counter_reg[4]_i_1_n_1\,
      CO(1) => \run_counter_reg[4]_i_1_n_2\,
      CO(0) => \run_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \run_counter_reg[4]_i_1_n_4\,
      O(2) => \run_counter_reg[4]_i_1_n_5\,
      O(1) => \run_counter_reg[4]_i_1_n_6\,
      O(0) => \run_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => run_counter_reg(7 downto 4)
    );
\run_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[4]_i_1_n_6\,
      Q => run_counter_reg(5),
      R => run_counter
    );
\run_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[4]_i_1_n_5\,
      Q => run_counter_reg(6),
      R => run_counter
    );
\run_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[4]_i_1_n_4\,
      Q => run_counter_reg(7),
      R => run_counter
    );
\run_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[8]_i_1_n_7\,
      Q => run_counter_reg(8),
      R => run_counter
    );
\run_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \run_counter_reg[4]_i_1_n_0\,
      CO(3) => \run_counter_reg[8]_i_1_n_0\,
      CO(2) => \run_counter_reg[8]_i_1_n_1\,
      CO(1) => \run_counter_reg[8]_i_1_n_2\,
      CO(0) => \run_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \run_counter_reg[8]_i_1_n_4\,
      O(2) => \run_counter_reg[8]_i_1_n_5\,
      O(1) => \run_counter_reg[8]_i_1_n_6\,
      O(0) => \run_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => run_counter_reg(11 downto 8)
    );
\run_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \run_counter_reg[8]_i_1_n_6\,
      Q => run_counter_reg(9),
      R => run_counter
    );
step_go_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => step_go,
      Q => step_go_prev,
      R => '0'
    );
step_total0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => step_total0_carry_n_0,
      CO(2) => step_total0_carry_n_1,
      CO(1) => step_total0_carry_n_2,
      CO(0) => step_total0_carry_n_3,
      CYINIT => \^step_total_out\(0),
      DI(3 downto 1) => \^step_total_out\(3 downto 1),
      DI(0) => dir,
      O(3) => step_total0_carry_n_4,
      O(2) => step_total0_carry_n_5,
      O(1) => step_total0_carry_n_6,
      O(0) => step_total0_carry_n_7,
      S(3) => step_total0_carry_i_1_n_0,
      S(2) => step_total0_carry_i_2_n_0,
      S(1) => step_total0_carry_i_3_n_0,
      S(0) => step_total0_carry_i_4_n_0
    );
\step_total0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => step_total0_carry_n_0,
      CO(3) => \step_total0_carry__0_n_0\,
      CO(2) => \step_total0_carry__0_n_1\,
      CO(1) => \step_total0_carry__0_n_2\,
      CO(0) => \step_total0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^step_total_out\(7 downto 4),
      O(3) => \step_total0_carry__0_n_4\,
      O(2) => \step_total0_carry__0_n_5\,
      O(1) => \step_total0_carry__0_n_6\,
      O(0) => \step_total0_carry__0_n_7\,
      S(3) => \step_total0_carry__0_i_1_n_0\,
      S(2) => \step_total0_carry__0_i_2_n_0\,
      S(1) => \step_total0_carry__0_i_3_n_0\,
      S(0) => \step_total0_carry__0_i_4_n_0\
    );
\step_total0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(7),
      I1 => \^step_total_out\(8),
      O => \step_total0_carry__0_i_1_n_0\
    );
\step_total0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(6),
      I1 => \^step_total_out\(7),
      O => \step_total0_carry__0_i_2_n_0\
    );
\step_total0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(5),
      I1 => \^step_total_out\(6),
      O => \step_total0_carry__0_i_3_n_0\
    );
\step_total0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(4),
      I1 => \^step_total_out\(5),
      O => \step_total0_carry__0_i_4_n_0\
    );
\step_total0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step_total0_carry__0_n_0\,
      CO(3) => \step_total0_carry__1_n_0\,
      CO(2) => \step_total0_carry__1_n_1\,
      CO(1) => \step_total0_carry__1_n_2\,
      CO(0) => \step_total0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^step_total_out\(11 downto 8),
      O(3) => \step_total0_carry__1_n_4\,
      O(2) => \step_total0_carry__1_n_5\,
      O(1) => \step_total0_carry__1_n_6\,
      O(0) => \step_total0_carry__1_n_7\,
      S(3) => \step_total0_carry__1_i_1_n_0\,
      S(2) => \step_total0_carry__1_i_2_n_0\,
      S(1) => \step_total0_carry__1_i_3_n_0\,
      S(0) => \step_total0_carry__1_i_4_n_0\
    );
\step_total0_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(11),
      I1 => \^step_total_out\(12),
      O => \step_total0_carry__1_i_1_n_0\
    );
\step_total0_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(10),
      I1 => \^step_total_out\(11),
      O => \step_total0_carry__1_i_2_n_0\
    );
\step_total0_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(9),
      I1 => \^step_total_out\(10),
      O => \step_total0_carry__1_i_3_n_0\
    );
\step_total0_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(8),
      I1 => \^step_total_out\(9),
      O => \step_total0_carry__1_i_4_n_0\
    );
\step_total0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \step_total0_carry__1_n_0\,
      CO(3) => \step_total0_carry__2_n_0\,
      CO(2) => \step_total0_carry__2_n_1\,
      CO(1) => \step_total0_carry__2_n_2\,
      CO(0) => \step_total0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^step_total_out\(15 downto 12),
      O(3) => \step_total0_carry__2_n_4\,
      O(2) => \step_total0_carry__2_n_5\,
      O(1) => \step_total0_carry__2_n_6\,
      O(0) => \step_total0_carry__2_n_7\,
      S(3) => \step_total0_carry__2_i_1_n_0\,
      S(2) => \step_total0_carry__2_i_2_n_0\,
      S(1) => \step_total0_carry__2_i_3_n_0\,
      S(0) => \step_total0_carry__2_i_4_n_0\
    );
\step_total0_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(15),
      I1 => \^step_total_out\(16),
      O => \step_total0_carry__2_i_1_n_0\
    );
\step_total0_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(14),
      I1 => \^step_total_out\(15),
      O => \step_total0_carry__2_i_2_n_0\
    );
\step_total0_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(13),
      I1 => \^step_total_out\(14),
      O => \step_total0_carry__2_i_3_n_0\
    );
\step_total0_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(12),
      I1 => \^step_total_out\(13),
      O => \step_total0_carry__2_i_4_n_0\
    );
\step_total0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \step_total0_carry__2_n_0\,
      CO(3) => \NLW_step_total0_carry__3_CO_UNCONNECTED\(3),
      CO(2) => \step_total0_carry__3_n_1\,
      CO(1) => \step_total0_carry__3_n_2\,
      CO(0) => \step_total0_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => \^step_total_out\(18 downto 16),
      O(3) => \step_total0_carry__3_n_4\,
      O(2) => \step_total0_carry__3_n_5\,
      O(1) => \step_total0_carry__3_n_6\,
      O(0) => \step_total0_carry__3_n_7\,
      S(3) => \step_total0_carry__3_i_1_n_0\,
      S(2) => \step_total0_carry__3_i_2_n_0\,
      S(1) => \step_total0_carry__3_i_3_n_0\,
      S(0) => \step_total0_carry__3_i_4_n_0\
    );
\step_total0_carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(19),
      I1 => \^step_total_out\(20),
      O => \step_total0_carry__3_i_1_n_0\
    );
\step_total0_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(18),
      I1 => \^step_total_out\(19),
      O => \step_total0_carry__3_i_2_n_0\
    );
\step_total0_carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(17),
      I1 => \^step_total_out\(18),
      O => \step_total0_carry__3_i_3_n_0\
    );
\step_total0_carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(16),
      I1 => \^step_total_out\(17),
      O => \step_total0_carry__3_i_4_n_0\
    );
step_total0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(3),
      I1 => \^step_total_out\(4),
      O => step_total0_carry_i_1_n_0
    );
step_total0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(2),
      I1 => \^step_total_out\(3),
      O => step_total0_carry_i_2_n_0
    );
step_total0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(1),
      I1 => \^step_total_out\(2),
      O => step_total0_carry_i_3_n_0
    );
step_total0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^step_total_out\(1),
      I1 => dir,
      O => step_total0_carry_i_4_n_0
    );
\step_total[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^step_total_out\(0),
      O => \step_total[0]_i_1_n_0\
    );
\step_total[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEE00EFEEEE0000"
    )
        port map (
      I0 => \step_total[20]_i_3_n_0\,
      I1 => \step_total[20]_i_4_n_0\,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      I5 => prox_stable,
      O => \step_total[20]_i_1_n_0\
    );
\step_total[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0004"
    )
        port map (
      I0 => state(1),
      I1 => prox_stable,
      I2 => state(2),
      I3 => state(0),
      I4 => \step_total[20]_i_4_n_0\,
      I5 => \step_total[20]_i_3_n_0\,
      O => step_total
    );
\step_total[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      I3 => run_clk_prev,
      I4 => run_clk,
      I5 => pwm_sig_i_3_n_0,
      O => \step_total[20]_i_3_n_0\
    );
\step_total[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => en,
      I1 => state(1),
      I2 => zero_clk_prev,
      I3 => zero_clk,
      I4 => state(2),
      I5 => state(0),
      O => \step_total[20]_i_4_n_0\
    );
\step_total_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total[0]_i_1_n_0\,
      Q => \^step_total_out\(0),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__1_n_6\,
      Q => \^step_total_out\(10),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__1_n_5\,
      Q => \^step_total_out\(11),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__1_n_4\,
      Q => \^step_total_out\(12),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__2_n_7\,
      Q => \^step_total_out\(13),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__2_n_6\,
      Q => \^step_total_out\(14),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__2_n_5\,
      Q => \^step_total_out\(15),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__2_n_4\,
      Q => \^step_total_out\(16),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__3_n_7\,
      Q => \^step_total_out\(17),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__3_n_6\,
      Q => \^step_total_out\(18),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__3_n_5\,
      Q => \^step_total_out\(19),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => step_total0_carry_n_7,
      Q => \^step_total_out\(1),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__3_n_4\,
      Q => \^step_total_out\(20),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => step_total0_carry_n_6,
      Q => \^step_total_out\(2),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => step_total0_carry_n_5,
      Q => \^step_total_out\(3),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => step_total0_carry_n_4,
      Q => \^step_total_out\(4),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__0_n_7\,
      Q => \^step_total_out\(5),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__0_n_6\,
      Q => \^step_total_out\(6),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__0_n_5\,
      Q => \^step_total_out\(7),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__0_n_4\,
      Q => \^step_total_out\(8),
      R => \step_total[20]_i_1_n_0\
    );
\step_total_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => step_total,
      D => \step_total0_carry__1_n_7\,
      Q => \^step_total_out\(9),
      R => \step_total[20]_i_1_n_0\
    );
steps_remaining0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => steps_remaining0_carry_n_0,
      CO(2) => steps_remaining0_carry_n_1,
      CO(1) => steps_remaining0_carry_n_2,
      CO(0) => steps_remaining0_carry_n_3,
      CYINIT => \steps_remaining_reg_n_0_[0]\,
      DI(3) => \steps_remaining_reg_n_0_[4]\,
      DI(2) => \steps_remaining_reg_n_0_[3]\,
      DI(1) => \steps_remaining_reg_n_0_[2]\,
      DI(0) => \steps_remaining_reg_n_0_[1]\,
      O(3 downto 0) => in6(4 downto 1),
      S(3) => steps_remaining0_carry_i_1_n_0,
      S(2) => steps_remaining0_carry_i_2_n_0,
      S(1) => steps_remaining0_carry_i_3_n_0,
      S(0) => steps_remaining0_carry_i_4_n_0
    );
\steps_remaining0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => steps_remaining0_carry_n_0,
      CO(3) => \steps_remaining0_carry__0_n_0\,
      CO(2) => \steps_remaining0_carry__0_n_1\,
      CO(1) => \steps_remaining0_carry__0_n_2\,
      CO(0) => \steps_remaining0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \steps_remaining_reg_n_0_[8]\,
      DI(2) => \steps_remaining_reg_n_0_[7]\,
      DI(1) => \steps_remaining_reg_n_0_[6]\,
      DI(0) => \steps_remaining_reg_n_0_[5]\,
      O(3 downto 0) => in6(8 downto 5),
      S(3) => \steps_remaining0_carry__0_i_1_n_0\,
      S(2) => \steps_remaining0_carry__0_i_2_n_0\,
      S(1) => \steps_remaining0_carry__0_i_3_n_0\,
      S(0) => \steps_remaining0_carry__0_i_4_n_0\
    );
\steps_remaining0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[8]\,
      O => \steps_remaining0_carry__0_i_1_n_0\
    );
\steps_remaining0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[7]\,
      O => \steps_remaining0_carry__0_i_2_n_0\
    );
\steps_remaining0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[6]\,
      O => \steps_remaining0_carry__0_i_3_n_0\
    );
\steps_remaining0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[5]\,
      O => \steps_remaining0_carry__0_i_4_n_0\
    );
\steps_remaining0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \steps_remaining0_carry__0_n_0\,
      CO(3) => \steps_remaining0_carry__1_n_0\,
      CO(2) => \steps_remaining0_carry__1_n_1\,
      CO(1) => \steps_remaining0_carry__1_n_2\,
      CO(0) => \steps_remaining0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \steps_remaining_reg_n_0_[12]\,
      DI(2) => \steps_remaining_reg_n_0_[11]\,
      DI(1) => \steps_remaining_reg_n_0_[10]\,
      DI(0) => \steps_remaining_reg_n_0_[9]\,
      O(3 downto 0) => in6(12 downto 9),
      S(3) => \steps_remaining0_carry__1_i_1_n_0\,
      S(2) => \steps_remaining0_carry__1_i_2_n_0\,
      S(1) => \steps_remaining0_carry__1_i_3_n_0\,
      S(0) => \steps_remaining0_carry__1_i_4_n_0\
    );
\steps_remaining0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[12]\,
      O => \steps_remaining0_carry__1_i_1_n_0\
    );
\steps_remaining0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[11]\,
      O => \steps_remaining0_carry__1_i_2_n_0\
    );
\steps_remaining0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[10]\,
      O => \steps_remaining0_carry__1_i_3_n_0\
    );
\steps_remaining0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[9]\,
      O => \steps_remaining0_carry__1_i_4_n_0\
    );
\steps_remaining0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \steps_remaining0_carry__1_n_0\,
      CO(3) => \steps_remaining0_carry__2_n_0\,
      CO(2) => \steps_remaining0_carry__2_n_1\,
      CO(1) => \steps_remaining0_carry__2_n_2\,
      CO(0) => \steps_remaining0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \steps_remaining_reg_n_0_[16]\,
      DI(2) => \steps_remaining_reg_n_0_[15]\,
      DI(1) => \steps_remaining_reg_n_0_[14]\,
      DI(0) => \steps_remaining_reg_n_0_[13]\,
      O(3 downto 0) => in6(16 downto 13),
      S(3) => \steps_remaining0_carry__2_i_1_n_0\,
      S(2) => \steps_remaining0_carry__2_i_2_n_0\,
      S(1) => \steps_remaining0_carry__2_i_3_n_0\,
      S(0) => \steps_remaining0_carry__2_i_4_n_0\
    );
\steps_remaining0_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[16]\,
      O => \steps_remaining0_carry__2_i_1_n_0\
    );
\steps_remaining0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[15]\,
      O => \steps_remaining0_carry__2_i_2_n_0\
    );
\steps_remaining0_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[14]\,
      O => \steps_remaining0_carry__2_i_3_n_0\
    );
\steps_remaining0_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[13]\,
      O => \steps_remaining0_carry__2_i_4_n_0\
    );
\steps_remaining0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \steps_remaining0_carry__2_n_0\,
      CO(3 downto 2) => \NLW_steps_remaining0_carry__3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \steps_remaining0_carry__3_n_2\,
      CO(0) => \steps_remaining0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \steps_remaining_reg_n_0_[18]\,
      DI(0) => \steps_remaining_reg_n_0_[17]\,
      O(3) => \NLW_steps_remaining0_carry__3_O_UNCONNECTED\(3),
      O(2 downto 0) => in6(19 downto 17),
      S(3) => '0',
      S(2) => \steps_remaining0_carry__3_i_1_n_0\,
      S(1) => \steps_remaining0_carry__3_i_2_n_0\,
      S(0) => \steps_remaining0_carry__3_i_3_n_0\
    );
\steps_remaining0_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[19]\,
      O => \steps_remaining0_carry__3_i_1_n_0\
    );
\steps_remaining0_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[18]\,
      O => \steps_remaining0_carry__3_i_2_n_0\
    );
\steps_remaining0_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[17]\,
      O => \steps_remaining0_carry__3_i_3_n_0\
    );
steps_remaining0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[4]\,
      O => steps_remaining0_carry_i_1_n_0
    );
steps_remaining0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[3]\,
      O => steps_remaining0_carry_i_2_n_0
    );
steps_remaining0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[2]\,
      O => steps_remaining0_carry_i_3_n_0
    );
steps_remaining0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[1]\,
      O => steps_remaining0_carry_i_4_n_0
    );
\steps_remaining[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00550CCC"
    )
        port map (
      I0 => \steps_remaining_reg_n_0_[0]\,
      I1 => num_steps(0),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(0)
    );
\steps_remaining[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(10),
      I1 => num_steps(10),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(10)
    );
\steps_remaining[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(11),
      I1 => num_steps(11),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(11)
    );
\steps_remaining[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(12),
      I1 => num_steps(12),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(12)
    );
\steps_remaining[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(13),
      I1 => num_steps(13),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(13)
    );
\steps_remaining[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(14),
      I1 => num_steps(14),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(14)
    );
\steps_remaining[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(15),
      I1 => num_steps(15),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(15)
    );
\steps_remaining[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(16),
      I1 => num_steps(16),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(16)
    );
\steps_remaining[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(17),
      I1 => num_steps(17),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(17)
    );
\steps_remaining[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(18),
      I1 => num_steps(18),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(18)
    );
\steps_remaining[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \step_total[20]_i_3_n_0\,
      I1 => \FSM_sequential_state[2]_i_6_n_0\,
      O => steps_remaining_1
    );
\steps_remaining[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(19),
      I1 => num_steps(19),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(19)
    );
\steps_remaining[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(1),
      I1 => num_steps(1),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(1)
    );
\steps_remaining[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(2),
      I1 => num_steps(2),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(2)
    );
\steps_remaining[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(3),
      I1 => num_steps(3),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(3)
    );
\steps_remaining[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(4),
      I1 => num_steps(4),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(4)
    );
\steps_remaining[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(5),
      I1 => num_steps(5),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(5)
    );
\steps_remaining[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(6),
      I1 => num_steps(6),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(6)
    );
\steps_remaining[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(7),
      I1 => num_steps(7),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(7)
    );
\steps_remaining[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(8),
      I1 => num_steps(8),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(8)
    );
\steps_remaining[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00AA0CCC"
    )
        port map (
      I0 => in6(9),
      I1 => num_steps(9),
      I2 => state(0),
      I3 => state(2),
      I4 => state(1),
      O => steps_remaining(9)
    );
\steps_remaining_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(0),
      Q => \steps_remaining_reg_n_0_[0]\,
      R => '0'
    );
\steps_remaining_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(10),
      Q => \steps_remaining_reg_n_0_[10]\,
      R => '0'
    );
\steps_remaining_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(11),
      Q => \steps_remaining_reg_n_0_[11]\,
      R => '0'
    );
\steps_remaining_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(12),
      Q => \steps_remaining_reg_n_0_[12]\,
      R => '0'
    );
\steps_remaining_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(13),
      Q => \steps_remaining_reg_n_0_[13]\,
      R => '0'
    );
\steps_remaining_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(14),
      Q => \steps_remaining_reg_n_0_[14]\,
      R => '0'
    );
\steps_remaining_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(15),
      Q => \steps_remaining_reg_n_0_[15]\,
      R => '0'
    );
\steps_remaining_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(16),
      Q => \steps_remaining_reg_n_0_[16]\,
      R => '0'
    );
\steps_remaining_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(17),
      Q => \steps_remaining_reg_n_0_[17]\,
      R => '0'
    );
\steps_remaining_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(18),
      Q => \steps_remaining_reg_n_0_[18]\,
      R => '0'
    );
\steps_remaining_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(19),
      Q => \steps_remaining_reg_n_0_[19]\,
      R => '0'
    );
\steps_remaining_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(1),
      Q => \steps_remaining_reg_n_0_[1]\,
      R => '0'
    );
\steps_remaining_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(2),
      Q => \steps_remaining_reg_n_0_[2]\,
      R => '0'
    );
\steps_remaining_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(3),
      Q => \steps_remaining_reg_n_0_[3]\,
      R => '0'
    );
\steps_remaining_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(4),
      Q => \steps_remaining_reg_n_0_[4]\,
      R => '0'
    );
\steps_remaining_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(5),
      Q => \steps_remaining_reg_n_0_[5]\,
      R => '0'
    );
\steps_remaining_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(6),
      Q => \steps_remaining_reg_n_0_[6]\,
      R => '0'
    );
\steps_remaining_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(7),
      Q => \steps_remaining_reg_n_0_[7]\,
      R => '0'
    );
\steps_remaining_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(8),
      Q => \steps_remaining_reg_n_0_[8]\,
      R => '0'
    );
\steps_remaining_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => steps_remaining_1,
      D => steps_remaining(9),
      Q => \steps_remaining_reg_n_0_[9]\,
      R => '0'
    );
wakeup_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => wakeup_counter0_carry_n_0,
      CO(2) => wakeup_counter0_carry_n_1,
      CO(1) => wakeup_counter0_carry_n_2,
      CO(0) => wakeup_counter0_carry_n_3,
      CYINIT => \wakeup_counter_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => wakeup_counter0(4 downto 1),
      S(3) => \wakeup_counter_reg_n_0_[4]\,
      S(2) => \wakeup_counter_reg_n_0_[3]\,
      S(1) => \wakeup_counter_reg_n_0_[2]\,
      S(0) => \wakeup_counter_reg_n_0_[1]\
    );
\wakeup_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => wakeup_counter0_carry_n_0,
      CO(3) => \wakeup_counter0_carry__0_n_0\,
      CO(2) => \wakeup_counter0_carry__0_n_1\,
      CO(1) => \wakeup_counter0_carry__0_n_2\,
      CO(0) => \wakeup_counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => wakeup_counter0(8 downto 5),
      S(3) => \wakeup_counter_reg_n_0_[8]\,
      S(2) => \wakeup_counter_reg_n_0_[7]\,
      S(1) => \wakeup_counter_reg_n_0_[6]\,
      S(0) => \wakeup_counter_reg_n_0_[5]\
    );
\wakeup_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wakeup_counter0_carry__0_n_0\,
      CO(3) => \wakeup_counter0_carry__1_n_0\,
      CO(2) => \wakeup_counter0_carry__1_n_1\,
      CO(1) => \wakeup_counter0_carry__1_n_2\,
      CO(0) => \wakeup_counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => wakeup_counter0(12 downto 9),
      S(3) => \wakeup_counter_reg_n_0_[12]\,
      S(2) => \wakeup_counter_reg_n_0_[11]\,
      S(1) => \wakeup_counter_reg_n_0_[10]\,
      S(0) => \wakeup_counter_reg_n_0_[9]\
    );
\wakeup_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wakeup_counter0_carry__1_n_0\,
      CO(3) => \wakeup_counter0_carry__2_n_0\,
      CO(2) => \wakeup_counter0_carry__2_n_1\,
      CO(1) => \wakeup_counter0_carry__2_n_2\,
      CO(0) => \wakeup_counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => wakeup_counter0(16 downto 13),
      S(3) => \wakeup_counter_reg_n_0_[16]\,
      S(2) => \wakeup_counter_reg_n_0_[15]\,
      S(1) => \wakeup_counter_reg_n_0_[14]\,
      S(0) => \wakeup_counter_reg_n_0_[13]\
    );
\wakeup_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \wakeup_counter0_carry__2_n_0\,
      CO(3 downto 0) => \NLW_wakeup_counter0_carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wakeup_counter0_carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => wakeup_counter0(17),
      S(3 downto 1) => B"000",
      S(0) => \wakeup_counter_reg_n_0_[17]\
    );
\wakeup_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \wakeup_counter_reg_n_0_[0]\,
      O => \wakeup_counter[0]_i_1_n_0\
    );
\wakeup_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA0BAA"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_6_n_0\,
      I1 => state(0),
      I2 => p_0_in,
      I3 => state(1),
      I4 => state(2),
      O => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF04"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => \FSM_sequential_state[2]_i_6_n_0\,
      O => wakeup_counter
    );
\wakeup_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => \wakeup_counter[0]_i_1_n_0\,
      Q => \wakeup_counter_reg_n_0_[0]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(10),
      Q => \wakeup_counter_reg_n_0_[10]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(11),
      Q => \wakeup_counter_reg_n_0_[11]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(12),
      Q => \wakeup_counter_reg_n_0_[12]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(13),
      Q => \wakeup_counter_reg_n_0_[13]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(14),
      Q => \wakeup_counter_reg_n_0_[14]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(15),
      Q => \wakeup_counter_reg_n_0_[15]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(16),
      Q => \wakeup_counter_reg_n_0_[16]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(17),
      Q => \wakeup_counter_reg_n_0_[17]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(1),
      Q => \wakeup_counter_reg_n_0_[1]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(2),
      Q => \wakeup_counter_reg_n_0_[2]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(3),
      Q => \wakeup_counter_reg_n_0_[3]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(4),
      Q => \wakeup_counter_reg_n_0_[4]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(5),
      Q => \wakeup_counter_reg_n_0_[5]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(6),
      Q => \wakeup_counter_reg_n_0_[6]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(7),
      Q => \wakeup_counter_reg_n_0_[7]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(8),
      Q => \wakeup_counter_reg_n_0_[8]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
\wakeup_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => wakeup_counter,
      D => wakeup_counter0(9),
      Q => \wakeup_counter_reg_n_0_[9]\,
      R => \wakeup_counter[17]_i_1_n_0\
    );
zero_clk1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => zero_clk1_carry_n_0,
      CO(2) => zero_clk1_carry_n_1,
      CO(1) => zero_clk1_carry_n_2,
      CO(0) => zero_clk1_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => zero_clk1_carry_i_1_n_0,
      DI(0) => zero_clk1_carry_i_2_n_0,
      O(3 downto 0) => NLW_zero_clk1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => zero_clk1_carry_i_3_n_0,
      S(2) => zero_clk1_carry_i_4_n_0,
      S(1) => zero_clk1_carry_i_5_n_0,
      S(0) => zero_clk1_carry_i_6_n_0
    );
\zero_clk1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => zero_clk1_carry_n_0,
      CO(3) => \zero_clk1_carry__0_n_0\,
      CO(2) => \zero_clk1_carry__0_n_1\,
      CO(1) => \zero_clk1_carry__0_n_2\,
      CO(0) => \zero_clk1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \zero_clk1_carry__0_i_1_n_0\,
      DI(1) => \zero_clk1_carry__0_i_2_n_0\,
      DI(0) => \zero_clk1_carry__0_i_3_n_0\,
      O(3 downto 0) => \NLW_zero_clk1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \zero_clk1_carry__0_i_4_n_0\,
      S(2) => \zero_clk1_carry__0_i_5_n_0\,
      S(1) => \zero_clk1_carry__0_i_6_n_0\,
      S(0) => \zero_clk1_carry__0_i_7_n_0\
    );
\zero_clk1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => zero_counter_reg(17),
      I1 => zero_counter_reg(16),
      O => \zero_clk1_carry__0_i_1_n_0\
    );
\zero_clk1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => zero_counter_reg(15),
      I1 => zero_counter_reg(14),
      O => \zero_clk1_carry__0_i_2_n_0\
    );
\zero_clk1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(12),
      I1 => zero_counter_reg(13),
      O => \zero_clk1_carry__0_i_3_n_0\
    );
\zero_clk1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(19),
      I1 => zero_counter_reg(18),
      O => \zero_clk1_carry__0_i_4_n_0\
    );
\zero_clk1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => zero_counter_reg(16),
      I1 => zero_counter_reg(17),
      O => \zero_clk1_carry__0_i_5_n_0\
    );
\zero_clk1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => zero_counter_reg(14),
      I1 => zero_counter_reg(15),
      O => \zero_clk1_carry__0_i_6_n_0\
    );
\zero_clk1_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => zero_counter_reg(12),
      I1 => zero_counter_reg(13),
      O => \zero_clk1_carry__0_i_7_n_0\
    );
\zero_clk1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_clk1_carry__0_n_0\,
      CO(3) => zero_clk1,
      CO(2) => \zero_clk1_carry__1_n_1\,
      CO(1) => \zero_clk1_carry__1_n_2\,
      CO(0) => \zero_clk1_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_zero_clk1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \zero_clk1_carry__1_i_1_n_0\,
      S(2) => \zero_clk1_carry__1_i_2_n_0\,
      S(1) => \zero_clk1_carry__1_i_3_n_0\,
      S(0) => \zero_clk1_carry__1_i_4_n_0\
    );
\zero_clk1_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(26),
      O => \zero_clk1_carry__1_i_1_n_0\
    );
\zero_clk1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(25),
      I1 => zero_counter_reg(24),
      O => \zero_clk1_carry__1_i_2_n_0\
    );
\zero_clk1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(23),
      I1 => zero_counter_reg(22),
      O => \zero_clk1_carry__1_i_3_n_0\
    );
\zero_clk1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(21),
      I1 => zero_counter_reg(20),
      O => \zero_clk1_carry__1_i_4_n_0\
    );
zero_clk1_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(7),
      O => zero_clk1_carry_i_1_n_0
    );
zero_clk1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(5),
      I1 => zero_counter_reg(4),
      O => zero_clk1_carry_i_2_n_0
    );
zero_clk1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(11),
      I1 => zero_counter_reg(10),
      O => zero_clk1_carry_i_3_n_0
    );
zero_clk1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(8),
      I1 => zero_counter_reg(9),
      O => zero_clk1_carry_i_4_n_0
    );
zero_clk1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => zero_counter_reg(7),
      I1 => zero_counter_reg(6),
      O => zero_clk1_carry_i_5_n_0
    );
zero_clk1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => zero_counter_reg(4),
      I1 => zero_counter_reg(5),
      O => zero_clk1_carry_i_6_n_0
    );
zero_clk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA8AAAAAAAAAA"
    )
        port map (
      I0 => zero_clk1,
      I1 => zero_counter_reg(17),
      I2 => zero_counter_reg(26),
      I3 => \zero_counter[0]_i_3_n_0\,
      I4 => \zero_counter[0]_i_4_n_0\,
      I5 => \zero_counter[0]_i_5_n_0\,
      O => zero_clk_i_1_n_0
    );
zero_clk_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => zero_clk,
      Q => zero_clk_prev,
      R => '0'
    );
zero_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => zero_clk_i_1_n_0,
      Q => zero_clk,
      R => '0'
    );
\zero_counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555545555555555"
    )
        port map (
      I0 => zero_clk1,
      I1 => zero_counter_reg(17),
      I2 => zero_counter_reg(26),
      I3 => \zero_counter[0]_i_3_n_0\,
      I4 => \zero_counter[0]_i_4_n_0\,
      I5 => \zero_counter[0]_i_5_n_0\,
      O => zero_counter
    );
\zero_counter[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => zero_counter_reg(21),
      I1 => zero_counter_reg(20),
      O => \zero_counter[0]_i_3_n_0\
    );
\zero_counter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => zero_counter_reg(24),
      I1 => zero_counter_reg(25),
      I2 => zero_counter_reg(19),
      I3 => zero_counter_reg(18),
      I4 => zero_counter_reg(23),
      I5 => zero_counter_reg(22),
      O => \zero_counter[0]_i_4_n_0\
    );
\zero_counter[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => zero_counter_reg(12),
      I1 => \zero_counter[0]_i_7_n_0\,
      I2 => zero_counter_reg(16),
      I3 => zero_counter_reg(13),
      I4 => zero_counter_reg(14),
      I5 => zero_counter_reg(15),
      O => \zero_counter[0]_i_5_n_0\
    );
\zero_counter[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \zero_counter_reg_n_0_[0]\,
      O => \zero_counter[0]_i_6_n_0\
    );
\zero_counter[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11111115FFFFFFFF"
    )
        port map (
      I0 => \zero_counter[0]_i_8_n_0\,
      I1 => zero_counter_reg(6),
      I2 => zero_counter_reg(4),
      I3 => zero_counter_reg(5),
      I4 => zero_counter_reg(3),
      I5 => zero_counter_reg(11),
      O => \zero_counter[0]_i_7_n_0\
    );
\zero_counter[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => zero_counter_reg(10),
      I1 => zero_counter_reg(7),
      I2 => zero_counter_reg(8),
      I3 => zero_counter_reg(9),
      O => \zero_counter[0]_i_8_n_0\
    );
\zero_counter_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[0]_i_2_n_7\,
      Q => \zero_counter_reg_n_0_[0]\,
      S => zero_counter
    );
\zero_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \zero_counter_reg[0]_i_2_n_0\,
      CO(2) => \zero_counter_reg[0]_i_2_n_1\,
      CO(1) => \zero_counter_reg[0]_i_2_n_2\,
      CO(0) => \zero_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \zero_counter_reg[0]_i_2_n_4\,
      O(2) => \zero_counter_reg[0]_i_2_n_5\,
      O(1) => \zero_counter_reg[0]_i_2_n_6\,
      O(0) => \zero_counter_reg[0]_i_2_n_7\,
      S(3) => zero_counter_reg(3),
      S(2) => \zero_counter_reg_n_0_[2]\,
      S(1) => \zero_counter_reg_n_0_[1]\,
      S(0) => \zero_counter[0]_i_6_n_0\
    );
\zero_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[8]_i_1_n_5\,
      Q => zero_counter_reg(10),
      R => zero_counter
    );
\zero_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[8]_i_1_n_4\,
      Q => zero_counter_reg(11),
      R => zero_counter
    );
\zero_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[12]_i_1_n_7\,
      Q => zero_counter_reg(12),
      R => zero_counter
    );
\zero_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[8]_i_1_n_0\,
      CO(3) => \zero_counter_reg[12]_i_1_n_0\,
      CO(2) => \zero_counter_reg[12]_i_1_n_1\,
      CO(1) => \zero_counter_reg[12]_i_1_n_2\,
      CO(0) => \zero_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_counter_reg[12]_i_1_n_4\,
      O(2) => \zero_counter_reg[12]_i_1_n_5\,
      O(1) => \zero_counter_reg[12]_i_1_n_6\,
      O(0) => \zero_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => zero_counter_reg(15 downto 12)
    );
\zero_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[12]_i_1_n_6\,
      Q => zero_counter_reg(13),
      R => zero_counter
    );
\zero_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[12]_i_1_n_5\,
      Q => zero_counter_reg(14),
      R => zero_counter
    );
\zero_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[12]_i_1_n_4\,
      Q => zero_counter_reg(15),
      R => zero_counter
    );
\zero_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[16]_i_1_n_7\,
      Q => zero_counter_reg(16),
      R => zero_counter
    );
\zero_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[12]_i_1_n_0\,
      CO(3) => \zero_counter_reg[16]_i_1_n_0\,
      CO(2) => \zero_counter_reg[16]_i_1_n_1\,
      CO(1) => \zero_counter_reg[16]_i_1_n_2\,
      CO(0) => \zero_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_counter_reg[16]_i_1_n_4\,
      O(2) => \zero_counter_reg[16]_i_1_n_5\,
      O(1) => \zero_counter_reg[16]_i_1_n_6\,
      O(0) => \zero_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => zero_counter_reg(19 downto 16)
    );
\zero_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[16]_i_1_n_6\,
      Q => zero_counter_reg(17),
      R => zero_counter
    );
\zero_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[16]_i_1_n_5\,
      Q => zero_counter_reg(18),
      R => zero_counter
    );
\zero_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[16]_i_1_n_4\,
      Q => zero_counter_reg(19),
      R => zero_counter
    );
\zero_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[0]_i_2_n_6\,
      Q => \zero_counter_reg_n_0_[1]\,
      R => zero_counter
    );
\zero_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[20]_i_1_n_7\,
      Q => zero_counter_reg(20),
      R => zero_counter
    );
\zero_counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[16]_i_1_n_0\,
      CO(3) => \zero_counter_reg[20]_i_1_n_0\,
      CO(2) => \zero_counter_reg[20]_i_1_n_1\,
      CO(1) => \zero_counter_reg[20]_i_1_n_2\,
      CO(0) => \zero_counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_counter_reg[20]_i_1_n_4\,
      O(2) => \zero_counter_reg[20]_i_1_n_5\,
      O(1) => \zero_counter_reg[20]_i_1_n_6\,
      O(0) => \zero_counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => zero_counter_reg(23 downto 20)
    );
\zero_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[20]_i_1_n_6\,
      Q => zero_counter_reg(21),
      R => zero_counter
    );
\zero_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[20]_i_1_n_5\,
      Q => zero_counter_reg(22),
      R => zero_counter
    );
\zero_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[20]_i_1_n_4\,
      Q => zero_counter_reg(23),
      R => zero_counter
    );
\zero_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[24]_i_1_n_7\,
      Q => zero_counter_reg(24),
      R => zero_counter
    );
\zero_counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[20]_i_1_n_0\,
      CO(3 downto 2) => \NLW_zero_counter_reg[24]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \zero_counter_reg[24]_i_1_n_2\,
      CO(0) => \zero_counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_zero_counter_reg[24]_i_1_O_UNCONNECTED\(3),
      O(2) => \zero_counter_reg[24]_i_1_n_5\,
      O(1) => \zero_counter_reg[24]_i_1_n_6\,
      O(0) => \zero_counter_reg[24]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => zero_counter_reg(26 downto 24)
    );
\zero_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[24]_i_1_n_6\,
      Q => zero_counter_reg(25),
      R => zero_counter
    );
\zero_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[24]_i_1_n_5\,
      Q => zero_counter_reg(26),
      R => zero_counter
    );
\zero_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[0]_i_2_n_5\,
      Q => \zero_counter_reg_n_0_[2]\,
      R => zero_counter
    );
\zero_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[0]_i_2_n_4\,
      Q => zero_counter_reg(3),
      R => zero_counter
    );
\zero_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[4]_i_1_n_7\,
      Q => zero_counter_reg(4),
      R => zero_counter
    );
\zero_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[0]_i_2_n_0\,
      CO(3) => \zero_counter_reg[4]_i_1_n_0\,
      CO(2) => \zero_counter_reg[4]_i_1_n_1\,
      CO(1) => \zero_counter_reg[4]_i_1_n_2\,
      CO(0) => \zero_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_counter_reg[4]_i_1_n_4\,
      O(2) => \zero_counter_reg[4]_i_1_n_5\,
      O(1) => \zero_counter_reg[4]_i_1_n_6\,
      O(0) => \zero_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => zero_counter_reg(7 downto 4)
    );
\zero_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[4]_i_1_n_6\,
      Q => zero_counter_reg(5),
      R => zero_counter
    );
\zero_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[4]_i_1_n_5\,
      Q => zero_counter_reg(6),
      R => zero_counter
    );
\zero_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[4]_i_1_n_4\,
      Q => zero_counter_reg(7),
      R => zero_counter
    );
\zero_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[8]_i_1_n_7\,
      Q => zero_counter_reg(8),
      R => zero_counter
    );
\zero_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \zero_counter_reg[4]_i_1_n_0\,
      CO(3) => \zero_counter_reg[8]_i_1_n_0\,
      CO(2) => \zero_counter_reg[8]_i_1_n_1\,
      CO(1) => \zero_counter_reg[8]_i_1_n_2\,
      CO(0) => \zero_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \zero_counter_reg[8]_i_1_n_4\,
      O(2) => \zero_counter_reg[8]_i_1_n_5\,
      O(1) => \zero_counter_reg[8]_i_1_n_6\,
      O(0) => \zero_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => zero_counter_reg(11 downto 8)
    );
\zero_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \zero_counter_reg[8]_i_1_n_6\,
      Q => zero_counter_reg(9),
      R => zero_counter
    );
zero_req_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => zero_req,
      Q => zero_req_prev,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_stepperDriver_0_0 is
  port (
    clk : in STD_LOGIC;
    dir : in STD_LOGIC;
    dir_out : out STD_LOGIC;
    en : in STD_LOGIC;
    pwm_out_step : out STD_LOGIC;
    prox_in : in STD_LOGIC;
    zero_req : in STD_LOGIC;
    en_out : out STD_LOGIC;
    num_steps : in STD_LOGIC_VECTOR ( 20 downto 0 );
    step_go : in STD_LOGIC;
    step_total_out : out STD_LOGIC_VECTOR ( 20 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_stepperDriver_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_stepperDriver_0_0 : entity is "top_stepperDriver_0_0,stepperDriver,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_stepperDriver_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_stepperDriver_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of top_stepperDriver_0_0 : entity is "stepperDriver,Vivado 2025.1";
end top_stepperDriver_0_0;

architecture STRUCTURE of top_stepperDriver_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
U0: entity work.top_stepperDriver_0_0_stepperDriver
     port map (
      clk => clk,
      dir => dir,
      dir_out => dir_out,
      en => en,
      en_out => en_out,
      num_steps(19 downto 0) => num_steps(19 downto 0),
      prox_in => prox_in,
      pwm_out_step => pwm_out_step,
      step_go => step_go,
      step_total_out(20 downto 0) => step_total_out(20 downto 0),
      zero_req => zero_req
    );
end STRUCTURE;
