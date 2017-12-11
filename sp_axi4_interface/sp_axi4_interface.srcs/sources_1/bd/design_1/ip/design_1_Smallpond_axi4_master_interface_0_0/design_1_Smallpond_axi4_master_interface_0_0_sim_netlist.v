// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
// Date        : Mon Dec 11 10:36:33 2017
// Host        : bonner running 64-bit Ubuntu 17.10
// Command     : write_verilog -force -mode funcsim -rename_top design_1_Smallpond_axi4_master_interface_0_0 -prefix
//               design_1_Smallpond_axi4_master_interface_0_0_ design_1_Smallpond_axi4_master_interface_0_0_sim_netlist.v
// Design      : design_1_Smallpond_axi4_master_interface_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_Smallpond_axi4_master_interface_0_0,sp_axi4_master_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "sp_axi4_master_v1_0,Vivado 2017.3.1" *) 
(* NotValidForBitStream *)
module design_1_Smallpond_axi4_master_interface_0_0
   (sp_read,
    sp_sign_extend,
    sp_write,
    sp_op_len,
    sp_addr,
    sp_data_in,
    sp_data_out,
    sp_over,
    sp_error,
    m00_axi_awaddr,
    m00_axi_awprot,
    m00_axi_awvalid,
    m00_axi_awready,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_wvalid,
    m00_axi_wready,
    m00_axi_bresp,
    m00_axi_bvalid,
    m00_axi_bready,
    m00_axi_araddr,
    m00_axi_arprot,
    m00_axi_arvalid,
    m00_axi_arready,
    m00_axi_rdata,
    m00_axi_rresp,
    m00_axi_rvalid,
    m00_axi_rready,
    m00_axi_aclk,
    m00_axi_aresetn);
  input sp_read;
  input sp_sign_extend;
  input sp_write;
  input [1:0]sp_op_len;
  input [31:0]sp_addr;
  input [31:0]sp_data_in;
  output [31:0]sp_data_out;
  output sp_over;
  output sp_error;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) output [31:0]m00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *) output [2:0]m00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *) output m00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *) input m00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *) output [31:0]m00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *) output [3:0]m00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *) output m00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *) input m00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *) input [1:0]m00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *) input m00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *) output m00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *) output [31:0]m00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *) output [2:0]m00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *) output m00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *) input m00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *) input [31:0]m00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *) input [1:0]m00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *) input m00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *) output m00_axi_rready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M00_AXI_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_CLK, ASSOCIATED_BUSIF M00_AXI, ASSOCIATED_RESET m00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *) input m00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 M00_AXI_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_RST, POLARITY ACTIVE_LOW" *) input m00_axi_aresetn;

  wire \<const0> ;
  wire \<const1> ;
  wire m00_axi_aclk;
  wire [31:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire [31:0]m00_axi_awaddr;
  wire m00_axi_awready;
  wire m00_axi_awvalid;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire [31:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;
  wire [31:0]m00_axi_wdata;
  wire m00_axi_wready;
  wire [2:0]\^m00_axi_wstrb ;
  wire m00_axi_wvalid;
  wire [31:0]sp_addr;
  wire [31:0]sp_data_in;
  wire [31:0]sp_data_out;
  wire [1:0]sp_op_len;
  wire sp_over;
  wire sp_read;
  wire sp_sign_extend;
  wire sp_write;

  assign m00_axi_arprot[2] = \<const0> ;
  assign m00_axi_arprot[1] = \<const0> ;
  assign m00_axi_arprot[0] = \<const1> ;
  assign m00_axi_awprot[2] = \<const0> ;
  assign m00_axi_awprot[1] = \<const0> ;
  assign m00_axi_awprot[0] = \<const0> ;
  assign m00_axi_wstrb[3] = \^m00_axi_wstrb [2];
  assign m00_axi_wstrb[2:0] = \^m00_axi_wstrb [2:0];
  assign sp_error = \<const1> ;
  GND GND
       (.G(\<const0> ));
  design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0 U0
       (.m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_arvalid(m00_axi_arvalid),
        .m00_axi_awaddr(m00_axi_awaddr),
        .m00_axi_awready(m00_axi_awready),
        .m00_axi_awvalid(m00_axi_awvalid),
        .m00_axi_bready(m00_axi_bready),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rready(m00_axi_rready),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_wdata(m00_axi_wdata),
        .m00_axi_wready(m00_axi_wready),
        .m00_axi_wstrb(\^m00_axi_wstrb ),
        .m00_axi_wvalid(m00_axi_wvalid),
        .sp_addr(sp_addr),
        .sp_data_in(sp_data_in),
        .sp_data_out(sp_data_out),
        .sp_op_len(sp_op_len),
        .sp_over(sp_over),
        .sp_read(sp_read),
        .sp_sign_extend(sp_sign_extend),
        .sp_write(sp_write));
  VCC VCC
       (.P(\<const1> ));
endmodule

module design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0
   (sp_data_out,
    m00_axi_bready,
    m00_axi_awaddr,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_araddr,
    m00_axi_rready,
    sp_over,
    m00_axi_awvalid,
    m00_axi_wvalid,
    m00_axi_arvalid,
    sp_op_len,
    m00_axi_aclk,
    sp_sign_extend,
    m00_axi_rdata,
    m00_axi_bvalid,
    m00_axi_aresetn,
    sp_write,
    sp_data_in,
    sp_addr,
    sp_read,
    m00_axi_rvalid,
    m00_axi_awready,
    m00_axi_wready,
    m00_axi_arready);
  output [31:0]sp_data_out;
  output m00_axi_bready;
  output [31:0]m00_axi_awaddr;
  output [31:0]m00_axi_wdata;
  output [2:0]m00_axi_wstrb;
  output [31:0]m00_axi_araddr;
  output m00_axi_rready;
  output sp_over;
  output m00_axi_awvalid;
  output m00_axi_wvalid;
  output m00_axi_arvalid;
  input [1:0]sp_op_len;
  input m00_axi_aclk;
  input sp_sign_extend;
  input [31:0]m00_axi_rdata;
  input m00_axi_bvalid;
  input m00_axi_aresetn;
  input sp_write;
  input [31:0]sp_data_in;
  input [31:0]sp_addr;
  input sp_read;
  input m00_axi_rvalid;
  input m00_axi_awready;
  input m00_axi_wready;
  input m00_axi_arready;

  wire m00_axi_aclk;
  wire [31:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire [31:0]m00_axi_awaddr;
  wire m00_axi_awready;
  wire m00_axi_awvalid;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire [31:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;
  wire [31:0]m00_axi_wdata;
  wire m00_axi_wready;
  wire [2:0]m00_axi_wstrb;
  wire m00_axi_wvalid;
  wire [31:0]sp_addr;
  wire [31:0]sp_data_in;
  wire [31:0]sp_data_out;
  wire [1:0]sp_op_len;
  wire sp_over;
  wire sp_read;
  wire sp_sign_extend;
  wire sp_write;

  design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0_M00_AXI sp_axi4_master_v1_0_M00_AXI_inst
       (.m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_arvalid(m00_axi_arvalid),
        .m00_axi_awaddr(m00_axi_awaddr),
        .m00_axi_awready(m00_axi_awready),
        .m00_axi_awvalid(m00_axi_awvalid),
        .m00_axi_bready(m00_axi_bready),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rready(m00_axi_rready),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_wdata(m00_axi_wdata),
        .m00_axi_wready(m00_axi_wready),
        .m00_axi_wstrb(m00_axi_wstrb),
        .m00_axi_wvalid(m00_axi_wvalid),
        .sp_addr(sp_addr),
        .sp_data_in(sp_data_in),
        .sp_data_out(sp_data_out),
        .sp_op_len(sp_op_len),
        .sp_over(sp_over),
        .sp_read(sp_read),
        .sp_sign_extend(sp_sign_extend),
        .sp_write(sp_write));
endmodule

module design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0_M00_AXI
   (sp_data_out,
    m00_axi_bready,
    m00_axi_awaddr,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_araddr,
    m00_axi_rready,
    sp_over,
    m00_axi_awvalid,
    m00_axi_wvalid,
    m00_axi_arvalid,
    sp_op_len,
    m00_axi_aclk,
    sp_sign_extend,
    m00_axi_rdata,
    m00_axi_bvalid,
    m00_axi_aresetn,
    sp_write,
    sp_data_in,
    sp_addr,
    sp_read,
    m00_axi_rvalid,
    m00_axi_awready,
    m00_axi_wready,
    m00_axi_arready);
  output [31:0]sp_data_out;
  output m00_axi_bready;
  output [31:0]m00_axi_awaddr;
  output [31:0]m00_axi_wdata;
  output [2:0]m00_axi_wstrb;
  output [31:0]m00_axi_araddr;
  output m00_axi_rready;
  output sp_over;
  output m00_axi_awvalid;
  output m00_axi_wvalid;
  output m00_axi_arvalid;
  input [1:0]sp_op_len;
  input m00_axi_aclk;
  input sp_sign_extend;
  input [31:0]m00_axi_rdata;
  input m00_axi_bvalid;
  input m00_axi_aresetn;
  input sp_write;
  input [31:0]sp_data_in;
  input [31:0]sp_addr;
  input sp_read;
  input m00_axi_rvalid;
  input m00_axi_awready;
  input m00_axi_wready;
  input m00_axi_arready;

  wire \axi_araddr[27]_i_2_n_0 ;
  wire \axi_araddr[31]_i_1_n_0 ;
  wire \axi_araddr[31]_i_3_n_0 ;
  wire axi_arvalid_i_1_n_0;
  wire axi_awaddr1;
  wire \axi_awaddr[0]_i_1_n_0 ;
  wire \axi_awaddr[10]_i_1_n_0 ;
  wire \axi_awaddr[11]_i_1_n_0 ;
  wire \axi_awaddr[12]_i_1_n_0 ;
  wire \axi_awaddr[13]_i_1_n_0 ;
  wire \axi_awaddr[14]_i_1_n_0 ;
  wire \axi_awaddr[15]_i_1_n_0 ;
  wire \axi_awaddr[16]_i_1_n_0 ;
  wire \axi_awaddr[17]_i_1_n_0 ;
  wire \axi_awaddr[18]_i_1_n_0 ;
  wire \axi_awaddr[19]_i_1_n_0 ;
  wire \axi_awaddr[1]_i_1_n_0 ;
  wire \axi_awaddr[20]_i_1_n_0 ;
  wire \axi_awaddr[21]_i_1_n_0 ;
  wire \axi_awaddr[22]_i_1_n_0 ;
  wire \axi_awaddr[23]_i_1_n_0 ;
  wire \axi_awaddr[24]_i_1_n_0 ;
  wire \axi_awaddr[25]_i_1_n_0 ;
  wire \axi_awaddr[26]_i_1_n_0 ;
  wire \axi_awaddr[27]_i_1_n_0 ;
  wire \axi_awaddr[27]_i_3_n_0 ;
  wire \axi_awaddr[28]_i_1_n_0 ;
  wire \axi_awaddr[29]_i_1_n_0 ;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[30]_i_1_n_0 ;
  wire \axi_awaddr[31]_i_3_n_0 ;
  wire \axi_awaddr[31]_i_5_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_3_n_0 ;
  wire \axi_awaddr[4]_i_1_n_0 ;
  wire \axi_awaddr[5]_i_1_n_0 ;
  wire \axi_awaddr[6]_i_1_n_0 ;
  wire \axi_awaddr[7]_i_1_n_0 ;
  wire \axi_awaddr[8]_i_1_n_0 ;
  wire \axi_awaddr[9]_i_1_n_0 ;
  wire \axi_awaddr_reg[11]_i_2_n_0 ;
  wire \axi_awaddr_reg[11]_i_2_n_1 ;
  wire \axi_awaddr_reg[11]_i_2_n_2 ;
  wire \axi_awaddr_reg[11]_i_2_n_3 ;
  wire \axi_awaddr_reg[15]_i_2_n_0 ;
  wire \axi_awaddr_reg[15]_i_2_n_1 ;
  wire \axi_awaddr_reg[15]_i_2_n_2 ;
  wire \axi_awaddr_reg[15]_i_2_n_3 ;
  wire \axi_awaddr_reg[19]_i_2_n_0 ;
  wire \axi_awaddr_reg[19]_i_2_n_1 ;
  wire \axi_awaddr_reg[19]_i_2_n_2 ;
  wire \axi_awaddr_reg[19]_i_2_n_3 ;
  wire \axi_awaddr_reg[23]_i_2_n_0 ;
  wire \axi_awaddr_reg[23]_i_2_n_1 ;
  wire \axi_awaddr_reg[23]_i_2_n_2 ;
  wire \axi_awaddr_reg[23]_i_2_n_3 ;
  wire \axi_awaddr_reg[27]_i_2_n_0 ;
  wire \axi_awaddr_reg[27]_i_2_n_1 ;
  wire \axi_awaddr_reg[27]_i_2_n_2 ;
  wire \axi_awaddr_reg[27]_i_2_n_3 ;
  wire \axi_awaddr_reg[31]_i_6_n_1 ;
  wire \axi_awaddr_reg[31]_i_6_n_2 ;
  wire \axi_awaddr_reg[31]_i_6_n_3 ;
  wire \axi_awaddr_reg[3]_i_2_n_0 ;
  wire \axi_awaddr_reg[3]_i_2_n_1 ;
  wire \axi_awaddr_reg[3]_i_2_n_2 ;
  wire \axi_awaddr_reg[3]_i_2_n_3 ;
  wire \axi_awaddr_reg[7]_i_2_n_0 ;
  wire \axi_awaddr_reg[7]_i_2_n_1 ;
  wire \axi_awaddr_reg[7]_i_2_n_2 ;
  wire \axi_awaddr_reg[7]_i_2_n_3 ;
  wire axi_awvalid_i_1_n_0;
  wire axi_bready_i_1_n_0;
  wire axi_rready_i_1_n_0;
  wire axi_wdata;
  wire \axi_wdata[0]_i_1_n_0 ;
  wire \axi_wdata[10]_i_1_n_0 ;
  wire \axi_wdata[11]_i_1_n_0 ;
  wire \axi_wdata[12]_i_1_n_0 ;
  wire \axi_wdata[13]_i_1_n_0 ;
  wire \axi_wdata[14]_i_1_n_0 ;
  wire \axi_wdata[15]_i_1_n_0 ;
  wire \axi_wdata[15]_i_2_n_0 ;
  wire \axi_wdata[16]_i_1_n_0 ;
  wire \axi_wdata[17]_i_1_n_0 ;
  wire \axi_wdata[18]_i_1_n_0 ;
  wire \axi_wdata[19]_i_1_n_0 ;
  wire \axi_wdata[1]_i_1_n_0 ;
  wire \axi_wdata[20]_i_1_n_0 ;
  wire \axi_wdata[21]_i_1_n_0 ;
  wire \axi_wdata[22]_i_1_n_0 ;
  wire \axi_wdata[23]_i_1_n_0 ;
  wire \axi_wdata[24]_i_1_n_0 ;
  wire \axi_wdata[25]_i_1_n_0 ;
  wire \axi_wdata[26]_i_1_n_0 ;
  wire \axi_wdata[27]_i_1_n_0 ;
  wire \axi_wdata[28]_i_1_n_0 ;
  wire \axi_wdata[29]_i_1_n_0 ;
  wire \axi_wdata[2]_i_1_n_0 ;
  wire \axi_wdata[30]_i_1_n_0 ;
  wire \axi_wdata[31]_i_1_n_0 ;
  wire \axi_wdata[3]_i_1_n_0 ;
  wire \axi_wdata[4]_i_1_n_0 ;
  wire \axi_wdata[5]_i_1_n_0 ;
  wire \axi_wdata[6]_i_1_n_0 ;
  wire \axi_wdata[7]_i_1_n_0 ;
  wire \axi_wdata[8]_i_1_n_0 ;
  wire \axi_wdata[9]_i_1_n_0 ;
  wire axi_wvalid_i_1_n_0;
  wire \data_out[10]_i_1_n_0 ;
  wire \data_out[11]_i_1_n_0 ;
  wire \data_out[12]_i_1_n_0 ;
  wire \data_out[13]_i_1_n_0 ;
  wire \data_out[14]_i_1_n_0 ;
  wire \data_out[14]_i_2_n_0 ;
  wire \data_out[15]_i_1_n_0 ;
  wire \data_out[31]_i_1_n_0 ;
  wire \data_out[31]_i_3_n_0 ;
  wire \data_out[31]_i_4_n_0 ;
  wire \data_out[31]_i_5_n_0 ;
  wire \data_out[31]_i_6_n_0 ;
  wire \data_out[8]_i_1_n_0 ;
  wire \data_out[9]_i_1_n_0 ;
  wire m00_axi_aclk;
  wire [31:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire [31:0]m00_axi_awaddr;
  wire m00_axi_awready;
  wire m00_axi_awvalid;
  wire m00_axi_bready;
  wire m00_axi_bvalid;
  wire [31:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;
  wire [31:0]m00_axi_wdata;
  wire m00_axi_wready;
  wire [2:0]m00_axi_wstrb;
  wire m00_axi_wvalid;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire [31:0]p_2_in;
  wire [31:0]plusOp;
  wire read_issued;
  wire read_issued_i_1_n_0;
  wire read_issued_i_2_n_0;
  wire read_over_i_1_n_0;
  wire read_over_i_2_n_0;
  wire read_over_i_3_n_0;
  wire read_over_reg_n_0;
  wire rstep;
  wire rstep_i_1_n_0;
  wire rstep_i_2_n_0;
  wire [31:0]sp_addr;
  wire [31:0]sp_data_in;
  wire [31:0]sp_data_out;
  wire [1:0]sp_op_len;
  wire sp_over;
  wire sp_read;
  wire sp_sign_extend;
  wire sp_write;
  wire start_single_read_i_1_n_0;
  wire start_single_read_i_2_n_0;
  wire start_single_read_reg_n_0;
  wire start_single_write;
  wire start_single_write_i_1_n_0;
  wire start_single_write_i_2_n_0;
  wire start_single_write_i_3_n_0;
  wire write_issued_i_1_n_0;
  wire write_issued_reg_n_0;
  wire write_over;
  wire write_over_i_1_n_0;
  wire write_over_reg_n_0;
  wire \write_strobes[0]_i_1_n_0 ;
  wire \write_strobes[1]_i_1_n_0 ;
  wire \write_strobes[3]_i_1_n_0 ;
  wire wstep;
  wire wstep_i_1_n_0;
  wire wstep_i_2_n_0;
  wire [3:3]\NLW_axi_awaddr_reg[31]_i_6_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[0]_i_1 
       (.I0(sp_addr[0]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[0]),
        .O(p_2_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[10]_i_1 
       (.I0(sp_addr[10]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[10]),
        .O(p_2_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[11]_i_1 
       (.I0(sp_addr[11]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[11]),
        .O(p_2_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[12]_i_1 
       (.I0(sp_addr[12]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[12]),
        .O(p_2_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[13]_i_1 
       (.I0(sp_addr[13]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[13]),
        .O(p_2_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[14]_i_1 
       (.I0(sp_addr[14]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[14]),
        .O(p_2_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[15]_i_1 
       (.I0(sp_addr[15]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[15]),
        .O(p_2_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[16]_i_1 
       (.I0(sp_addr[16]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[16]),
        .O(p_2_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[17]_i_1 
       (.I0(sp_addr[17]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[17]),
        .O(p_2_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[18]_i_1 
       (.I0(sp_addr[18]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[18]),
        .O(p_2_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[19]_i_1 
       (.I0(sp_addr[19]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[19]),
        .O(p_2_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[1]_i_1 
       (.I0(sp_addr[1]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[1]),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[20]_i_1 
       (.I0(sp_addr[20]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[20]),
        .O(p_2_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[21]_i_1 
       (.I0(sp_addr[21]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[21]),
        .O(p_2_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[22]_i_1 
       (.I0(sp_addr[22]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[22]),
        .O(p_2_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[23]_i_1 
       (.I0(sp_addr[23]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[23]),
        .O(p_2_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[24]_i_1 
       (.I0(sp_addr[24]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[24]),
        .O(p_2_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[25]_i_1 
       (.I0(sp_addr[25]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[25]),
        .O(p_2_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[26]_i_1 
       (.I0(sp_addr[26]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[26]),
        .O(p_2_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[27]_i_1 
       (.I0(sp_addr[27]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[27]),
        .O(p_2_in[27]));
  LUT6 #(
    .INIT(64'hFFFBFFFBFFFFFFFB)) 
    \axi_araddr[27]_i_2 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[28]),
        .I3(sp_addr[29]),
        .I4(sp_read),
        .I5(read_issued),
        .O(\axi_araddr[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \axi_araddr[28]_i_1 
       (.I0(\axi_araddr[31]_i_3_n_0 ),
        .I1(sp_addr[29]),
        .I2(plusOp[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_addr[28]),
        .O(p_2_in[28]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002000)) 
    \axi_araddr[29]_i_1 
       (.I0(\axi_araddr[31]_i_3_n_0 ),
        .I1(sp_addr[28]),
        .I2(plusOp[29]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_addr[29]),
        .O(p_2_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[2]_i_1 
       (.I0(sp_addr[2]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[2]),
        .O(p_2_in[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000080)) 
    \axi_araddr[30]_i_1 
       (.I0(\axi_araddr[31]_i_3_n_0 ),
        .I1(sp_addr[31]),
        .I2(plusOp[30]),
        .I3(sp_addr[29]),
        .I4(sp_addr[28]),
        .I5(sp_addr[30]),
        .O(p_2_in[30]));
  LUT6 #(
    .INIT(64'h00020002FFFF0002)) 
    \axi_araddr[31]_i_1 
       (.I0(\data_out[31]_i_3_n_0 ),
        .I1(sp_op_len[0]),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(rstep),
        .I4(sp_read),
        .I5(read_issued),
        .O(\axi_araddr[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \axi_araddr[31]_i_2 
       (.I0(sp_addr[30]),
        .I1(plusOp[31]),
        .I2(sp_addr[29]),
        .I3(sp_addr[28]),
        .I4(\axi_araddr[31]_i_3_n_0 ),
        .I5(sp_addr[31]),
        .O(p_2_in[31]));
  LUT2 #(
    .INIT(4'hB)) 
    \axi_araddr[31]_i_3 
       (.I0(read_issued),
        .I1(sp_read),
        .O(\axi_araddr[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[3]_i_1 
       (.I0(sp_addr[3]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[3]),
        .O(p_2_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[4]_i_1 
       (.I0(sp_addr[4]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[4]),
        .O(p_2_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[5]_i_1 
       (.I0(sp_addr[5]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[5]),
        .O(p_2_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[6]_i_1 
       (.I0(sp_addr[6]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[6]),
        .O(p_2_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[7]_i_1 
       (.I0(sp_addr[7]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[7]),
        .O(p_2_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[8]_i_1 
       (.I0(sp_addr[8]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[8]),
        .O(p_2_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_araddr[9]_i_1 
       (.I0(sp_addr[9]),
        .I1(\axi_araddr[27]_i_2_n_0 ),
        .I2(plusOp[9]),
        .O(p_2_in[9]));
  FDRE \axi_araddr_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(m00_axi_araddr[0]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(m00_axi_araddr[10]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(m00_axi_araddr[11]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(m00_axi_araddr[12]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(m00_axi_araddr[13]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(m00_axi_araddr[14]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(m00_axi_araddr[15]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[16]),
        .Q(m00_axi_araddr[16]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[17]),
        .Q(m00_axi_araddr[17]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[18]),
        .Q(m00_axi_araddr[18]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[19]),
        .Q(m00_axi_araddr[19]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(m00_axi_araddr[1]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[20]),
        .Q(m00_axi_araddr[20]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[21]),
        .Q(m00_axi_araddr[21]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[22]),
        .Q(m00_axi_araddr[22]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[23]),
        .Q(m00_axi_araddr[23]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[24]),
        .Q(m00_axi_araddr[24]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[25]),
        .Q(m00_axi_araddr[25]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[26]),
        .Q(m00_axi_araddr[26]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[27]),
        .Q(m00_axi_araddr[27]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[28]),
        .Q(m00_axi_araddr[28]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[29]),
        .Q(m00_axi_araddr[29]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(m00_axi_araddr[2]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[30]),
        .Q(m00_axi_araddr[30]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[31]),
        .Q(m00_axi_araddr[31]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(m00_axi_araddr[3]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(m00_axi_araddr[4]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[5]),
        .Q(m00_axi_araddr[5]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[6]),
        .Q(m00_axi_araddr[6]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(m00_axi_araddr[7]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(m00_axi_araddr[8]),
        .R(p_0_in));
  FDRE \axi_araddr_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(m00_axi_araddr[9]),
        .R(p_0_in));
  LUT3 #(
    .INIT(8'hF2)) 
    axi_arvalid_i_1
       (.I0(m00_axi_arvalid),
        .I1(m00_axi_arready),
        .I2(start_single_read_reg_n_0),
        .O(axi_arvalid_i_1_n_0));
  FDRE axi_arvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_arvalid_i_1_n_0),
        .Q(m00_axi_arvalid),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[0]_i_1 
       (.I0(plusOp[0]),
        .I1(sp_addr[0]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[10]_i_1 
       (.I0(plusOp[10]),
        .I1(sp_addr[10]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[11]_i_1 
       (.I0(plusOp[11]),
        .I1(sp_addr[11]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[12]_i_1 
       (.I0(plusOp[12]),
        .I1(sp_addr[12]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[13]_i_1 
       (.I0(plusOp[13]),
        .I1(sp_addr[13]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[14]_i_1 
       (.I0(plusOp[14]),
        .I1(sp_addr[14]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[15]_i_1 
       (.I0(plusOp[15]),
        .I1(sp_addr[15]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[16]_i_1 
       (.I0(plusOp[16]),
        .I1(sp_addr[16]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[17]_i_1 
       (.I0(plusOp[17]),
        .I1(sp_addr[17]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[18]_i_1 
       (.I0(plusOp[18]),
        .I1(sp_addr[18]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[19]_i_1 
       (.I0(plusOp[19]),
        .I1(sp_addr[19]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[1]_i_1 
       (.I0(plusOp[1]),
        .I1(sp_addr[1]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[20]_i_1 
       (.I0(plusOp[20]),
        .I1(sp_addr[20]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[21]_i_1 
       (.I0(plusOp[21]),
        .I1(sp_addr[21]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[22]_i_1 
       (.I0(plusOp[22]),
        .I1(sp_addr[22]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[23]_i_1 
       (.I0(plusOp[23]),
        .I1(sp_addr[23]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[24]_i_1 
       (.I0(plusOp[24]),
        .I1(sp_addr[24]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[25]_i_1 
       (.I0(plusOp[25]),
        .I1(sp_addr[25]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[26]_i_1 
       (.I0(plusOp[26]),
        .I1(sp_addr[26]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[27]_i_1 
       (.I0(plusOp[27]),
        .I1(sp_addr[27]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBFFFBFFFFFFFB)) 
    \axi_awaddr[27]_i_3 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[28]),
        .I3(sp_addr[29]),
        .I4(sp_write),
        .I5(write_issued_reg_n_0),
        .O(\axi_awaddr[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000000)) 
    \axi_awaddr[28]_i_1 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[29]),
        .I3(plusOp[28]),
        .I4(\axi_awaddr[31]_i_5_n_0 ),
        .I5(sp_addr[28]),
        .O(\axi_awaddr[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000000)) 
    \axi_awaddr[29]_i_1 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[28]),
        .I3(plusOp[29]),
        .I4(\axi_awaddr[31]_i_5_n_0 ),
        .I5(sp_addr[29]),
        .O(\axi_awaddr[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[2]_i_1 
       (.I0(plusOp[2]),
        .I1(sp_addr[2]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \axi_awaddr[30]_i_1 
       (.I0(sp_addr[28]),
        .I1(sp_addr[29]),
        .I2(sp_addr[31]),
        .I3(plusOp[30]),
        .I4(\axi_awaddr[31]_i_5_n_0 ),
        .I5(sp_addr[30]),
        .O(\axi_awaddr[30]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_awaddr[31]_i_1 
       (.I0(m00_axi_aresetn),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0004000400FFFFFF)) 
    \axi_awaddr[31]_i_2 
       (.I0(\data_out[31]_i_6_n_0 ),
        .I1(axi_awaddr1),
        .I2(wstep),
        .I3(sp_op_len[0]),
        .I4(sp_op_len[1]),
        .I5(\axi_awaddr[31]_i_5_n_0 ),
        .O(axi_wdata));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \axi_awaddr[31]_i_3 
       (.I0(sp_addr[30]),
        .I1(plusOp[31]),
        .I2(sp_addr[29]),
        .I3(sp_addr[28]),
        .I4(\axi_awaddr[31]_i_5_n_0 ),
        .I5(sp_addr[31]),
        .O(\axi_awaddr[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \axi_awaddr[31]_i_4 
       (.I0(m00_axi_bready),
        .I1(write_issued_reg_n_0),
        .I2(m00_axi_bvalid),
        .I3(start_single_write),
        .O(axi_awaddr1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \axi_awaddr[31]_i_5 
       (.I0(write_issued_reg_n_0),
        .I1(sp_write),
        .O(\axi_awaddr[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[3]_i_1 
       (.I0(plusOp[3]),
        .I1(sp_addr[3]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_awaddr[3]_i_3 
       (.I0(sp_addr[1]),
        .O(\axi_awaddr[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[4]_i_1 
       (.I0(plusOp[4]),
        .I1(sp_addr[4]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[5]_i_1 
       (.I0(plusOp[5]),
        .I1(sp_addr[5]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[6]_i_1 
       (.I0(plusOp[6]),
        .I1(sp_addr[6]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[7]_i_1 
       (.I0(plusOp[7]),
        .I1(sp_addr[7]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[8]_i_1 
       (.I0(plusOp[8]),
        .I1(sp_addr[8]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \axi_awaddr[9]_i_1 
       (.I0(plusOp[9]),
        .I1(sp_addr[9]),
        .I2(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_awaddr[9]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[0] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[0]_i_1_n_0 ),
        .Q(m00_axi_awaddr[0]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[10] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[10]_i_1_n_0 ),
        .Q(m00_axi_awaddr[10]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[11] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[11]_i_1_n_0 ),
        .Q(m00_axi_awaddr[11]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[11]_i_2 
       (.CI(\axi_awaddr_reg[7]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[11]_i_2_n_0 ,\axi_awaddr_reg[11]_i_2_n_1 ,\axi_awaddr_reg[11]_i_2_n_2 ,\axi_awaddr_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[11:8]),
        .S(sp_addr[11:8]));
  FDRE \axi_awaddr_reg[12] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[12]_i_1_n_0 ),
        .Q(m00_axi_awaddr[12]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[13] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[13]_i_1_n_0 ),
        .Q(m00_axi_awaddr[13]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[14] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[14]_i_1_n_0 ),
        .Q(m00_axi_awaddr[14]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[15] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[15]_i_1_n_0 ),
        .Q(m00_axi_awaddr[15]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[15]_i_2 
       (.CI(\axi_awaddr_reg[11]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[15]_i_2_n_0 ,\axi_awaddr_reg[15]_i_2_n_1 ,\axi_awaddr_reg[15]_i_2_n_2 ,\axi_awaddr_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[15:12]),
        .S(sp_addr[15:12]));
  FDRE \axi_awaddr_reg[16] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[16]_i_1_n_0 ),
        .Q(m00_axi_awaddr[16]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[17] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[17]_i_1_n_0 ),
        .Q(m00_axi_awaddr[17]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[18] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[18]_i_1_n_0 ),
        .Q(m00_axi_awaddr[18]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[19] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[19]_i_1_n_0 ),
        .Q(m00_axi_awaddr[19]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[19]_i_2 
       (.CI(\axi_awaddr_reg[15]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[19]_i_2_n_0 ,\axi_awaddr_reg[19]_i_2_n_1 ,\axi_awaddr_reg[19]_i_2_n_2 ,\axi_awaddr_reg[19]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[19:16]),
        .S(sp_addr[19:16]));
  FDRE \axi_awaddr_reg[1] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[1]_i_1_n_0 ),
        .Q(m00_axi_awaddr[1]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[20] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[20]_i_1_n_0 ),
        .Q(m00_axi_awaddr[20]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[21] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[21]_i_1_n_0 ),
        .Q(m00_axi_awaddr[21]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[22] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[22]_i_1_n_0 ),
        .Q(m00_axi_awaddr[22]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[23] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[23]_i_1_n_0 ),
        .Q(m00_axi_awaddr[23]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[23]_i_2 
       (.CI(\axi_awaddr_reg[19]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[23]_i_2_n_0 ,\axi_awaddr_reg[23]_i_2_n_1 ,\axi_awaddr_reg[23]_i_2_n_2 ,\axi_awaddr_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[23:20]),
        .S(sp_addr[23:20]));
  FDRE \axi_awaddr_reg[24] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[24]_i_1_n_0 ),
        .Q(m00_axi_awaddr[24]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[25] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[25]_i_1_n_0 ),
        .Q(m00_axi_awaddr[25]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[26] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[26]_i_1_n_0 ),
        .Q(m00_axi_awaddr[26]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[27] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[27]_i_1_n_0 ),
        .Q(m00_axi_awaddr[27]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[27]_i_2 
       (.CI(\axi_awaddr_reg[23]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[27]_i_2_n_0 ,\axi_awaddr_reg[27]_i_2_n_1 ,\axi_awaddr_reg[27]_i_2_n_2 ,\axi_awaddr_reg[27]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[27:24]),
        .S(sp_addr[27:24]));
  FDRE \axi_awaddr_reg[28] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[28]_i_1_n_0 ),
        .Q(m00_axi_awaddr[28]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[29] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[29]_i_1_n_0 ),
        .Q(m00_axi_awaddr[29]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[2] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(m00_axi_awaddr[2]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[30] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[30]_i_1_n_0 ),
        .Q(m00_axi_awaddr[30]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[31] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[31]_i_3_n_0 ),
        .Q(m00_axi_awaddr[31]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[31]_i_6 
       (.CI(\axi_awaddr_reg[27]_i_2_n_0 ),
        .CO({\NLW_axi_awaddr_reg[31]_i_6_CO_UNCONNECTED [3],\axi_awaddr_reg[31]_i_6_n_1 ,\axi_awaddr_reg[31]_i_6_n_2 ,\axi_awaddr_reg[31]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[31:28]),
        .S(sp_addr[31:28]));
  FDRE \axi_awaddr_reg[3] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(m00_axi_awaddr[3]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\axi_awaddr_reg[3]_i_2_n_0 ,\axi_awaddr_reg[3]_i_2_n_1 ,\axi_awaddr_reg[3]_i_2_n_2 ,\axi_awaddr_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sp_addr[1],1'b0}),
        .O(plusOp[3:0]),
        .S({sp_addr[3:2],\axi_awaddr[3]_i_3_n_0 ,sp_addr[0]}));
  FDRE \axi_awaddr_reg[4] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[4]_i_1_n_0 ),
        .Q(m00_axi_awaddr[4]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[5] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[5]_i_1_n_0 ),
        .Q(m00_axi_awaddr[5]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[6] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[6]_i_1_n_0 ),
        .Q(m00_axi_awaddr[6]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[7] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[7]_i_1_n_0 ),
        .Q(m00_axi_awaddr[7]),
        .R(p_0_in));
  CARRY4 \axi_awaddr_reg[7]_i_2 
       (.CI(\axi_awaddr_reg[3]_i_2_n_0 ),
        .CO({\axi_awaddr_reg[7]_i_2_n_0 ,\axi_awaddr_reg[7]_i_2_n_1 ,\axi_awaddr_reg[7]_i_2_n_2 ,\axi_awaddr_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[7:4]),
        .S(sp_addr[7:4]));
  FDRE \axi_awaddr_reg[8] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[8]_i_1_n_0 ),
        .Q(m00_axi_awaddr[8]),
        .R(p_0_in));
  FDRE \axi_awaddr_reg[9] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_awaddr[9]_i_1_n_0 ),
        .Q(m00_axi_awaddr[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    axi_awvalid_i_1
       (.I0(m00_axi_awvalid),
        .I1(m00_axi_awready),
        .I2(start_single_write),
        .O(axi_awvalid_i_1_n_0));
  FDRE axi_awvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_awvalid_i_1_n_0),
        .Q(m00_axi_awvalid),
        .R(p_0_in));
  LUT2 #(
    .INIT(4'h4)) 
    axi_bready_i_1
       (.I0(m00_axi_bready),
        .I1(m00_axi_bvalid),
        .O(axi_bready_i_1_n_0));
  FDRE axi_bready_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_bready_i_1_n_0),
        .Q(m00_axi_bready),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    axi_rready_i_1
       (.I0(m00_axi_rready),
        .I1(m00_axi_rvalid),
        .I2(m00_axi_aresetn),
        .O(axi_rready_i_1_n_0));
  FDRE axi_rready_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_rready_i_1_n_0),
        .Q(m00_axi_rready),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[0]_i_1 
       (.I0(sp_data_in[0]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[16]),
        .O(\axi_wdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[10]_i_1 
       (.I0(sp_data_in[10]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[26]),
        .O(\axi_wdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[11]_i_1 
       (.I0(sp_data_in[11]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[27]),
        .O(\axi_wdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[12]_i_1 
       (.I0(sp_data_in[12]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[28]),
        .O(\axi_wdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[13]_i_1 
       (.I0(sp_data_in[13]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[29]),
        .O(\axi_wdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[14]_i_1 
       (.I0(sp_data_in[14]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[30]),
        .O(\axi_wdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[15]_i_1 
       (.I0(sp_data_in[15]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[31]),
        .O(\axi_wdata[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hAEFF)) 
    \axi_wdata[15]_i_2 
       (.I0(\data_out[31]_i_5_n_0 ),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(\axi_awaddr[27]_i_3_n_0 ),
        .O(\axi_wdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[16]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[16]),
        .O(\axi_wdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[17]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[17]),
        .O(\axi_wdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[18]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[18]),
        .O(\axi_wdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[19]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[19]),
        .O(\axi_wdata[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[1]_i_1 
       (.I0(sp_data_in[1]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[17]),
        .O(\axi_wdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[20]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[20]),
        .O(\axi_wdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[21]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[21]),
        .O(\axi_wdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[22]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[22]),
        .O(\axi_wdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[23]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[23]),
        .O(\axi_wdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[24]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[24]),
        .O(\axi_wdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[25]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[25]),
        .O(\axi_wdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[26]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[26]),
        .O(\axi_wdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[27]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[27]),
        .O(\axi_wdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[28]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[28]),
        .O(\axi_wdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[29]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[29]),
        .O(\axi_wdata[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[2]_i_1 
       (.I0(sp_data_in[2]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[18]),
        .O(\axi_wdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[30]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[30]),
        .O(\axi_wdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AA00000000)) 
    \axi_wdata[31]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_data_in[31]),
        .O(\axi_wdata[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[3]_i_1 
       (.I0(sp_data_in[3]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[19]),
        .O(\axi_wdata[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[4]_i_1 
       (.I0(sp_data_in[4]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[20]),
        .O(\axi_wdata[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[5]_i_1 
       (.I0(sp_data_in[5]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[21]),
        .O(\axi_wdata[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[6]_i_1 
       (.I0(sp_data_in[6]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[22]),
        .O(\axi_wdata[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAABAAA8A)) 
    \axi_wdata[7]_i_1 
       (.I0(sp_data_in[7]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(sp_write),
        .I3(write_issued_reg_n_0),
        .I4(sp_data_in[23]),
        .O(\axi_wdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[8]_i_1 
       (.I0(sp_data_in[8]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[24]),
        .O(\axi_wdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888F8888888888)) 
    \axi_wdata[9]_i_1 
       (.I0(sp_data_in[9]),
        .I1(\axi_wdata[15]_i_2_n_0 ),
        .I2(\data_out[31]_i_6_n_0 ),
        .I3(sp_write),
        .I4(write_issued_reg_n_0),
        .I5(sp_data_in[25]),
        .O(\axi_wdata[9]_i_1_n_0 ));
  FDRE \axi_wdata_reg[0] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[0]_i_1_n_0 ),
        .Q(m00_axi_wdata[0]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[10] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[10]_i_1_n_0 ),
        .Q(m00_axi_wdata[10]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[11] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[11]_i_1_n_0 ),
        .Q(m00_axi_wdata[11]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[12] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[12]_i_1_n_0 ),
        .Q(m00_axi_wdata[12]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[13] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[13]_i_1_n_0 ),
        .Q(m00_axi_wdata[13]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[14] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[14]_i_1_n_0 ),
        .Q(m00_axi_wdata[14]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[15] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[15]_i_1_n_0 ),
        .Q(m00_axi_wdata[15]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[16] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[16]_i_1_n_0 ),
        .Q(m00_axi_wdata[16]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[17] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[17]_i_1_n_0 ),
        .Q(m00_axi_wdata[17]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[18] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[18]_i_1_n_0 ),
        .Q(m00_axi_wdata[18]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[19] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[19]_i_1_n_0 ),
        .Q(m00_axi_wdata[19]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[1] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[1]_i_1_n_0 ),
        .Q(m00_axi_wdata[1]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[20] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[20]_i_1_n_0 ),
        .Q(m00_axi_wdata[20]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[21] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[21]_i_1_n_0 ),
        .Q(m00_axi_wdata[21]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[22] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[22]_i_1_n_0 ),
        .Q(m00_axi_wdata[22]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[23] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[23]_i_1_n_0 ),
        .Q(m00_axi_wdata[23]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[24] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[24]_i_1_n_0 ),
        .Q(m00_axi_wdata[24]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[25] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[25]_i_1_n_0 ),
        .Q(m00_axi_wdata[25]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[26] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[26]_i_1_n_0 ),
        .Q(m00_axi_wdata[26]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[27] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[27]_i_1_n_0 ),
        .Q(m00_axi_wdata[27]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[28] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[28]_i_1_n_0 ),
        .Q(m00_axi_wdata[28]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[29] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[29]_i_1_n_0 ),
        .Q(m00_axi_wdata[29]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[2] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[2]_i_1_n_0 ),
        .Q(m00_axi_wdata[2]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[30] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[30]_i_1_n_0 ),
        .Q(m00_axi_wdata[30]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[31] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[31]_i_1_n_0 ),
        .Q(m00_axi_wdata[31]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[3] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[3]_i_1_n_0 ),
        .Q(m00_axi_wdata[3]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[4] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[4]_i_1_n_0 ),
        .Q(m00_axi_wdata[4]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[5] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[5]_i_1_n_0 ),
        .Q(m00_axi_wdata[5]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[6] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[6]_i_1_n_0 ),
        .Q(m00_axi_wdata[6]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[7] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[7]_i_1_n_0 ),
        .Q(m00_axi_wdata[7]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[8] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[8]_i_1_n_0 ),
        .Q(m00_axi_wdata[8]),
        .R(p_0_in));
  FDRE \axi_wdata_reg[9] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[9]_i_1_n_0 ),
        .Q(m00_axi_wdata[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    axi_wvalid_i_1
       (.I0(m00_axi_wvalid),
        .I1(m00_axi_wready),
        .I2(start_single_write),
        .O(axi_wvalid_i_1_n_0));
  FDRE axi_wvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_wvalid_i_1_n_0),
        .Q(m00_axi_wvalid),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[0]_i_1 
       (.I0(m00_axi_rdata[0]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[8]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[10]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[10]),
        .O(\data_out[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[11]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[11]),
        .O(\data_out[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[12]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[12]),
        .O(\data_out[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[13]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[13]),
        .O(\data_out[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \data_out[14]_i_1 
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .I4(\data_out[15]_i_1_n_0 ),
        .O(\data_out[14]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[14]_i_2 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[14]),
        .O(\data_out[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808888808008888)) 
    \data_out[15]_i_1 
       (.I0(m00_axi_aresetn),
        .I1(\data_out[31]_i_3_n_0 ),
        .I2(sp_op_len[0]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(rstep),
        .O(\data_out[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF0E0)) 
    \data_out[15]_i_2 
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(m00_axi_rdata[15]),
        .I3(sp_sign_extend),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[16]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[16]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[0]),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[17]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[17]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[1]),
        .O(p_1_in[17]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[18]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[18]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[2]),
        .O(p_1_in[18]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[19]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[19]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[3]),
        .O(p_1_in[19]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[1]_i_1 
       (.I0(m00_axi_rdata[1]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[9]),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[20]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[20]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[4]),
        .O(p_1_in[20]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[21]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[21]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[5]),
        .O(p_1_in[21]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[22]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[22]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[6]),
        .O(p_1_in[22]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[23]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[23]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[7]),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[24]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[24]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[8]),
        .O(p_1_in[24]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[25]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[25]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[9]),
        .O(p_1_in[25]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[26]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[26]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[10]),
        .O(p_1_in[26]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[27]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[27]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[11]),
        .O(p_1_in[27]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[28]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[28]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[12]),
        .O(p_1_in[28]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[29]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[29]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[13]),
        .O(p_1_in[29]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[2]_i_1 
       (.I0(m00_axi_rdata[2]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[10]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hF0FF8888F0008888)) 
    \data_out[30]_i_1 
       (.I0(m00_axi_rdata[15]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[30]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(m00_axi_rdata[14]),
        .O(p_1_in[30]));
  LUT6 #(
    .INIT(64'h0800888808088888)) 
    \data_out[31]_i_1 
       (.I0(m00_axi_aresetn),
        .I1(\data_out[31]_i_3_n_0 ),
        .I2(sp_op_len[0]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(rstep),
        .O(\data_out[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF222FFFFF000F000)) 
    \data_out[31]_i_2 
       (.I0(sp_sign_extend),
        .I1(sp_op_len[1]),
        .I2(\data_out[31]_i_5_n_0 ),
        .I3(m00_axi_rdata[31]),
        .I4(\data_out[31]_i_6_n_0 ),
        .I5(m00_axi_rdata[15]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \data_out[31]_i_3 
       (.I0(m00_axi_rready),
        .I1(read_issued),
        .I2(m00_axi_rvalid),
        .I3(start_single_read_reg_n_0),
        .O(\data_out[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \data_out[31]_i_4 
       (.I0(sp_addr[29]),
        .I1(sp_addr[28]),
        .I2(sp_addr[31]),
        .I3(sp_addr[30]),
        .O(\data_out[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \data_out[31]_i_5 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[28]),
        .I3(sp_addr[29]),
        .I4(sp_op_len[1]),
        .O(\data_out[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \data_out[31]_i_6 
       (.I0(sp_addr[30]),
        .I1(sp_addr[31]),
        .I2(sp_addr[28]),
        .I3(sp_addr[29]),
        .I4(sp_op_len[1]),
        .O(\data_out[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[3]_i_1 
       (.I0(m00_axi_rdata[3]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[11]),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[4]_i_1 
       (.I0(m00_axi_rdata[4]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[12]),
        .O(p_1_in[4]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[5]_i_1 
       (.I0(m00_axi_rdata[5]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[13]),
        .O(p_1_in[5]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[6]_i_1 
       (.I0(m00_axi_rdata[6]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[14]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hABA8)) 
    \data_out[7]_i_1 
       (.I0(m00_axi_rdata[7]),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(m00_axi_rdata[15]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[8]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[8]),
        .O(\data_out[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[9]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(m00_axi_rdata[9]),
        .O(\data_out[9]_i_1_n_0 ));
  FDRE \data_out_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(sp_data_out[0]),
        .R(1'b0));
  FDSE \data_out_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[10]_i_1_n_0 ),
        .Q(sp_data_out[10]),
        .S(\data_out[14]_i_1_n_0 ));
  FDSE \data_out_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[11]_i_1_n_0 ),
        .Q(sp_data_out[11]),
        .S(\data_out[14]_i_1_n_0 ));
  FDSE \data_out_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[12]_i_1_n_0 ),
        .Q(sp_data_out[12]),
        .S(\data_out[14]_i_1_n_0 ));
  FDSE \data_out_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[13]_i_1_n_0 ),
        .Q(sp_data_out[13]),
        .S(\data_out[14]_i_1_n_0 ));
  FDSE \data_out_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[14]_i_2_n_0 ),
        .Q(sp_data_out[14]),
        .S(\data_out[14]_i_1_n_0 ));
  FDRE \data_out_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(sp_data_out[15]),
        .R(1'b0));
  FDRE \data_out_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(sp_data_out[16]),
        .R(1'b0));
  FDRE \data_out_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(sp_data_out[17]),
        .R(1'b0));
  FDRE \data_out_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(sp_data_out[18]),
        .R(1'b0));
  FDRE \data_out_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(sp_data_out[19]),
        .R(1'b0));
  FDRE \data_out_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(sp_data_out[1]),
        .R(1'b0));
  FDRE \data_out_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(sp_data_out[20]),
        .R(1'b0));
  FDRE \data_out_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(sp_data_out[21]),
        .R(1'b0));
  FDRE \data_out_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(sp_data_out[22]),
        .R(1'b0));
  FDRE \data_out_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(sp_data_out[23]),
        .R(1'b0));
  FDRE \data_out_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[24]),
        .Q(sp_data_out[24]),
        .R(1'b0));
  FDRE \data_out_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[25]),
        .Q(sp_data_out[25]),
        .R(1'b0));
  FDRE \data_out_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[26]),
        .Q(sp_data_out[26]),
        .R(1'b0));
  FDRE \data_out_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[27]),
        .Q(sp_data_out[27]),
        .R(1'b0));
  FDRE \data_out_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[28]),
        .Q(sp_data_out[28]),
        .R(1'b0));
  FDRE \data_out_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[29]),
        .Q(sp_data_out[29]),
        .R(1'b0));
  FDRE \data_out_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(sp_data_out[2]),
        .R(1'b0));
  FDRE \data_out_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[30]),
        .Q(sp_data_out[30]),
        .R(1'b0));
  FDRE \data_out_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\data_out[31]_i_1_n_0 ),
        .D(p_1_in[31]),
        .Q(sp_data_out[31]),
        .R(1'b0));
  FDRE \data_out_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(sp_data_out[3]),
        .R(1'b0));
  FDRE \data_out_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(sp_data_out[4]),
        .R(1'b0));
  FDRE \data_out_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(sp_data_out[5]),
        .R(1'b0));
  FDRE \data_out_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(sp_data_out[6]),
        .R(1'b0));
  FDRE \data_out_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(sp_data_out[7]),
        .R(1'b0));
  FDSE \data_out_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[8]_i_1_n_0 ),
        .Q(sp_data_out[8]),
        .S(\data_out[14]_i_1_n_0 ));
  FDSE \data_out_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\data_out[15]_i_1_n_0 ),
        .D(\data_out[9]_i_1_n_0 ),
        .Q(sp_data_out[9]),
        .S(\data_out[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0BFF0BFFFFFF0000)) 
    read_issued_i_1
       (.I0(sp_op_len[0]),
        .I1(rstep),
        .I2(read_issued_i_2_n_0),
        .I3(\data_out[31]_i_3_n_0 ),
        .I4(sp_read),
        .I5(read_issued),
        .O(read_issued_i_1_n_0));
  LUT6 #(
    .INIT(64'h55555455FFFFFFFF)) 
    read_issued_i_2
       (.I0(sp_op_len[0]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_op_len[1]),
        .O(read_issued_i_2_n_0));
  FDRE read_issued_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(read_issued_i_1_n_0),
        .Q(read_issued),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hE200F000E2000000)) 
    read_over_i_1
       (.I0(read_over_reg_n_0),
        .I1(read_over_i_2_n_0),
        .I2(read_over_i_3_n_0),
        .I3(m00_axi_aresetn),
        .I4(\axi_araddr[31]_i_3_n_0 ),
        .I5(\data_out[31]_i_4_n_0 ),
        .O(read_over_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h22AA20AA)) 
    read_over_i_2
       (.I0(\data_out[31]_i_3_n_0 ),
        .I1(sp_op_len[0]),
        .I2(\data_out[31]_i_4_n_0 ),
        .I3(sp_op_len[1]),
        .I4(rstep),
        .O(read_over_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hAAAA30FF)) 
    read_over_i_3
       (.I0(\data_out[31]_i_3_n_0 ),
        .I1(sp_op_len[0]),
        .I2(rstep),
        .I3(sp_op_len[1]),
        .I4(\data_out[31]_i_4_n_0 ),
        .O(read_over_i_3_n_0));
  FDRE read_over_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(read_over_i_1_n_0),
        .Q(read_over_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6A0050006A000000)) 
    rstep_i_1
       (.I0(rstep),
        .I1(\data_out[31]_i_3_n_0 ),
        .I2(rstep_i_2_n_0),
        .I3(m00_axi_aresetn),
        .I4(\axi_araddr[31]_i_3_n_0 ),
        .I5(\data_out[31]_i_4_n_0 ),
        .O(rstep_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    rstep_i_2
       (.I0(sp_op_len[1]),
        .I1(sp_addr[29]),
        .I2(sp_addr[28]),
        .I3(sp_addr[31]),
        .I4(sp_addr[30]),
        .I5(sp_op_len[0]),
        .O(rstep_i_2_n_0));
  FDRE rstep_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(rstep_i_1_n_0),
        .Q(rstep),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sp_over_INST_0
       (.I0(write_over_reg_n_0),
        .I1(read_over_reg_n_0),
        .O(sp_over));
  LUT6 #(
    .INIT(64'h30EE00EE00EE00EE)) 
    start_single_read_i_1
       (.I0(sp_read),
        .I1(start_single_read_reg_n_0),
        .I2(m00_axi_rvalid),
        .I3(read_issued),
        .I4(m00_axi_rready),
        .I5(start_single_read_i_2_n_0),
        .O(start_single_read_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h01)) 
    start_single_read_i_2
       (.I0(sp_op_len[0]),
        .I1(\data_out[31]_i_6_n_0 ),
        .I2(rstep),
        .O(start_single_read_i_2_n_0));
  FDRE start_single_read_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(start_single_read_i_1_n_0),
        .Q(start_single_read_reg_n_0),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h50D0FFFF50D00000)) 
    start_single_write_i_1
       (.I0(\axi_awaddr[31]_i_5_n_0 ),
        .I1(axi_awaddr1),
        .I2(m00_axi_aresetn),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(start_single_write_i_2_n_0),
        .I5(start_single_write),
        .O(start_single_write_i_1_n_0));
  LUT6 #(
    .INIT(64'hEAEAEAEAFFEAEAEA)) 
    start_single_write_i_2
       (.I0(wstep_i_2_n_0),
        .I1(start_single_write),
        .I2(write_issued_reg_n_0),
        .I3(rstep_i_2_n_0),
        .I4(start_single_write_i_3_n_0),
        .I5(wstep),
        .O(start_single_write_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    start_single_write_i_3
       (.I0(m00_axi_bvalid),
        .I1(write_issued_reg_n_0),
        .I2(m00_axi_bready),
        .O(start_single_write_i_3_n_0));
  FDRE start_single_write_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(start_single_write_i_1_n_0),
        .Q(start_single_write),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0F80)) 
    write_issued_i_1
       (.I0(m00_axi_aresetn),
        .I1(sp_write),
        .I2(write_over),
        .I3(write_issued_reg_n_0),
        .O(write_issued_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFAEFFFFAAAAAAAA)) 
    write_issued_i_2
       (.I0(wstep_i_2_n_0),
        .I1(wstep),
        .I2(sp_op_len[0]),
        .I3(\data_out[31]_i_4_n_0 ),
        .I4(sp_op_len[1]),
        .I5(axi_awaddr1),
        .O(write_over));
  FDRE write_issued_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(write_issued_i_1_n_0),
        .Q(write_issued_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    write_over_i_1
       (.I0(axi_awaddr1),
        .I1(m00_axi_aresetn),
        .I2(write_over),
        .I3(write_over_reg_n_0),
        .O(write_over_i_1_n_0));
  FDRE write_over_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(write_over_i_1_n_0),
        .Q(write_over_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF000007000000)) 
    \write_strobes[0]_i_1 
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(write_issued_reg_n_0),
        .I3(sp_write),
        .I4(m00_axi_aresetn),
        .I5(m00_axi_wstrb[0]),
        .O(\write_strobes[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFF000006000000)) 
    \write_strobes[1]_i_1 
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(write_issued_reg_n_0),
        .I3(sp_write),
        .I4(m00_axi_aresetn),
        .I5(m00_axi_wstrb[1]),
        .O(\write_strobes[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEA0000002A0000)) 
    \write_strobes[3]_i_1 
       (.I0(\data_out[31]_i_5_n_0 ),
        .I1(sp_op_len[0]),
        .I2(sp_op_len[1]),
        .I3(\axi_awaddr[31]_i_5_n_0 ),
        .I4(m00_axi_aresetn),
        .I5(m00_axi_wstrb[2]),
        .O(\write_strobes[3]_i_1_n_0 ));
  FDRE \write_strobes_reg[0] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\write_strobes[0]_i_1_n_0 ),
        .Q(m00_axi_wstrb[0]),
        .R(1'b0));
  FDRE \write_strobes_reg[1] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\write_strobes[1]_i_1_n_0 ),
        .Q(m00_axi_wstrb[1]),
        .R(1'b0));
  FDRE \write_strobes_reg[3] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\write_strobes[3]_i_1_n_0 ),
        .Q(m00_axi_wstrb[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8F8F8F008F008F00)) 
    wstep_i_1
       (.I0(\data_out[31]_i_5_n_0 ),
        .I1(m00_axi_aresetn),
        .I2(wstep_i_2_n_0),
        .I3(wstep),
        .I4(axi_awaddr1),
        .I5(rstep_i_2_n_0),
        .O(wstep_i_1_n_0));
  LUT5 #(
    .INIT(32'h0700FFFF)) 
    wstep_i_2
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(write_issued_reg_n_0),
        .I3(sp_write),
        .I4(m00_axi_aresetn),
        .O(wstep_i_2_n_0));
  FDRE wstep_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(wstep_i_1_n_0),
        .Q(wstep),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
