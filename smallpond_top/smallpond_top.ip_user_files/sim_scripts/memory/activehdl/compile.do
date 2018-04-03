vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"/media/zack/528CA51E8CA4FE1B/Users/zacks/Documents/UB/Senior/Fall 2017/CSE490/smallpond/Smallpond/smallpond_top/smallpond_top.srcs/sources_1/ip/memory/memory_sim_netlist.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

