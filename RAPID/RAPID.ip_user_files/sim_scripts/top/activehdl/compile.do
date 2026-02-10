transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/interrupt_control_v3_1_5
vlib activehdl/axi_gpio_v2_0_37
vlib activehdl/xlslice_v1_0_5
vlib activehdl/proc_sys_reset_v5_0_17

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 activehdl/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 activehdl/axi_gpio_v2_0_37
vmap xlslice_v1_0_5 activehdl/xlslice_v1_0_5
vmap proc_sys_reset_v5_0_17 activehdl/proc_sys_reset_v5_0_17

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l xlslice_v1_0_5 -l proc_sys_reset_v5_0_17 \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/6cfa/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/a8e4/hdl/verilog" "+incdir+C:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l xlslice_v1_0_5 -l proc_sys_reset_v5_0_17 \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/top/ip/top_processing_system7_0_0_1/top_processing_system7_0_0_sim_netlist.vhdl" \
"../../../bd/top/ip/top_Spindle_0_0/sim/top_Spindle_0_0.vhd" \
"../../../bd/top/ip/top_stepperDriver_0_0_1/sim/top_stepperDriver_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../RAPID.gen/sources_1/bd/top/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  \
"../../../../RAPID.gen/sources_1/bd/top/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -93  \
"../../../../RAPID.gen/sources_1/bd/top/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/top/ip/top_axi_gpio_0_1/sim/top_axi_gpio_0_1.vhd" \

vlog -work xlslice_v1_0_5  -v2k5 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/6cfa/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/a8e4/hdl/verilog" "+incdir+C:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l xlslice_v1_0_5 -l proc_sys_reset_v5_0_17 \
"../../../../RAPID.srcs/sources_1/bd/top/ipshared/6792/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/6cfa/hdl" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../RAPID.gen/sources_1/bd/top/ipshared/a8e4/hdl/verilog" "+incdir+C:/Xilinx/2025.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l xlslice_v1_0_5 -l proc_sys_reset_v5_0_17 \
"../../../bd/top/ip/top_xlslice_0_1/sim/top_xlslice_0_1.v" \
"../../../bd/top/ip/top_xlslice_0_2/sim/top_xlslice_0_2.v" \
"../../../bd/top/ip/top_xlslice_0_3/sim/top_xlslice_0_3.v" \
"../../../bd/top/ip/top_xlslice_0_4/sim/top_xlslice_0_4.v" \
"../../../bd/top/ip/top_xlslice_0_5/sim/top_xlslice_0_5.v" \
"../../../bd/top/ip/top_xlslice_0_6/sim/top_xlslice_0_6.v" \

vcom -work proc_sys_reset_v5_0_17 -93  \
"../../../../RAPID.gen/sources_1/bd/top/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/top/ip/top_rst_ps7_0_100M_1/sim/top_rst_ps7_0_100M_1.vhd" \
"../../../bd/top/ip/top_axi_smc_1/top_axi_smc_1_sim_netlist.vhdl" \
"../../../bd/top/sim/top.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

