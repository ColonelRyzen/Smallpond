// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Sun Apr  8 15:45:45 2018
// Host        : enterprise running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode synth_stub {/media/zack/528CA51E8CA4FE1B/Users/zacks/Documents/UB/Senior/Fall
//               2017/CSE490/smallpond_temp/Smallpond/uart/uart.srcs/sources_1/ip/clk_div/clk_div_stub.v}
// Design      : clk_div
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_div(clk_out, clk)
/* synthesis syn_black_box black_box_pad_pin="clk_out,clk" */;
  output clk_out;
  input clk;
endmodule
