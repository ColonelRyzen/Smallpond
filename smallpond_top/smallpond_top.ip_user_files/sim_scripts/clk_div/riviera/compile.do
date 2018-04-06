vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../smallpond_top.srcs/sources_1/ip/clk_div" "+incdir+../../../../smallpond_top.srcs/sources_1/ip/clk_div" \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"/media/zack/528CA51E8CA4FE1B/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/smallpond_top/smallpond_top.srcs/sources_1/ip/clk_div/clk_div_sim_netlist.vhdl" \


vlog -work xil_defaultlib \
"glbl.v"

