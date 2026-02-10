-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
-- Date        : Thu Jan 29 15:15:06 2026
-- Host        : MDD-ECE-HPG853 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/HardSoftCodesign/Hardsoftcodesign/RAPID/RAPID.gen/sources_1/bd/top/ip/top_stepperDriver_0_0_1/top_stepperDriver_0_0_stub.vhdl
-- Design      : top_stepperDriver_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_stepperDriver_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    dir : in STD_LOGIC;
    en : in STD_LOGIC;
    phA1 : out STD_LOGIC;
    phB1 : out STD_LOGIC;
    phA2 : out STD_LOGIC;
    phB2 : out STD_LOGIC;
    reset : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of top_stepperDriver_0_0 : entity is "top_stepperDriver_0_0,stepperDriver,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of top_stepperDriver_0_0 : entity is "top_stepperDriver_0_0,stepperDriver,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=stepperDriver,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of top_stepperDriver_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of top_stepperDriver_0_0 : entity is "module_ref";
end top_stepperDriver_0_0;

architecture stub of top_stepperDriver_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,dir,en,phA1,phB1,phA2,phB2,reset";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_mode of reset : signal is "slave reset";
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "stepperDriver,Vivado 2025.1";
begin
end;
