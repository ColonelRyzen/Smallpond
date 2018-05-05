vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../smallpond_top.srcs/sources_1/ip/clk_div" "+incdir+../../../../smallpond_top.srcs/sources_1/ip/clk_div" \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"/media/zack/528CA51E8CA4FE1B/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/smallpond_top/smallpond_top.srcs/sources_1/ip/clk_div/clk_div_sim_netlist.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

