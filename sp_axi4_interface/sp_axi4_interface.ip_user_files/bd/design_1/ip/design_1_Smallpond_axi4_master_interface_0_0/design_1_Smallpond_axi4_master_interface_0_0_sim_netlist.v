// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
// Date        : Wed Dec  6 14:41:54 2017
// Host        : bonner running 64-bit Ubuntu 17.10
// Command     : write_verilog -force -mode funcsim
//               /home/lab/Documents/justin/Smallpond/sp_axi4_interface/sp_axi4_interface.srcs/sources_1/bd/design_1/ip/design_1_Smallpond_axi4_master_interface_0_0/design_1_Smallpond_axi4_master_interface_0_0_sim_netlist.v
// Design      : design_1_Smallpond_axi4_master_interface_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_Smallpond_axi4_master_interface_0_0,sp_axi4_master_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "sp_axi4_master_v1_0,Vivado 2017.3" *) 
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
  wire [15:0]\^m00_axi_wdata ;
  wire m00_axi_wready;
  wire [1:0]\^m00_axi_wstrb ;
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
  assign m00_axi_wdata[31] = \<const0> ;
  assign m00_axi_wdata[30] = \<const0> ;
  assign m00_axi_wdata[29] = \<const0> ;
  assign m00_axi_wdata[28] = \<const0> ;
  assign m00_axi_wdata[27] = \<const0> ;
  assign m00_axi_wdata[26] = \<const0> ;
  assign m00_axi_wdata[25] = \<const0> ;
  assign m00_axi_wdata[24] = \<const0> ;
  assign m00_axi_wdata[23] = \<const0> ;
  assign m00_axi_wdata[22] = \<const0> ;
  assign m00_axi_wdata[21] = \<const0> ;
  assign m00_axi_wdata[20] = \<const0> ;
  assign m00_axi_wdata[19] = \<const0> ;
  assign m00_axi_wdata[18] = \<const0> ;
  assign m00_axi_wdata[17] = \<const0> ;
  assign m00_axi_wdata[16] = \<const0> ;
  assign m00_axi_wdata[15:0] = \^m00_axi_wdata [15:0];
  assign m00_axi_wstrb[3] = \<const0> ;
  assign m00_axi_wstrb[2] = \<const0> ;
  assign m00_axi_wstrb[1:0] = \^m00_axi_wstrb [1:0];
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
        .m00_axi_rdata(m00_axi_rdata[15:0]),
        .m00_axi_rready(m00_axi_rready),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_wdata(\^m00_axi_wdata ),
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

(* ORIG_REF_NAME = "sp_axi4_master_v1_0" *) 
module design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0
   (sp_data_out,
    m00_axi_bready,
    m00_axi_awaddr,
    m00_axi_wdata,
    m00_axi_araddr,
    m00_axi_rready,
    m00_axi_wstrb,
    m00_axi_awvalid,
    m00_axi_wvalid,
    m00_axi_arvalid,
    sp_over,
    sp_read,
    sp_write,
    m00_axi_aclk,
    m00_axi_bvalid,
    m00_axi_aresetn,
    sp_op_len,
    m00_axi_rvalid,
    sp_addr,
    m00_axi_rdata,
    sp_sign_extend,
    sp_data_in,
    m00_axi_awready,
    m00_axi_wready,
    m00_axi_arready);
  output [31:0]sp_data_out;
  output m00_axi_bready;
  output [31:0]m00_axi_awaddr;
  output [15:0]m00_axi_wdata;
  output [31:0]m00_axi_araddr;
  output m00_axi_rready;
  output [1:0]m00_axi_wstrb;
  output m00_axi_awvalid;
  output m00_axi_wvalid;
  output m00_axi_arvalid;
  output sp_over;
  input sp_read;
  input sp_write;
  input m00_axi_aclk;
  input m00_axi_bvalid;
  input m00_axi_aresetn;
  input [1:0]sp_op_len;
  input m00_axi_rvalid;
  input [31:0]sp_addr;
  input [15:0]m00_axi_rdata;
  input sp_sign_extend;
  input [31:0]sp_data_in;
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
  wire [15:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;
  wire [15:0]m00_axi_wdata;
  wire m00_axi_wready;
  wire [1:0]m00_axi_wstrb;
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

(* ORIG_REF_NAME = "sp_axi4_master_v1_0_M00_AXI" *) 
module design_1_Smallpond_axi4_master_interface_0_0_sp_axi4_master_v1_0_M00_AXI
   (sp_data_out,
    m00_axi_bready,
    m00_axi_awaddr,
    m00_axi_wdata,
    m00_axi_araddr,
    m00_axi_rready,
    m00_axi_wstrb,
    m00_axi_awvalid,
    m00_axi_wvalid,
    m00_axi_arvalid,
    sp_over,
    sp_read,
    sp_write,
    m00_axi_aclk,
    m00_axi_bvalid,
    m00_axi_aresetn,
    sp_op_len,
    m00_axi_rvalid,
    sp_addr,
    m00_axi_rdata,
    sp_sign_extend,
    sp_data_in,
    m00_axi_awready,
    m00_axi_wready,
    m00_axi_arready);
  output [31:0]sp_data_out;
  output m00_axi_bready;
  output [31:0]m00_axi_awaddr;
  output [15:0]m00_axi_wdata;
  output [31:0]m00_axi_araddr;
  output m00_axi_rready;
  output [1:0]m00_axi_wstrb;
  output m00_axi_awvalid;
  output m00_axi_wvalid;
  output m00_axi_arvalid;
  output sp_over;
  input sp_read;
  input sp_write;
  input m00_axi_aclk;
  input m00_axi_bvalid;
  input m00_axi_aresetn;
  input [1:0]sp_op_len;
  input m00_axi_rvalid;
  input [31:0]sp_addr;
  input [15:0]m00_axi_rdata;
  input sp_sign_extend;
  input [31:0]sp_data_in;
  input m00_axi_awready;
  input m00_axi_wready;
  input m00_axi_arready;

  wire \axi_araddr[31]_i_1_n_0 ;
  wire \axi_araddr[31]_i_3_n_0 ;
  wire axi_arvalid_i_1_n_0;
  wire axi_awaddr1;
  wire \axi_awaddr[31]_i_3_n_0 ;
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
  wire \axi_wdata[1]_i_1_n_0 ;
  wire \axi_wdata[2]_i_1_n_0 ;
  wire \axi_wdata[3]_i_1_n_0 ;
  wire \axi_wdata[4]_i_1_n_0 ;
  wire \axi_wdata[5]_i_1_n_0 ;
  wire \axi_wdata[6]_i_1_n_0 ;
  wire \axi_wdata[7]_i_1_n_0 ;
  wire \axi_wdata[8]_i_1_n_0 ;
  wire \axi_wdata[9]_i_1_n_0 ;
  wire axi_wvalid_i_1_n_0;
  wire [31:15]data_out;
  wire \data_out[0]_i_1_n_0 ;
  wire \data_out[10]_i_1_n_0 ;
  wire \data_out[11]_i_1_n_0 ;
  wire \data_out[12]_i_1_n_0 ;
  wire \data_out[13]_i_1_n_0 ;
  wire \data_out[14]_i_1_n_0 ;
  wire \data_out[15]_i_2_n_0 ;
  wire \data_out[16]_i_1_n_0 ;
  wire \data_out[17]_i_1_n_0 ;
  wire \data_out[18]_i_1_n_0 ;
  wire \data_out[19]_i_1_n_0 ;
  wire \data_out[1]_i_1_n_0 ;
  wire \data_out[20]_i_1_n_0 ;
  wire \data_out[21]_i_1_n_0 ;
  wire \data_out[22]_i_1_n_0 ;
  wire \data_out[23]_i_1_n_0 ;
  wire \data_out[24]_i_1_n_0 ;
  wire \data_out[25]_i_1_n_0 ;
  wire \data_out[26]_i_1_n_0 ;
  wire \data_out[27]_i_1_n_0 ;
  wire \data_out[28]_i_1_n_0 ;
  wire \data_out[29]_i_1_n_0 ;
  wire \data_out[2]_i_1_n_0 ;
  wire \data_out[30]_i_1_n_0 ;
  wire \data_out[31]_i_2_n_0 ;
  wire \data_out[31]_i_3_n_0 ;
  wire \data_out[3]_i_1_n_0 ;
  wire \data_out[4]_i_1_n_0 ;
  wire \data_out[5]_i_1_n_0 ;
  wire \data_out[6]_i_1_n_0 ;
  wire \data_out[7]_i_1_n_0 ;
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
  wire [15:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire m00_axi_rvalid;
  wire [15:0]m00_axi_wdata;
  wire m00_axi_wready;
  wire [1:0]m00_axi_wstrb;
  wire m00_axi_wvalid;
  wire [31:0]p_1_in;
  wire [31:0]p_2_in;
  wire [31:0]plusOp;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__1_n_0;
  wire plusOp_carry__1_n_1;
  wire plusOp_carry__1_n_2;
  wire plusOp_carry__1_n_3;
  wire plusOp_carry__2_n_0;
  wire plusOp_carry__2_n_1;
  wire plusOp_carry__2_n_2;
  wire plusOp_carry__2_n_3;
  wire plusOp_carry__3_n_0;
  wire plusOp_carry__3_n_1;
  wire plusOp_carry__3_n_2;
  wire plusOp_carry__3_n_3;
  wire plusOp_carry__4_n_0;
  wire plusOp_carry__4_n_1;
  wire plusOp_carry__4_n_2;
  wire plusOp_carry__4_n_3;
  wire plusOp_carry__5_n_0;
  wire plusOp_carry__5_n_1;
  wire plusOp_carry__5_n_2;
  wire plusOp_carry__5_n_3;
  wire plusOp_carry__6_n_1;
  wire plusOp_carry__6_n_2;
  wire plusOp_carry__6_n_3;
  wire plusOp_carry_i_1_n_0;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire read_issued;
  wire read_issued_i_1_n_0;
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
  wire start_single_read_i_3_n_0;
  wire start_single_read_i_4_n_0;
  wire start_single_read_reg_n_0;
  wire start_single_write_i_1_n_0;
  wire start_single_write_i_2_n_0;
  wire start_single_write_i_3_n_0;
  wire start_single_write_reg_n_0;
  wire write_issued;
  wire write_issued_i_1_n_0;
  wire write_over_i_1_n_0;
  wire write_over_i_2_n_0;
  wire \write_strobes[0]_i_1_n_0 ;
  wire \write_strobes[1]_i_1_n_0 ;
  wire wstep_i_1_n_0;
  wire wstep_i_2_n_0;
  wire wstep_reg_n_0;
  wire [3:3]NLW_plusOp_carry__6_CO_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[0]_i_1 
       (.I0(sp_addr[0]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[0]),
        .O(p_2_in[0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[10]_i_1 
       (.I0(sp_addr[10]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[10]),
        .O(p_2_in[10]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[11]_i_1 
       (.I0(sp_addr[11]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[11]),
        .O(p_2_in[11]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[12]_i_1 
       (.I0(sp_addr[12]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[12]),
        .O(p_2_in[12]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[13]_i_1 
       (.I0(sp_addr[13]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[13]),
        .O(p_2_in[13]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[14]_i_1 
       (.I0(sp_addr[14]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[14]),
        .O(p_2_in[14]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[15]_i_1 
       (.I0(sp_addr[15]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[15]),
        .O(p_2_in[15]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[16]_i_1 
       (.I0(sp_addr[16]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[16]),
        .O(p_2_in[16]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[17]_i_1 
       (.I0(sp_addr[17]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[17]),
        .O(p_2_in[17]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[18]_i_1 
       (.I0(sp_addr[18]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[18]),
        .O(p_2_in[18]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[19]_i_1 
       (.I0(sp_addr[19]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[19]),
        .O(p_2_in[19]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[1]_i_1 
       (.I0(sp_addr[1]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[1]),
        .O(p_2_in[1]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[20]_i_1 
       (.I0(sp_addr[20]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[20]),
        .O(p_2_in[20]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[21]_i_1 
       (.I0(sp_addr[21]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[21]),
        .O(p_2_in[21]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[22]_i_1 
       (.I0(sp_addr[22]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[22]),
        .O(p_2_in[22]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[23]_i_1 
       (.I0(sp_addr[23]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[23]),
        .O(p_2_in[23]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[24]_i_1 
       (.I0(sp_addr[24]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[24]),
        .O(p_2_in[24]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[25]_i_1 
       (.I0(sp_addr[25]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[25]),
        .O(p_2_in[25]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[26]_i_1 
       (.I0(sp_addr[26]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[26]),
        .O(p_2_in[26]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[27]_i_1 
       (.I0(sp_addr[27]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[27]),
        .O(p_2_in[27]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[28]_i_1 
       (.I0(sp_addr[28]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[28]),
        .O(p_2_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[29]_i_1 
       (.I0(sp_addr[29]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[29]),
        .O(p_2_in[29]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(sp_addr[2]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[2]),
        .O(p_2_in[2]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[30]_i_1 
       (.I0(sp_addr[30]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[30]),
        .O(p_2_in[30]));
  LUT6 #(
    .INIT(64'h10001000FEFF1000)) 
    \axi_araddr[31]_i_1 
       (.I0(rstep),
        .I1(sp_op_len[0]),
        .I2(\axi_araddr[31]_i_3_n_0 ),
        .I3(sp_op_len[1]),
        .I4(sp_read),
        .I5(read_issued),
        .O(\axi_araddr[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[31]_i_2 
       (.I0(sp_addr[31]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[31]),
        .O(p_2_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h4040FF00)) 
    \axi_araddr[31]_i_3 
       (.I0(start_single_read_reg_n_0),
        .I1(m00_axi_rvalid),
        .I2(m00_axi_rready),
        .I3(sp_read),
        .I4(read_issued),
        .O(\axi_araddr[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(sp_addr[3]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[3]),
        .O(p_2_in[3]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[4]_i_1 
       (.I0(sp_addr[4]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[4]),
        .O(p_2_in[4]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[5]_i_1 
       (.I0(sp_addr[5]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[5]),
        .O(p_2_in[5]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[6]_i_1 
       (.I0(sp_addr[6]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[6]),
        .O(p_2_in[6]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[7]_i_1 
       (.I0(sp_addr[7]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[7]),
        .O(p_2_in[7]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[8]_i_1 
       (.I0(sp_addr[8]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[8]),
        .O(p_2_in[8]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[9]_i_1 
       (.I0(sp_addr[9]),
        .I1(sp_read),
        .I2(read_issued),
        .I3(plusOp[9]),
        .O(p_2_in[9]));
  FDRE \axi_araddr_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(m00_axi_araddr[0]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(m00_axi_araddr[10]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(m00_axi_araddr[11]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(m00_axi_araddr[12]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(m00_axi_araddr[13]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(m00_axi_araddr[14]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(m00_axi_araddr[15]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[16]),
        .Q(m00_axi_araddr[16]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[17]),
        .Q(m00_axi_araddr[17]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[18]),
        .Q(m00_axi_araddr[18]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[19]),
        .Q(m00_axi_araddr[19]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(m00_axi_araddr[1]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[20]),
        .Q(m00_axi_araddr[20]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[21]),
        .Q(m00_axi_araddr[21]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[22]),
        .Q(m00_axi_araddr[22]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[23]),
        .Q(m00_axi_araddr[23]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[24]),
        .Q(m00_axi_araddr[24]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[25]),
        .Q(m00_axi_araddr[25]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[26]),
        .Q(m00_axi_araddr[26]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[27]),
        .Q(m00_axi_araddr[27]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[28]),
        .Q(m00_axi_araddr[28]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[29]),
        .Q(m00_axi_araddr[29]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(m00_axi_araddr[2]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[30]),
        .Q(m00_axi_araddr[30]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[31]),
        .Q(m00_axi_araddr[31]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(m00_axi_araddr[3]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(m00_axi_araddr[4]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[5]),
        .Q(m00_axi_araddr[5]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[6]),
        .Q(m00_axi_araddr[6]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(m00_axi_araddr[7]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(m00_axi_araddr[8]),
        .R(write_over_i_1_n_0));
  FDRE \axi_araddr_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\axi_araddr[31]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(m00_axi_araddr[9]),
        .R(write_over_i_1_n_0));
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
        .R(write_over_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[0]_i_1 
       (.I0(sp_addr[0]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[0]),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[10]_i_1 
       (.I0(sp_addr[10]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[10]),
        .O(p_1_in[10]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[11]_i_1 
       (.I0(sp_addr[11]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[11]),
        .O(p_1_in[11]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[12]_i_1 
       (.I0(sp_addr[12]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[12]),
        .O(p_1_in[12]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[13]_i_1 
       (.I0(sp_addr[13]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[13]),
        .O(p_1_in[13]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[14]_i_1 
       (.I0(sp_addr[14]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[14]),
        .O(p_1_in[14]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[15]_i_1 
       (.I0(sp_addr[15]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[15]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[16]_i_1 
       (.I0(sp_addr[16]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[16]),
        .O(p_1_in[16]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[17]_i_1 
       (.I0(sp_addr[17]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[17]),
        .O(p_1_in[17]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[18]_i_1 
       (.I0(sp_addr[18]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[18]),
        .O(p_1_in[18]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[19]_i_1 
       (.I0(sp_addr[19]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[19]),
        .O(p_1_in[19]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[1]_i_1 
       (.I0(sp_addr[1]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[1]),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[20]_i_1 
       (.I0(sp_addr[20]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[20]),
        .O(p_1_in[20]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[21]_i_1 
       (.I0(sp_addr[21]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[21]),
        .O(p_1_in[21]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[22]_i_1 
       (.I0(sp_addr[22]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[22]),
        .O(p_1_in[22]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[23]_i_1 
       (.I0(sp_addr[23]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[23]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[24]_i_1 
       (.I0(sp_addr[24]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[24]),
        .O(p_1_in[24]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[25]_i_1 
       (.I0(sp_addr[25]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[25]),
        .O(p_1_in[25]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[26]_i_1 
       (.I0(sp_addr[26]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[26]),
        .O(p_1_in[26]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[27]_i_1 
       (.I0(sp_addr[27]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[27]),
        .O(p_1_in[27]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[28]_i_1 
       (.I0(sp_addr[28]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[28]),
        .O(p_1_in[28]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[29]_i_1 
       (.I0(sp_addr[29]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[29]),
        .O(p_1_in[29]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[2]_i_1 
       (.I0(sp_addr[2]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[2]),
        .O(p_1_in[2]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[30]_i_1 
       (.I0(sp_addr[30]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[30]),
        .O(p_1_in[30]));
  LUT6 #(
    .INIT(64'h020002000EFF0200)) 
    \axi_awaddr[31]_i_1 
       (.I0(\axi_awaddr[31]_i_3_n_0 ),
        .I1(wstep_reg_n_0),
        .I2(sp_op_len[0]),
        .I3(sp_op_len[1]),
        .I4(sp_write),
        .I5(write_issued),
        .O(axi_wdata));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[31]_i_2 
       (.I0(sp_addr[31]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[31]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h4040FF00)) 
    \axi_awaddr[31]_i_3 
       (.I0(start_single_write_reg_n_0),
        .I1(m00_axi_bvalid),
        .I2(m00_axi_bready),
        .I3(sp_write),
        .I4(write_issued),
        .O(\axi_awaddr[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[3]_i_1 
       (.I0(sp_addr[3]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[3]),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[4]_i_1 
       (.I0(sp_addr[4]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[4]),
        .O(p_1_in[4]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[5]_i_1 
       (.I0(sp_addr[5]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[5]),
        .O(p_1_in[5]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[6]_i_1 
       (.I0(sp_addr[6]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[6]),
        .O(p_1_in[6]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[7]_i_1 
       (.I0(sp_addr[7]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[7]),
        .O(p_1_in[7]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[8]_i_1 
       (.I0(sp_addr[8]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[8]),
        .O(p_1_in[8]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_awaddr[9]_i_1 
       (.I0(sp_addr[9]),
        .I1(sp_write),
        .I2(write_issued),
        .I3(plusOp[9]),
        .O(p_1_in[9]));
  FDRE \axi_awaddr_reg[0] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[0]),
        .Q(m00_axi_awaddr[0]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[10] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[10]),
        .Q(m00_axi_awaddr[10]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[11] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[11]),
        .Q(m00_axi_awaddr[11]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[12] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[12]),
        .Q(m00_axi_awaddr[12]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[13] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[13]),
        .Q(m00_axi_awaddr[13]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[14] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[14]),
        .Q(m00_axi_awaddr[14]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[15] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[15]),
        .Q(m00_axi_awaddr[15]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[16] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[16]),
        .Q(m00_axi_awaddr[16]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[17] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[17]),
        .Q(m00_axi_awaddr[17]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[18] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[18]),
        .Q(m00_axi_awaddr[18]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[19] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[19]),
        .Q(m00_axi_awaddr[19]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[1] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[1]),
        .Q(m00_axi_awaddr[1]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[20] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[20]),
        .Q(m00_axi_awaddr[20]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[21] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[21]),
        .Q(m00_axi_awaddr[21]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[22] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[22]),
        .Q(m00_axi_awaddr[22]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[23] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[23]),
        .Q(m00_axi_awaddr[23]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[24] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[24]),
        .Q(m00_axi_awaddr[24]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[25] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[25]),
        .Q(m00_axi_awaddr[25]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[26] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[26]),
        .Q(m00_axi_awaddr[26]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[27] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[27]),
        .Q(m00_axi_awaddr[27]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[28] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[28]),
        .Q(m00_axi_awaddr[28]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[29] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[29]),
        .Q(m00_axi_awaddr[29]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[2] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[2]),
        .Q(m00_axi_awaddr[2]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[30] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[30]),
        .Q(m00_axi_awaddr[30]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[31] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[31]),
        .Q(m00_axi_awaddr[31]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[3]),
        .Q(m00_axi_awaddr[3]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[4]),
        .Q(m00_axi_awaddr[4]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[5] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[5]),
        .Q(m00_axi_awaddr[5]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[6] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[6]),
        .Q(m00_axi_awaddr[6]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[7] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[7]),
        .Q(m00_axi_awaddr[7]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[8] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[8]),
        .Q(m00_axi_awaddr[8]),
        .R(write_over_i_1_n_0));
  FDRE \axi_awaddr_reg[9] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(p_1_in[9]),
        .Q(m00_axi_awaddr[9]),
        .R(write_over_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    axi_awvalid_i_1
       (.I0(m00_axi_awvalid),
        .I1(m00_axi_awready),
        .I2(start_single_write_reg_n_0),
        .O(axi_awvalid_i_1_n_0));
  FDRE axi_awvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_awvalid_i_1_n_0),
        .Q(m00_axi_awvalid),
        .R(write_over_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
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
        .R(write_over_i_1_n_0));
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
    .INIT(32'hEFFF4000)) 
    \axi_wdata[0]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[16]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[0]),
        .O(\axi_wdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[10]_i_1 
       (.I0(sp_data_in[26]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[10]),
        .O(\axi_wdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[11]_i_1 
       (.I0(sp_data_in[27]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[11]),
        .O(\axi_wdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[12]_i_1 
       (.I0(sp_data_in[28]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[12]),
        .O(\axi_wdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[13]_i_1 
       (.I0(sp_data_in[29]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[13]),
        .O(\axi_wdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[14]_i_1 
       (.I0(sp_data_in[30]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[14]),
        .O(\axi_wdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[15]_i_1 
       (.I0(sp_data_in[31]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[15]),
        .O(\axi_wdata[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[1]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[17]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[1]),
        .O(\axi_wdata[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[2]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[18]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[2]),
        .O(\axi_wdata[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[3]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[19]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[3]),
        .O(\axi_wdata[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[4]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[20]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[4]),
        .O(\axi_wdata[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[5]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[21]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[5]),
        .O(\axi_wdata[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[6]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[22]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[6]),
        .O(\axi_wdata[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF4000)) 
    \axi_wdata[7]_i_1 
       (.I0(write_issued),
        .I1(sp_data_in[23]),
        .I2(sp_write),
        .I3(sp_op_len[1]),
        .I4(sp_data_in[7]),
        .O(\axi_wdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[8]_i_1 
       (.I0(sp_data_in[24]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[8]),
        .O(\axi_wdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFB8FFFF00880000)) 
    \axi_wdata[9]_i_1 
       (.I0(sp_data_in[25]),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_data_in[9]),
        .O(\axi_wdata[9]_i_1_n_0 ));
  FDRE \axi_wdata_reg[0] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[0]_i_1_n_0 ),
        .Q(m00_axi_wdata[0]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[10] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[10]_i_1_n_0 ),
        .Q(m00_axi_wdata[10]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[11] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[11]_i_1_n_0 ),
        .Q(m00_axi_wdata[11]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[12] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[12]_i_1_n_0 ),
        .Q(m00_axi_wdata[12]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[13] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[13]_i_1_n_0 ),
        .Q(m00_axi_wdata[13]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[14] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[14]_i_1_n_0 ),
        .Q(m00_axi_wdata[14]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[15] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[15]_i_1_n_0 ),
        .Q(m00_axi_wdata[15]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[1] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[1]_i_1_n_0 ),
        .Q(m00_axi_wdata[1]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[2] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[2]_i_1_n_0 ),
        .Q(m00_axi_wdata[2]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[3] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[3]_i_1_n_0 ),
        .Q(m00_axi_wdata[3]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[4] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[4]_i_1_n_0 ),
        .Q(m00_axi_wdata[4]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[5] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[5]_i_1_n_0 ),
        .Q(m00_axi_wdata[5]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[6] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[6]_i_1_n_0 ),
        .Q(m00_axi_wdata[6]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[7] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[7]_i_1_n_0 ),
        .Q(m00_axi_wdata[7]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[8] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[8]_i_1_n_0 ),
        .Q(m00_axi_wdata[8]),
        .R(write_over_i_1_n_0));
  FDRE \axi_wdata_reg[9] 
       (.C(m00_axi_aclk),
        .CE(axi_wdata),
        .D(\axi_wdata[9]_i_1_n_0 ),
        .Q(m00_axi_wdata[9]),
        .R(write_over_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    axi_wvalid_i_1
       (.I0(m00_axi_wvalid),
        .I1(m00_axi_wready),
        .I2(start_single_write_reg_n_0),
        .O(axi_wvalid_i_1_n_0));
  FDRE axi_wvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(axi_wvalid_i_1_n_0),
        .Q(m00_axi_wvalid),
        .R(write_over_i_1_n_0));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[0]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[0]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[8]),
        .O(\data_out[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[10]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[10]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[11]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[11]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[12]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[12]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[13]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[13]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[14]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[14]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h4F000000)) 
    \data_out[15]_i_1 
       (.I0(sp_op_len[0]),
        .I1(rstep),
        .I2(sp_op_len[1]),
        .I3(\data_out[31]_i_3_n_0 ),
        .I4(m00_axi_aresetn),
        .O(data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \data_out[15]_i_2 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[16]_i_1 
       (.I0(m00_axi_rdata[0]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[17]_i_1 
       (.I0(m00_axi_rdata[1]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[18]_i_1 
       (.I0(m00_axi_rdata[2]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[19]_i_1 
       (.I0(m00_axi_rdata[3]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[1]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[1]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[9]),
        .O(\data_out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[20]_i_1 
       (.I0(m00_axi_rdata[4]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[21]_i_1 
       (.I0(m00_axi_rdata[5]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[22]_i_1 
       (.I0(m00_axi_rdata[6]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[23]_i_1 
       (.I0(m00_axi_rdata[7]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[24]_i_1 
       (.I0(m00_axi_rdata[8]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[25]_i_1 
       (.I0(m00_axi_rdata[9]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[26]_i_1 
       (.I0(m00_axi_rdata[10]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[27]_i_1 
       (.I0(m00_axi_rdata[11]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[28]_i_1 
       (.I0(m00_axi_rdata[12]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[29]_i_1 
       (.I0(m00_axi_rdata[13]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[2]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[2]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[10]),
        .O(\data_out[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \data_out[30]_i_1 
       (.I0(m00_axi_rdata[14]),
        .I1(sp_op_len[1]),
        .I2(sp_sign_extend),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0C4C0000)) 
    \data_out[31]_i_1 
       (.I0(rstep),
        .I1(\data_out[31]_i_3_n_0 ),
        .I2(sp_op_len[1]),
        .I3(sp_op_len[0]),
        .I4(m00_axi_aresetn),
        .O(data_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \data_out[31]_i_2 
       (.I0(sp_op_len[1]),
        .I1(sp_sign_extend),
        .I2(m00_axi_rdata[15]),
        .O(\data_out[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \data_out[31]_i_3 
       (.I0(m00_axi_rready),
        .I1(read_issued),
        .I2(m00_axi_rvalid),
        .I3(start_single_read_reg_n_0),
        .O(\data_out[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[3]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[3]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[11]),
        .O(\data_out[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[4]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[4]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[12]),
        .O(\data_out[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[5]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[5]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[13]),
        .O(\data_out[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[6]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[6]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[14]),
        .O(\data_out[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \data_out[7]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[7]),
        .I2(sp_op_len[0]),
        .I3(m00_axi_rdata[15]),
        .O(\data_out[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[8]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[8]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCDC8C8C8)) 
    \data_out[9]_i_1 
       (.I0(sp_op_len[1]),
        .I1(m00_axi_rdata[9]),
        .I2(sp_op_len[0]),
        .I3(sp_sign_extend),
        .I4(m00_axi_rdata[15]),
        .O(\data_out[9]_i_1_n_0 ));
  FDRE \data_out_reg[0] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[0]_i_1_n_0 ),
        .Q(sp_data_out[0]),
        .R(1'b0));
  FDRE \data_out_reg[10] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[10]_i_1_n_0 ),
        .Q(sp_data_out[10]),
        .R(1'b0));
  FDRE \data_out_reg[11] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[11]_i_1_n_0 ),
        .Q(sp_data_out[11]),
        .R(1'b0));
  FDRE \data_out_reg[12] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[12]_i_1_n_0 ),
        .Q(sp_data_out[12]),
        .R(1'b0));
  FDRE \data_out_reg[13] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[13]_i_1_n_0 ),
        .Q(sp_data_out[13]),
        .R(1'b0));
  FDRE \data_out_reg[14] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[14]_i_1_n_0 ),
        .Q(sp_data_out[14]),
        .R(1'b0));
  FDRE \data_out_reg[15] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[15]_i_2_n_0 ),
        .Q(sp_data_out[15]),
        .R(1'b0));
  FDRE \data_out_reg[16] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[16]_i_1_n_0 ),
        .Q(sp_data_out[16]),
        .R(1'b0));
  FDRE \data_out_reg[17] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[17]_i_1_n_0 ),
        .Q(sp_data_out[17]),
        .R(1'b0));
  FDRE \data_out_reg[18] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[18]_i_1_n_0 ),
        .Q(sp_data_out[18]),
        .R(1'b0));
  FDRE \data_out_reg[19] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[19]_i_1_n_0 ),
        .Q(sp_data_out[19]),
        .R(1'b0));
  FDRE \data_out_reg[1] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[1]_i_1_n_0 ),
        .Q(sp_data_out[1]),
        .R(1'b0));
  FDRE \data_out_reg[20] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[20]_i_1_n_0 ),
        .Q(sp_data_out[20]),
        .R(1'b0));
  FDRE \data_out_reg[21] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[21]_i_1_n_0 ),
        .Q(sp_data_out[21]),
        .R(1'b0));
  FDRE \data_out_reg[22] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[22]_i_1_n_0 ),
        .Q(sp_data_out[22]),
        .R(1'b0));
  FDRE \data_out_reg[23] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[23]_i_1_n_0 ),
        .Q(sp_data_out[23]),
        .R(1'b0));
  FDRE \data_out_reg[24] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[24]_i_1_n_0 ),
        .Q(sp_data_out[24]),
        .R(1'b0));
  FDRE \data_out_reg[25] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[25]_i_1_n_0 ),
        .Q(sp_data_out[25]),
        .R(1'b0));
  FDRE \data_out_reg[26] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[26]_i_1_n_0 ),
        .Q(sp_data_out[26]),
        .R(1'b0));
  FDRE \data_out_reg[27] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[27]_i_1_n_0 ),
        .Q(sp_data_out[27]),
        .R(1'b0));
  FDRE \data_out_reg[28] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[28]_i_1_n_0 ),
        .Q(sp_data_out[28]),
        .R(1'b0));
  FDRE \data_out_reg[29] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[29]_i_1_n_0 ),
        .Q(sp_data_out[29]),
        .R(1'b0));
  FDRE \data_out_reg[2] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[2]_i_1_n_0 ),
        .Q(sp_data_out[2]),
        .R(1'b0));
  FDRE \data_out_reg[30] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[30]_i_1_n_0 ),
        .Q(sp_data_out[30]),
        .R(1'b0));
  FDRE \data_out_reg[31] 
       (.C(m00_axi_aclk),
        .CE(data_out[31]),
        .D(\data_out[31]_i_2_n_0 ),
        .Q(sp_data_out[31]),
        .R(1'b0));
  FDRE \data_out_reg[3] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[3]_i_1_n_0 ),
        .Q(sp_data_out[3]),
        .R(1'b0));
  FDRE \data_out_reg[4] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[4]_i_1_n_0 ),
        .Q(sp_data_out[4]),
        .R(1'b0));
  FDRE \data_out_reg[5] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[5]_i_1_n_0 ),
        .Q(sp_data_out[5]),
        .R(1'b0));
  FDRE \data_out_reg[6] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[6]_i_1_n_0 ),
        .Q(sp_data_out[6]),
        .R(1'b0));
  FDRE \data_out_reg[7] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[7]_i_1_n_0 ),
        .Q(sp_data_out[7]),
        .R(1'b0));
  FDRE \data_out_reg[8] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[8]_i_1_n_0 ),
        .Q(sp_data_out[8]),
        .R(1'b0));
  FDRE \data_out_reg[9] 
       (.C(m00_axi_aclk),
        .CE(data_out[15]),
        .D(\data_out[9]_i_1_n_0 ),
        .Q(sp_data_out[9]),
        .R(1'b0));
  CARRY4 plusOp_carry
       (.CI(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,sp_addr[1],1'b0}),
        .O(plusOp[3:0]),
        .S({sp_addr[3:2],plusOp_carry_i_1_n_0,sp_addr[0]}));
  CARRY4 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[7:4]),
        .S(sp_addr[7:4]));
  CARRY4 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CO({plusOp_carry__1_n_0,plusOp_carry__1_n_1,plusOp_carry__1_n_2,plusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[11:8]),
        .S(sp_addr[11:8]));
  CARRY4 plusOp_carry__2
       (.CI(plusOp_carry__1_n_0),
        .CO({plusOp_carry__2_n_0,plusOp_carry__2_n_1,plusOp_carry__2_n_2,plusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[15:12]),
        .S(sp_addr[15:12]));
  CARRY4 plusOp_carry__3
       (.CI(plusOp_carry__2_n_0),
        .CO({plusOp_carry__3_n_0,plusOp_carry__3_n_1,plusOp_carry__3_n_2,plusOp_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[19:16]),
        .S(sp_addr[19:16]));
  CARRY4 plusOp_carry__4
       (.CI(plusOp_carry__3_n_0),
        .CO({plusOp_carry__4_n_0,plusOp_carry__4_n_1,plusOp_carry__4_n_2,plusOp_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[23:20]),
        .S(sp_addr[23:20]));
  CARRY4 plusOp_carry__5
       (.CI(plusOp_carry__4_n_0),
        .CO({plusOp_carry__5_n_0,plusOp_carry__5_n_1,plusOp_carry__5_n_2,plusOp_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[27:24]),
        .S(sp_addr[27:24]));
  CARRY4 plusOp_carry__6
       (.CI(plusOp_carry__5_n_0),
        .CO({NLW_plusOp_carry__6_CO_UNCONNECTED[3],plusOp_carry__6_n_1,plusOp_carry__6_n_2,plusOp_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[31:28]),
        .S(sp_addr[31:28]));
  LUT1 #(
    .INIT(2'h1)) 
    plusOp_carry_i_1
       (.I0(sp_addr[1]),
        .O(plusOp_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'hBBF000F0FFB0FF00)) 
    read_issued_i_1
       (.I0(sp_op_len[0]),
        .I1(rstep),
        .I2(sp_read),
        .I3(read_issued),
        .I4(sp_op_len[1]),
        .I5(\axi_araddr[31]_i_3_n_0 ),
        .O(read_issued_i_1_n_0));
  FDRE read_issued_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(read_issued_i_1_n_0),
        .Q(read_issued),
        .R(write_over_i_1_n_0));
  LUT6 #(
    .INIT(64'h2020202002202020)) 
    rstep_i_1
       (.I0(m00_axi_aresetn),
        .I1(rstep_i_2_n_0),
        .I2(rstep),
        .I3(sp_op_len[1]),
        .I4(\data_out[31]_i_3_n_0 ),
        .I5(sp_op_len[0]),
        .O(rstep_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rstep_i_2
       (.I0(sp_read),
        .I1(read_issued),
        .O(rstep_i_2_n_0));
  FDRE rstep_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(rstep_i_1_n_0),
        .Q(rstep),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hABAAEFFFA8AA2000)) 
    start_single_read_i_1
       (.I0(start_single_read_i_2_n_0),
        .I1(rstep),
        .I2(start_single_read_i_3_n_0),
        .I3(sp_op_len[1]),
        .I4(start_single_read_i_4_n_0),
        .I5(start_single_read_reg_n_0),
        .O(start_single_read_i_1_n_0));
  LUT6 #(
    .INIT(64'h01000100FFFF1100)) 
    start_single_read_i_2
       (.I0(rstep),
        .I1(sp_op_len[0]),
        .I2(start_single_read_reg_n_0),
        .I3(sp_op_len[1]),
        .I4(sp_read),
        .I5(read_issued),
        .O(start_single_read_i_2_n_0));
  LUT6 #(
    .INIT(64'hDCCCDCCCFFFF0000)) 
    start_single_read_i_3
       (.I0(sp_op_len[0]),
        .I1(start_single_read_reg_n_0),
        .I2(m00_axi_rvalid),
        .I3(m00_axi_rready),
        .I4(sp_read),
        .I5(read_issued),
        .O(start_single_read_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    start_single_read_i_4
       (.I0(start_single_read_reg_n_0),
        .I1(sp_read),
        .I2(read_issued),
        .O(start_single_read_i_4_n_0));
  FDRE start_single_read_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(start_single_read_i_1_n_0),
        .Q(start_single_read_reg_n_0),
        .R(write_over_i_1_n_0));
  LUT6 #(
    .INIT(64'hBA80BA80BA8ABF80)) 
    start_single_write_i_1
       (.I0(\axi_awaddr[31]_i_3_n_0 ),
        .I1(start_single_write_i_2_n_0),
        .I2(sp_op_len[1]),
        .I3(start_single_write_reg_n_0),
        .I4(sp_write),
        .I5(write_issued),
        .O(start_single_write_i_1_n_0));
  LUT6 #(
    .INIT(64'hF5F01511F5F00400)) 
    start_single_write_i_2
       (.I0(sp_op_len[0]),
        .I1(wstep_reg_n_0),
        .I2(write_issued),
        .I3(sp_write),
        .I4(start_single_write_reg_n_0),
        .I5(start_single_write_i_3_n_0),
        .O(start_single_write_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h88F0)) 
    start_single_write_i_3
       (.I0(m00_axi_bvalid),
        .I1(m00_axi_bready),
        .I2(sp_write),
        .I3(write_issued),
        .O(start_single_write_i_3_n_0));
  FDRE start_single_write_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(start_single_write_i_1_n_0),
        .Q(start_single_write_reg_n_0),
        .R(write_over_i_1_n_0));
  LUT6 #(
    .INIT(64'h30003FFF8AAA8000)) 
    write_issued_i_1
       (.I0(sp_write),
        .I1(axi_awaddr1),
        .I2(sp_op_len[0]),
        .I3(sp_op_len[1]),
        .I4(\axi_awaddr[31]_i_3_n_0 ),
        .I5(write_issued),
        .O(write_issued_i_1_n_0));
  FDRE write_issued_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(write_issued_i_1_n_0),
        .Q(write_issued),
        .R(write_over_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    write_over_i_1
       (.I0(m00_axi_aresetn),
        .O(write_over_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF2A22)) 
    write_over_i_2
       (.I0(axi_awaddr1),
        .I1(sp_op_len[1]),
        .I2(sp_op_len[0]),
        .I3(wstep_reg_n_0),
        .I4(sp_over),
        .O(write_over_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    write_over_i_3
       (.I0(m00_axi_bready),
        .I1(write_issued),
        .I2(m00_axi_bvalid),
        .I3(start_single_write_reg_n_0),
        .O(axi_awaddr1));
  FDRE write_over_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(write_over_i_2_n_0),
        .Q(sp_over),
        .R(write_over_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFF0444)) 
    \write_strobes[0]_i_1 
       (.I0(write_issued),
        .I1(sp_write),
        .I2(sp_op_len[1]),
        .I3(sp_op_len[0]),
        .I4(m00_axi_wstrb[0]),
        .O(\write_strobes[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h888A888888A08888)) 
    \write_strobes[1]_i_1 
       (.I0(m00_axi_aresetn),
        .I1(m00_axi_wstrb[1]),
        .I2(sp_op_len[1]),
        .I3(write_issued),
        .I4(sp_write),
        .I5(sp_op_len[0]),
        .O(\write_strobes[1]_i_1_n_0 ));
  FDRE \write_strobes_reg[0] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\write_strobes[0]_i_1_n_0 ),
        .Q(m00_axi_wstrb[0]),
        .R(write_over_i_1_n_0));
  FDRE \write_strobes_reg[1] 
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\write_strobes[1]_i_1_n_0 ),
        .Q(m00_axi_wstrb[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA200A20022202200)) 
    wstep_i_1
       (.I0(m00_axi_aresetn),
        .I1(wstep_i_2_n_0),
        .I2(sp_op_len[1]),
        .I3(wstep_reg_n_0),
        .I4(axi_awaddr1),
        .I5(sp_op_len[0]),
        .O(wstep_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    wstep_i_2
       (.I0(sp_write),
        .I1(write_issued),
        .O(wstep_i_2_n_0));
  FDRE wstep_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(wstep_i_1_n_0),
        .Q(wstep_reg_n_0),
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
