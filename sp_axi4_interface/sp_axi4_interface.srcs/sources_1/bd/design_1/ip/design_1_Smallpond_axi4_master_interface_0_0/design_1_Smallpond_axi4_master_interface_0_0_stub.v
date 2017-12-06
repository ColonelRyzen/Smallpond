// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
// Date        : Wed Dec  6 14:41:53 2017
// Host        : bonner running 64-bit Ubuntu 17.10
// Command     : write_verilog -force -mode synth_stub
//               /home/lab/Documents/justin/Smallpond/sp_axi4_interface/sp_axi4_interface.srcs/sources_1/bd/design_1/ip/design_1_Smallpond_axi4_master_interface_0_0/design_1_Smallpond_axi4_master_interface_0_0_stub.v
// Design      : design_1_Smallpond_axi4_master_interface_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "sp_axi4_master_v1_0,Vivado 2017.3" *)
module design_1_Smallpond_axi4_master_interface_0_0(sp_read, sp_sign_extend, sp_write, sp_op_len, 
  sp_addr, sp_data_in, sp_data_out, sp_over, sp_error, m00_axi_awaddr, m00_axi_awprot, 
  m00_axi_awvalid, m00_axi_awready, m00_axi_wdata, m00_axi_wstrb, m00_axi_wvalid, 
  m00_axi_wready, m00_axi_bresp, m00_axi_bvalid, m00_axi_bready, m00_axi_araddr, 
  m00_axi_arprot, m00_axi_arvalid, m00_axi_arready, m00_axi_rdata, m00_axi_rresp, 
  m00_axi_rvalid, m00_axi_rready, m00_axi_aclk, m00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="sp_read,sp_sign_extend,sp_write,sp_op_len[1:0],sp_addr[31:0],sp_data_in[31:0],sp_data_out[31:0],sp_over,sp_error,m00_axi_awaddr[31:0],m00_axi_awprot[2:0],m00_axi_awvalid,m00_axi_awready,m00_axi_wdata[31:0],m00_axi_wstrb[3:0],m00_axi_wvalid,m00_axi_wready,m00_axi_bresp[1:0],m00_axi_bvalid,m00_axi_bready,m00_axi_araddr[31:0],m00_axi_arprot[2:0],m00_axi_arvalid,m00_axi_arready,m00_axi_rdata[31:0],m00_axi_rresp[1:0],m00_axi_rvalid,m00_axi_rready,m00_axi_aclk,m00_axi_aresetn" */;
  input sp_read;
  input sp_sign_extend;
  input sp_write;
  input [1:0]sp_op_len;
  input [31:0]sp_addr;
  input [31:0]sp_data_in;
  output [31:0]sp_data_out;
  output sp_over;
  output sp_error;
  output [31:0]m00_axi_awaddr;
  output [2:0]m00_axi_awprot;
  output m00_axi_awvalid;
  input m00_axi_awready;
  output [31:0]m00_axi_wdata;
  output [3:0]m00_axi_wstrb;
  output m00_axi_wvalid;
  input m00_axi_wready;
  input [1:0]m00_axi_bresp;
  input m00_axi_bvalid;
  output m00_axi_bready;
  output [31:0]m00_axi_araddr;
  output [2:0]m00_axi_arprot;
  output m00_axi_arvalid;
  input m00_axi_arready;
  input [31:0]m00_axi_rdata;
  input [1:0]m00_axi_rresp;
  input m00_axi_rvalid;
  output m00_axi_rready;
  input m00_axi_aclk;
  input m00_axi_aresetn;
endmodule
