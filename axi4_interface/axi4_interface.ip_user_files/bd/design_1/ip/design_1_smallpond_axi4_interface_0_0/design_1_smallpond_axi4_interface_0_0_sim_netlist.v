// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3.1 (lin64) Build 2035080 Fri Oct 20 14:20:00 MDT 2017
// Date        : Thu Nov 30 10:29:11 2017
// Host        : octopus-tetricus running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/jrcharlo/Smallpond/axi4_interface/axi4_interface.srcs/sources_1/bd/design_1/ip/design_1_smallpond_axi4_interface_0_0/design_1_smallpond_axi4_interface_0_0_sim_netlist.v
// Design      : design_1_smallpond_axi4_interface_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_smallpond_axi4_interface_0_0,smallpond_axi_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "smallpond_axi_v1_0,Vivado 2017.3.1" *) 
(* NotValidForBitStream *)
module design_1_smallpond_axi4_interface_0_0
   (sp_read,
    sp_sign_extend,
    sp_write,
    sp_op_len,
    sp_addr,
    sp_data,
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
    m00_axi_aresetn,
    m00_axi_init_axi_txn,
    m00_axi_error,
    m00_axi_txn_done);
  input sp_read;
  input sp_sign_extend;
  input sp_write;
  input [1:0]sp_op_len;
  input [31:0]sp_addr;
  inout [31:0]sp_data;
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
  input m00_axi_init_axi_txn;
  output m00_axi_error;
  output m00_axi_txn_done;

  wire \<const0> ;
  wire \<const1> ;
  wire m00_axi_aclk;
  wire [31:0]m00_axi_araddr;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire [31:0]m00_axi_awaddr;
  wire m00_axi_awready;
  wire [1:0]m00_axi_bresp;
  wire m00_axi_bvalid;
  wire m00_axi_error;
  wire m00_axi_init_axi_txn;
  wire [31:0]m00_axi_rdata;
  wire [1:0]m00_axi_rresp;
  wire m00_axi_rvalid;
  wire m00_axi_txn_done;
  wire [15:0]\^m00_axi_wdata ;
  wire m00_axi_wready;
  wire [3:0]m00_axi_wstrb;
  wire [31:0]sp_addr;
  wire [7:0]\^sp_data ;
  wire sp_error;
  wire [1:0]sp_op_len;
  wire sp_read;
  wire sp_write;

  assign m00_axi_arprot[2] = \<const0> ;
  assign m00_axi_arprot[1] = sp_data[9];
  assign m00_axi_arprot[0] = \<const0> ;
  assign m00_axi_arvalid = \<const0> ;
  assign m00_axi_awprot[2] = \<const0> ;
  assign m00_axi_awprot[1] = sp_data[9];
  assign m00_axi_awprot[0] = \<const0> ;
  assign m00_axi_awvalid = \<const0> ;
  assign m00_axi_bready = sp_data[9];
  assign m00_axi_rready = sp_data[9];
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
  assign m00_axi_wvalid = \<const0> ;
  assign sp_over = sp_data[9];
  xVIA sp_data_10via (sp_data[10], sp_data[9]);
  xVIA sp_data_11via (sp_data[11], sp_data[9]);
  xVIA sp_data_12via (sp_data[12], sp_data[9]);
  xVIA sp_data_13via (sp_data[13], sp_data[9]);
  xVIA sp_data_14via (sp_data[14], sp_data[9]);
  xVIA sp_data_15via (sp_data[15], sp_data[9]);
  xVIA sp_data_16via (sp_data[16], sp_data[9]);
  xVIA sp_data_17via (sp_data[17], sp_data[9]);
  xVIA sp_data_18via (sp_data[18], sp_data[9]);
  xVIA sp_data_19via (sp_data[19], sp_data[9]);
  xVIA sp_data_20via (sp_data[20], sp_data[9]);
  xVIA sp_data_21via (sp_data[21], sp_data[9]);
  xVIA sp_data_22via (sp_data[22], sp_data[9]);
  xVIA sp_data_23via (sp_data[23], sp_data[9]);
  xVIA sp_data_24via (sp_data[24], sp_data[9]);
  xVIA sp_data_25via (sp_data[25], sp_data[9]);
  xVIA sp_data_26via (sp_data[26], sp_data[9]);
  xVIA sp_data_27via (sp_data[27], sp_data[9]);
  xVIA sp_data_28via (sp_data[28], sp_data[9]);
  xVIA sp_data_29via (sp_data[29], sp_data[9]);
  xVIA sp_data_30via (sp_data[30], sp_data[9]);
  xVIA sp_data_31via (sp_data[31], sp_data[9]);
  xVIA sp_data_8via (sp_data[8], sp_data[9]);
  GND GND
       (.G(\<const0> ));
  design_1_smallpond_axi4_interface_0_0_smallpond_axi_v1_0 U0
       (.m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_awaddr(m00_axi_awaddr),
        .m00_axi_awready(m00_axi_awready),
        .m00_axi_bresp(m00_axi_bresp),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_error(m00_axi_error),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rresp(m00_axi_rresp),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_txn_done(m00_axi_txn_done),
        .m00_axi_wdata(\^m00_axi_wdata ),
        .m00_axi_wready(m00_axi_wready),
        .m00_axi_wstrb(m00_axi_wstrb),
        .sp_addr(sp_addr),
        .sp_data(sp_data[7:0]),
        .sp_error(sp_error),
        .sp_op_len(sp_op_len),
        .sp_read(sp_read),
        .sp_write(sp_write));
  VCC VCC
       (.P(sp_data[9]));
endmodule

(* ORIG_REF_NAME = "smallpond_axi_v1_0" *) 
module design_1_smallpond_axi4_interface_0_0_smallpond_axi_v1_0
   (m00_axi_error,
    m00_axi_txn_done,
    m00_axi_awaddr,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_araddr,
    sp_error,
    sp_data,
    sp_op_len,
    sp_write,
    sp_read,
    m00_axi_aresetn,
    m00_axi_init_axi_txn,
    m00_axi_aclk,
    m00_axi_awready,
    m00_axi_wready,
    m00_axi_bresp,
    m00_axi_bvalid,
    m00_axi_arready,
    m00_axi_rdata,
    m00_axi_rresp,
    m00_axi_rvalid,
    sp_addr);
  output m00_axi_error;
  output m00_axi_txn_done;
  output [31:0]m00_axi_awaddr;
  output [15:0]m00_axi_wdata;
  output [3:0]m00_axi_wstrb;
  output [31:0]m00_axi_araddr;
  output sp_error;
  inout [7:0]sp_data;
  input [1:0]sp_op_len;
  input sp_write;
  input sp_read;
  input m00_axi_aresetn;
  input m00_axi_init_axi_txn;
  input m00_axi_aclk;
  input m00_axi_awready;
  input m00_axi_wready;
  input [1:0]m00_axi_bresp;
  input m00_axi_bvalid;
  input m00_axi_arready;
  input [31:0]m00_axi_rdata;
  input [1:0]m00_axi_rresp;
  input m00_axi_rvalid;
  input [31:0]sp_addr;

  wire \<const0> ;
  wire \<const1> ;
  wire \__3/i__n_0 ;
  wire m00_axi_aclk;
  wire [31:0]m00_axi_araddr;
  wire \m00_axi_araddr_reg[31]_i_1_n_0 ;
  wire m00_axi_aresetn;
  wire m00_axi_arready;
  wire [31:0]m00_axi_awaddr;
  wire \m00_axi_awaddr_reg[31]_i_1_n_0 ;
  wire m00_axi_awready;
  wire [1:0]m00_axi_bresp;
  wire m00_axi_bvalid;
  wire m00_axi_error;
  wire m00_axi_init_axi_txn;
  wire [31:0]m00_axi_rdata;
  wire [1:0]m00_axi_rresp;
  wire m00_axi_rvalid;
  wire m00_axi_txn_done;
  wire [15:0]m00_axi_wdata;
  wire \m00_axi_wdata_reg[0]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[10]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[11]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[12]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[13]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[14]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[15]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[1]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[2]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[3]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[4]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[5]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[6]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[7]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[8]__0_i_1_n_0 ;
  wire \m00_axi_wdata_reg[9]__0_i_1_n_0 ;
  wire m00_axi_wready;
  wire [3:0]m00_axi_wstrb;
  wire \m00_axi_wstrb_reg[1]_i_1_n_0 ;
  wire \m00_axi_wstrb_reg[3]_i_1_n_0 ;
  wire \m00_axi_wstrb_reg[3]_i_2_n_0 ;
  wire [31:0]plusOp;
  wire [31:0]sp_addr;
  wire [7:0]sp_data;
  wire sp_error;
  wire sp_error19_out__0;
  wire sp_error_reg__3_i_1_n_0;
  wire [1:0]sp_op_len;
  wire sp_read;
  wire sp_write;
  wire [31:0]taddress;
  wire \taddress[3]_i_2_n_0 ;
  wire \taddress_reg[11]_i_1_n_0 ;
  wire \taddress_reg[11]_i_1_n_1 ;
  wire \taddress_reg[11]_i_1_n_2 ;
  wire \taddress_reg[11]_i_1_n_3 ;
  wire \taddress_reg[15]_i_1_n_0 ;
  wire \taddress_reg[15]_i_1_n_1 ;
  wire \taddress_reg[15]_i_1_n_2 ;
  wire \taddress_reg[15]_i_1_n_3 ;
  wire \taddress_reg[19]_i_1_n_0 ;
  wire \taddress_reg[19]_i_1_n_1 ;
  wire \taddress_reg[19]_i_1_n_2 ;
  wire \taddress_reg[19]_i_1_n_3 ;
  wire \taddress_reg[23]_i_1_n_0 ;
  wire \taddress_reg[23]_i_1_n_1 ;
  wire \taddress_reg[23]_i_1_n_2 ;
  wire \taddress_reg[23]_i_1_n_3 ;
  wire \taddress_reg[27]_i_1_n_0 ;
  wire \taddress_reg[27]_i_1_n_1 ;
  wire \taddress_reg[27]_i_1_n_2 ;
  wire \taddress_reg[27]_i_1_n_3 ;
  wire \taddress_reg[31]__1_i_1_n_0 ;
  wire \taddress_reg[31]_i_1_n_1 ;
  wire \taddress_reg[31]_i_1_n_2 ;
  wire \taddress_reg[31]_i_1_n_3 ;
  wire \taddress_reg[3]_i_1_n_0 ;
  wire \taddress_reg[3]_i_1_n_1 ;
  wire \taddress_reg[3]_i_1_n_2 ;
  wire \taddress_reg[3]_i_1_n_3 ;
  wire \taddress_reg[7]_i_1_n_0 ;
  wire \taddress_reg[7]_i_1_n_1 ;
  wire \taddress_reg[7]_i_1_n_2 ;
  wire \taddress_reg[7]_i_1_n_3 ;
  wire [15:0]thalfword_0;
  wire [15:0]thalfword_1;
  wire NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_ARVALID_UNCONNECTED;
  wire NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_AWVALID_UNCONNECTED;
  wire NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_BREADY_UNCONNECTED;
  wire NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_RREADY_UNCONNECTED;
  wire NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_WVALID_UNCONNECTED;
  wire [3:3]\NLW_taddress_reg[31]_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00700000)) 
    \__3/i_ 
       (.I0(sp_op_len[0]),
        .I1(sp_op_len[1]),
        .I2(m00_axi_aresetn),
        .I3(sp_read),
        .I4(sp_write),
        .O(\__3/i__n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[0] 
       (.CLR(1'b0),
        .D(taddress[0]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[10] 
       (.CLR(1'b0),
        .D(taddress[10]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[11] 
       (.CLR(1'b0),
        .D(taddress[11]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[12] 
       (.CLR(1'b0),
        .D(taddress[12]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[13] 
       (.CLR(1'b0),
        .D(taddress[13]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[14] 
       (.CLR(1'b0),
        .D(taddress[14]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[15] 
       (.CLR(1'b0),
        .D(taddress[15]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[16] 
       (.CLR(1'b0),
        .D(taddress[16]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[17] 
       (.CLR(1'b0),
        .D(taddress[17]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[18] 
       (.CLR(1'b0),
        .D(taddress[18]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[19] 
       (.CLR(1'b0),
        .D(taddress[19]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[1] 
       (.CLR(1'b0),
        .D(taddress[1]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[20] 
       (.CLR(1'b0),
        .D(taddress[20]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[21] 
       (.CLR(1'b0),
        .D(taddress[21]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[22] 
       (.CLR(1'b0),
        .D(taddress[22]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[23] 
       (.CLR(1'b0),
        .D(taddress[23]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[24] 
       (.CLR(1'b0),
        .D(taddress[24]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[25] 
       (.CLR(1'b0),
        .D(taddress[25]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[26] 
       (.CLR(1'b0),
        .D(taddress[26]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[27] 
       (.CLR(1'b0),
        .D(taddress[27]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[28] 
       (.CLR(1'b0),
        .D(taddress[28]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[29] 
       (.CLR(1'b0),
        .D(taddress[29]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[2] 
       (.CLR(1'b0),
        .D(taddress[2]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[30] 
       (.CLR(1'b0),
        .D(taddress[30]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[31] 
       (.CLR(1'b0),
        .D(taddress[31]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[31]));
  LUT3 #(
    .INIT(8'h20)) 
    \m00_axi_araddr_reg[31]_i_1 
       (.I0(m00_axi_aresetn),
        .I1(sp_write),
        .I2(sp_read),
        .O(\m00_axi_araddr_reg[31]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[3] 
       (.CLR(1'b0),
        .D(taddress[3]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[4] 
       (.CLR(1'b0),
        .D(taddress[4]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[5] 
       (.CLR(1'b0),
        .D(taddress[5]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[6] 
       (.CLR(1'b0),
        .D(taddress[6]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[7] 
       (.CLR(1'b0),
        .D(taddress[7]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[8] 
       (.CLR(1'b0),
        .D(taddress[8]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_araddr_reg[9] 
       (.CLR(1'b0),
        .D(taddress[9]),
        .G(\m00_axi_araddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_araddr[9]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[0] 
       (.CLR(1'b0),
        .D(taddress[0]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[10] 
       (.CLR(1'b0),
        .D(taddress[10]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[11] 
       (.CLR(1'b0),
        .D(taddress[11]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[12] 
       (.CLR(1'b0),
        .D(taddress[12]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[13] 
       (.CLR(1'b0),
        .D(taddress[13]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[14] 
       (.CLR(1'b0),
        .D(taddress[14]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[15] 
       (.CLR(1'b0),
        .D(taddress[15]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[16] 
       (.CLR(1'b0),
        .D(taddress[16]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[17] 
       (.CLR(1'b0),
        .D(taddress[17]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[17]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[18] 
       (.CLR(1'b0),
        .D(taddress[18]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[18]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[19] 
       (.CLR(1'b0),
        .D(taddress[19]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[19]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[1] 
       (.CLR(1'b0),
        .D(taddress[1]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[20] 
       (.CLR(1'b0),
        .D(taddress[20]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[20]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[21] 
       (.CLR(1'b0),
        .D(taddress[21]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[21]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[22] 
       (.CLR(1'b0),
        .D(taddress[22]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[22]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[23] 
       (.CLR(1'b0),
        .D(taddress[23]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[23]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[24] 
       (.CLR(1'b0),
        .D(taddress[24]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[24]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[25] 
       (.CLR(1'b0),
        .D(taddress[25]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[25]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[26] 
       (.CLR(1'b0),
        .D(taddress[26]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[26]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[27] 
       (.CLR(1'b0),
        .D(taddress[27]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[27]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[28] 
       (.CLR(1'b0),
        .D(taddress[28]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[28]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[29] 
       (.CLR(1'b0),
        .D(taddress[29]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[29]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[2] 
       (.CLR(1'b0),
        .D(taddress[2]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[30] 
       (.CLR(1'b0),
        .D(taddress[30]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[30]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[31] 
       (.CLR(1'b0),
        .D(taddress[31]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[31]));
  LUT3 #(
    .INIT(8'h08)) 
    \m00_axi_awaddr_reg[31]_i_1 
       (.I0(m00_axi_aresetn),
        .I1(sp_write),
        .I2(sp_read),
        .O(\m00_axi_awaddr_reg[31]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[3] 
       (.CLR(1'b0),
        .D(taddress[3]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[4] 
       (.CLR(1'b0),
        .D(taddress[4]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[5] 
       (.CLR(1'b0),
        .D(taddress[5]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[6] 
       (.CLR(1'b0),
        .D(taddress[6]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[7] 
       (.CLR(1'b0),
        .D(taddress[7]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[8] 
       (.CLR(1'b0),
        .D(taddress[8]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_awaddr_reg[9] 
       (.CLR(1'b0),
        .D(taddress[9]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_awaddr[9]));
  FDRE \m00_axi_wdata_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[0]),
        .Q(m00_axi_wdata[0]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[0]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[0]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[0]__0_i_1 
       (.I0(thalfword_1[0]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[0]),
        .O(\m00_axi_wdata_reg[0]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[10]),
        .Q(m00_axi_wdata[10]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[10]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[10]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[10]__0_i_1 
       (.I0(thalfword_1[10]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[10]),
        .O(\m00_axi_wdata_reg[10]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[11]),
        .Q(m00_axi_wdata[11]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[11]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[11]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[11]__0_i_1 
       (.I0(thalfword_1[11]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[11]),
        .O(\m00_axi_wdata_reg[11]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[12]),
        .Q(m00_axi_wdata[12]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[12]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[12]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[12]__0_i_1 
       (.I0(thalfword_1[12]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[12]),
        .O(\m00_axi_wdata_reg[12]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[13]),
        .Q(m00_axi_wdata[13]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[13]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[13]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[13]__0_i_1 
       (.I0(thalfword_1[13]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[13]),
        .O(\m00_axi_wdata_reg[13]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[14]),
        .Q(m00_axi_wdata[14]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[14]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[14]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[14]__0_i_1 
       (.I0(thalfword_1[14]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[14]),
        .O(\m00_axi_wdata_reg[14]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[15]),
        .Q(m00_axi_wdata[15]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[15]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[15]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[15]__0_i_1 
       (.I0(thalfword_1[15]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[15]),
        .O(\m00_axi_wdata_reg[15]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[1]),
        .Q(m00_axi_wdata[1]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[1]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[1]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[1]__0_i_1 
       (.I0(thalfword_1[1]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[1]),
        .O(\m00_axi_wdata_reg[1]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[2]),
        .Q(m00_axi_wdata[2]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[2]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[2]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[2]__0_i_1 
       (.I0(thalfword_1[2]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[2]),
        .O(\m00_axi_wdata_reg[2]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[3]),
        .Q(m00_axi_wdata[3]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[3]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[3]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[3]__0_i_1 
       (.I0(thalfword_1[3]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[3]),
        .O(\m00_axi_wdata_reg[3]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[4]),
        .Q(m00_axi_wdata[4]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[4]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[4]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[4]__0_i_1 
       (.I0(thalfword_1[4]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[4]),
        .O(\m00_axi_wdata_reg[4]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[5]),
        .Q(m00_axi_wdata[5]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[5]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[5]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[5]__0_i_1 
       (.I0(thalfword_1[5]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[5]),
        .O(\m00_axi_wdata_reg[5]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[6]),
        .Q(m00_axi_wdata[6]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[6]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[6]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[6]__0_i_1 
       (.I0(thalfword_1[6]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[6]),
        .O(\m00_axi_wdata_reg[6]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[7]),
        .Q(m00_axi_wdata[7]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[7]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[7]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[7]__0_i_1 
       (.I0(thalfword_1[7]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[7]),
        .O(\m00_axi_wdata_reg[7]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[8]),
        .Q(m00_axi_wdata[8]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[8]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[8]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[8]__0_i_1 
       (.I0(thalfword_1[8]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[8]),
        .O(\m00_axi_wdata_reg[8]__0_i_1_n_0 ));
  FDRE \m00_axi_wdata_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(m00_axi_wdata[9]),
        .Q(m00_axi_wdata[9]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wdata_reg[9]__0 
       (.CLR(1'b0),
        .D(\m00_axi_wdata_reg[9]__0_i_1_n_0 ),
        .G(\__3/i__n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wdata[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    \m00_axi_wdata_reg[9]__0_i_1 
       (.I0(thalfword_1[9]),
        .I1(sp_op_len[1]),
        .I2(thalfword_0[9]),
        .O(\m00_axi_wdata_reg[9]__0_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wstrb_reg[0] 
       (.CLR(\m00_axi_wstrb_reg[3]_i_2_n_0 ),
        .D(sp_error_reg__3_i_1_n_0),
        .G(\m00_axi_wstrb_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wstrb[0]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wstrb_reg[1] 
       (.CLR(\m00_axi_wstrb_reg[3]_i_2_n_0 ),
        .D(\m00_axi_wstrb_reg[1]_i_1_n_0 ),
        .G(\m00_axi_wstrb_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wstrb[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \m00_axi_wstrb_reg[1]_i_1 
       (.I0(sp_read),
        .I1(sp_write),
        .I2(sp_op_len[1]),
        .I3(sp_op_len[0]),
        .O(\m00_axi_wstrb_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wstrb_reg[2] 
       (.CLR(\m00_axi_wstrb_reg[3]_i_2_n_0 ),
        .D(\<const0> ),
        .G(\m00_axi_wstrb_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wstrb[2]));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \m00_axi_wstrb_reg[3] 
       (.CLR(\m00_axi_wstrb_reg[3]_i_2_n_0 ),
        .D(\<const0> ),
        .G(\m00_axi_wstrb_reg[3]_i_1_n_0 ),
        .GE(1'b1),
        .Q(m00_axi_wstrb[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF070)) 
    \m00_axi_wstrb_reg[3]_i_1 
       (.I0(sp_op_len[1]),
        .I1(sp_op_len[0]),
        .I2(sp_write),
        .I3(sp_read),
        .O(\m00_axi_wstrb_reg[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \m00_axi_wstrb_reg[3]_i_2 
       (.I0(m00_axi_aresetn),
        .O(\m00_axi_wstrb_reg[3]_i_2_n_0 ));
  (* C_M_AXI_ADDR_WIDTH = "32" *) 
  (* C_M_AXI_DATA_WIDTH = "32" *) 
  (* C_M_START_DATA_VALUE = "-1442840576" *) 
  (* C_M_TARGET_SLAVE_BASE_ADDR = "1073741824" *) 
  (* C_M_TRANSACTIONS_NUM = "4" *) 
  design_1_smallpond_axi4_interface_0_0_smallpond_axi_v1_0_M00_AXI smallpond_axi_v1_0_M00_AXI_inst
       (.ERROR(m00_axi_error),
        .INIT_AXI_TXN(m00_axi_init_axi_txn),
        .M_AXI_ACLK(m00_axi_aclk),
        .M_AXI_ARADDR(m00_axi_araddr),
        .M_AXI_ARESETN(m00_axi_aresetn),
        .M_AXI_ARPROT({\<const0> ,\<const1> ,\<const0> }),
        .M_AXI_ARREADY(m00_axi_arready),
        .M_AXI_ARVALID(NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_ARVALID_UNCONNECTED),
        .M_AXI_AWADDR(m00_axi_awaddr),
        .M_AXI_AWPROT({\<const0> ,\<const1> ,\<const0> }),
        .M_AXI_AWREADY(m00_axi_awready),
        .M_AXI_AWVALID(NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_AWVALID_UNCONNECTED),
        .M_AXI_BREADY(NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_BREADY_UNCONNECTED),
        .M_AXI_BRESP(m00_axi_bresp),
        .M_AXI_BVALID(m00_axi_bvalid),
        .M_AXI_RDATA(m00_axi_rdata),
        .M_AXI_RREADY(NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_RREADY_UNCONNECTED),
        .M_AXI_RRESP(m00_axi_rresp),
        .M_AXI_RVALID(m00_axi_rvalid),
        .M_AXI_WDATA({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,m00_axi_wdata}),
        .M_AXI_WREADY(m00_axi_wready),
        .M_AXI_WSTRB(m00_axi_wstrb),
        .M_AXI_WVALID(NLW_smallpond_axi_v1_0_M00_AXI_inst_M_AXI_WVALID_UNCONNECTED),
        .TXN_DONE(m00_axi_txn_done));
  FDRE \sp_data_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[0]),
        .Q(sp_data[0]),
        .R(\<const0> ));
  FDRE \sp_data_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[1]),
        .Q(sp_data[1]),
        .R(\<const0> ));
  FDRE \sp_data_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[2]),
        .Q(sp_data[2]),
        .R(\<const0> ));
  FDRE \sp_data_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[3]),
        .Q(sp_data[3]),
        .R(\<const0> ));
  FDRE \sp_data_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[4]),
        .Q(sp_data[4]),
        .R(\<const0> ));
  FDRE \sp_data_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[5]),
        .Q(sp_data[5]),
        .R(\<const0> ));
  FDRE \sp_data_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[6]),
        .Q(sp_data[6]),
        .R(\<const0> ));
  FDRE \sp_data_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_data[7]),
        .Q(sp_data[7]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    sp_error19_out
       (.I0(m00_axi_aresetn),
        .I1(sp_write),
        .I2(sp_read),
        .I3(sp_op_len[0]),
        .I4(sp_op_len[1]),
        .O(sp_error19_out__0));
  FDRE sp_error_reg
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_error),
        .Q(sp_error),
        .R(\<const0> ));
  FDRE sp_error_reg__0
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_error),
        .Q(sp_error),
        .R(\<const0> ));
  FDRE sp_error_reg__1
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_error),
        .Q(sp_error),
        .R(\<const0> ));
  FDRE sp_error_reg__2
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(sp_error),
        .Q(sp_error),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    sp_error_reg__3
       (.CLR(1'b0),
        .D(sp_error_reg__3_i_1_n_0),
        .G(sp_error19_out__0),
        .GE(1'b1),
        .Q(sp_error));
  LUT2 #(
    .INIT(4'h2)) 
    sp_error_reg__3_i_1
       (.I0(sp_write),
        .I1(sp_read),
        .O(sp_error_reg__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \taddress[3]_i_2 
       (.I0(taddress[1]),
        .O(\taddress[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[0]),
        .Q(taddress[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[0]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[0]),
        .Q(taddress[0]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[0]__1 
       (.CLR(1'b0),
        .D(sp_addr[0]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[0]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[10]),
        .Q(taddress[10]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[10]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[10]),
        .Q(taddress[10]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[10]__1 
       (.CLR(1'b0),
        .D(sp_addr[10]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[10]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[11]),
        .Q(taddress[11]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[11]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[11]),
        .Q(taddress[11]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[11]__1 
       (.CLR(1'b0),
        .D(sp_addr[11]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[11]));
  CARRY4 \taddress_reg[11]_i_1 
       (.CI(\taddress_reg[7]_i_1_n_0 ),
        .CO({\taddress_reg[11]_i_1_n_0 ,\taddress_reg[11]_i_1_n_1 ,\taddress_reg[11]_i_1_n_2 ,\taddress_reg[11]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[11:8]),
        .S(taddress[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[12]),
        .Q(taddress[12]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[12]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[12]),
        .Q(taddress[12]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[12]__1 
       (.CLR(1'b0),
        .D(sp_addr[12]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[12]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[13]),
        .Q(taddress[13]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[13]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[13]),
        .Q(taddress[13]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[13]__1 
       (.CLR(1'b0),
        .D(sp_addr[13]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[13]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[14]),
        .Q(taddress[14]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[14]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[14]),
        .Q(taddress[14]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[14]__1 
       (.CLR(1'b0),
        .D(sp_addr[14]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[14]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[15]),
        .Q(taddress[15]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[15]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[15]),
        .Q(taddress[15]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[15]__1 
       (.CLR(1'b0),
        .D(sp_addr[15]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[15]));
  CARRY4 \taddress_reg[15]_i_1 
       (.CI(\taddress_reg[11]_i_1_n_0 ),
        .CO({\taddress_reg[15]_i_1_n_0 ,\taddress_reg[15]_i_1_n_1 ,\taddress_reg[15]_i_1_n_2 ,\taddress_reg[15]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[15:12]),
        .S(taddress[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[16]),
        .Q(taddress[16]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[16]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[16]),
        .Q(taddress[16]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[16]__1 
       (.CLR(1'b0),
        .D(sp_addr[16]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[16]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[17]),
        .Q(taddress[17]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[17]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[17]),
        .Q(taddress[17]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[17]__1 
       (.CLR(1'b0),
        .D(sp_addr[17]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[17]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[18]),
        .Q(taddress[18]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[18]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[18]),
        .Q(taddress[18]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[18]__1 
       (.CLR(1'b0),
        .D(sp_addr[18]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[18]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[19]),
        .Q(taddress[19]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[19]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[19]),
        .Q(taddress[19]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[19]__1 
       (.CLR(1'b0),
        .D(sp_addr[19]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[19]));
  CARRY4 \taddress_reg[19]_i_1 
       (.CI(\taddress_reg[15]_i_1_n_0 ),
        .CO({\taddress_reg[19]_i_1_n_0 ,\taddress_reg[19]_i_1_n_1 ,\taddress_reg[19]_i_1_n_2 ,\taddress_reg[19]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[19:16]),
        .S(taddress[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[1]),
        .Q(taddress[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[1]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[1]),
        .Q(taddress[1]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[1]__1 
       (.CLR(1'b0),
        .D(sp_addr[1]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[1]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[20]),
        .Q(taddress[20]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[20]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[20]),
        .Q(taddress[20]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[20]__1 
       (.CLR(1'b0),
        .D(sp_addr[20]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[20]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[21]),
        .Q(taddress[21]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[21]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[21]),
        .Q(taddress[21]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[21]__1 
       (.CLR(1'b0),
        .D(sp_addr[21]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[21]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[22]),
        .Q(taddress[22]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[22]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[22]),
        .Q(taddress[22]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[22]__1 
       (.CLR(1'b0),
        .D(sp_addr[22]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[22]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[23]),
        .Q(taddress[23]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[23]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[23]),
        .Q(taddress[23]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[23]__1 
       (.CLR(1'b0),
        .D(sp_addr[23]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[23]));
  CARRY4 \taddress_reg[23]_i_1 
       (.CI(\taddress_reg[19]_i_1_n_0 ),
        .CO({\taddress_reg[23]_i_1_n_0 ,\taddress_reg[23]_i_1_n_1 ,\taddress_reg[23]_i_1_n_2 ,\taddress_reg[23]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[23:20]),
        .S(taddress[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[24]),
        .Q(taddress[24]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[24]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[24]),
        .Q(taddress[24]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[24]__1 
       (.CLR(1'b0),
        .D(sp_addr[24]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[24]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[25]),
        .Q(taddress[25]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[25]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[25]),
        .Q(taddress[25]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[25]__1 
       (.CLR(1'b0),
        .D(sp_addr[25]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[25]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[26]),
        .Q(taddress[26]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[26]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[26]),
        .Q(taddress[26]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[26]__1 
       (.CLR(1'b0),
        .D(sp_addr[26]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[26]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[27]),
        .Q(taddress[27]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[27]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[27]),
        .Q(taddress[27]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[27]__1 
       (.CLR(1'b0),
        .D(sp_addr[27]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[27]));
  CARRY4 \taddress_reg[27]_i_1 
       (.CI(\taddress_reg[23]_i_1_n_0 ),
        .CO({\taddress_reg[27]_i_1_n_0 ,\taddress_reg[27]_i_1_n_1 ,\taddress_reg[27]_i_1_n_2 ,\taddress_reg[27]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[27:24]),
        .S(taddress[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[28]),
        .Q(taddress[28]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[28]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[28]),
        .Q(taddress[28]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[28]__1 
       (.CLR(1'b0),
        .D(sp_addr[28]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[28]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[29]),
        .Q(taddress[29]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[29]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[29]),
        .Q(taddress[29]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[29]__1 
       (.CLR(1'b0),
        .D(sp_addr[29]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[29]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[2]),
        .Q(taddress[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[2]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[2]),
        .Q(taddress[2]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[2]__1 
       (.CLR(1'b0),
        .D(sp_addr[2]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[2]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[30]),
        .Q(taddress[30]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[30]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[30]),
        .Q(taddress[30]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[30]__1 
       (.CLR(1'b0),
        .D(sp_addr[30]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[30]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[31]),
        .Q(taddress[31]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[31]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[31]),
        .Q(taddress[31]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[31]__1 
       (.CLR(1'b0),
        .D(sp_addr[31]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[31]));
  LUT3 #(
    .INIT(8'h28)) 
    \taddress_reg[31]__1_i_1 
       (.I0(m00_axi_aresetn),
        .I1(sp_write),
        .I2(sp_read),
        .O(\taddress_reg[31]__1_i_1_n_0 ));
  CARRY4 \taddress_reg[31]_i_1 
       (.CI(\taddress_reg[27]_i_1_n_0 ),
        .CO({\NLW_taddress_reg[31]_i_1_CO_UNCONNECTED [3],\taddress_reg[31]_i_1_n_1 ,\taddress_reg[31]_i_1_n_2 ,\taddress_reg[31]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[31:28]),
        .S(taddress[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[3]),
        .Q(taddress[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[3]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[3]),
        .Q(taddress[3]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[3]__1 
       (.CLR(1'b0),
        .D(sp_addr[3]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[3]));
  CARRY4 \taddress_reg[3]_i_1 
       (.CI(\<const0> ),
        .CO({\taddress_reg[3]_i_1_n_0 ,\taddress_reg[3]_i_1_n_1 ,\taddress_reg[3]_i_1_n_2 ,\taddress_reg[3]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,taddress[1],\<const0> }),
        .O(plusOp[3:0]),
        .S({taddress[3:2],\taddress[3]_i_2_n_0 ,taddress[0]}));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[4]),
        .Q(taddress[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[4]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[4]),
        .Q(taddress[4]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[4]__1 
       (.CLR(1'b0),
        .D(sp_addr[4]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[4]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[5]),
        .Q(taddress[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[5]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[5]),
        .Q(taddress[5]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[5]__1 
       (.CLR(1'b0),
        .D(sp_addr[5]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[5]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[6]),
        .Q(taddress[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[6]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[6]),
        .Q(taddress[6]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[6]__1 
       (.CLR(1'b0),
        .D(sp_addr[6]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[6]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[7]),
        .Q(taddress[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[7]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[7]),
        .Q(taddress[7]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[7]__1 
       (.CLR(1'b0),
        .D(sp_addr[7]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[7]));
  CARRY4 \taddress_reg[7]_i_1 
       (.CI(\taddress_reg[3]_i_1_n_0 ),
        .CO({\taddress_reg[7]_i_1_n_0 ,\taddress_reg[7]_i_1_n_1 ,\taddress_reg[7]_i_1_n_2 ,\taddress_reg[7]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(plusOp[7:4]),
        .S(taddress[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[8]),
        .Q(taddress[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[8]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[8]),
        .Q(taddress[8]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[8]__1 
       (.CLR(1'b0),
        .D(sp_addr[8]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[8]));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[9]),
        .Q(taddress[9]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \taddress_reg[9]__0 
       (.C(m00_axi_aclk),
        .CE(\<const0> ),
        .D(plusOp[9]),
        .Q(taddress[9]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \taddress_reg[9]__1 
       (.CLR(1'b0),
        .D(sp_addr[9]),
        .G(\taddress_reg[31]__1_i_1_n_0 ),
        .GE(1'b1),
        .Q(taddress[9]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[0]),
        .Q(thalfword_0[0]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[0]__0 
       (.CLR(1'b0),
        .D(sp_data[0]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[0]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[10]),
        .Q(thalfword_0[10]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[10]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[10]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[11]),
        .Q(thalfword_0[11]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[11]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[11]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[12]),
        .Q(thalfword_0[12]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[12]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[12]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[13]),
        .Q(thalfword_0[13]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[13]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[13]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[14]),
        .Q(thalfword_0[14]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[14]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[14]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[15]),
        .Q(thalfword_0[15]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[15]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[15]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[1]),
        .Q(thalfword_0[1]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[1]__0 
       (.CLR(1'b0),
        .D(sp_data[1]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[2]),
        .Q(thalfword_0[2]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[2]__0 
       (.CLR(1'b0),
        .D(sp_data[2]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[2]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[3]),
        .Q(thalfword_0[3]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[3]__0 
       (.CLR(1'b0),
        .D(sp_data[3]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[4]),
        .Q(thalfword_0[4]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[4]__0 
       (.CLR(1'b0),
        .D(sp_data[4]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[4]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[5]),
        .Q(thalfword_0[5]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[5]__0 
       (.CLR(1'b0),
        .D(sp_data[5]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[5]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[6]),
        .Q(thalfword_0[6]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[6]__0 
       (.CLR(1'b0),
        .D(sp_data[6]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[6]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[7]),
        .Q(thalfword_0[7]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[7]__0 
       (.CLR(1'b0),
        .D(sp_data[7]),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[7]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[8]),
        .Q(thalfword_0[8]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[8]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[8]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_0[9]),
        .Q(thalfword_0[9]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_0_reg[9]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[0]),
        .Q(thalfword_1[0]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[0]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[0]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[10]),
        .Q(thalfword_1[10]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[10]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[10]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[11]),
        .Q(thalfword_1[11]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[11]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[11]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[12]),
        .Q(thalfword_1[12]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[12]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[12]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[13]),
        .Q(thalfword_1[13]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[13]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[13]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[14]),
        .Q(thalfword_1[14]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[14]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[14]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[15]),
        .Q(thalfword_1[15]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[15]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[15]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[1]),
        .Q(thalfword_1[1]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[1]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[1]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[2]),
        .Q(thalfword_1[2]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[2]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[2]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[3]),
        .Q(thalfword_1[3]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[3]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[4]),
        .Q(thalfword_1[4]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[4]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[4]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[5]),
        .Q(thalfword_1[5]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[5]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[5]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[6]),
        .Q(thalfword_1[6]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[6]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[6]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[7]),
        .Q(thalfword_1[7]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[7]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[7]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[8]),
        .Q(thalfword_1[8]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[8]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[8]));
  FDRE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\<const1> ),
        .D(thalfword_1[9]),
        .Q(thalfword_1[9]),
        .R(\<const0> ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \thalfword_1_reg[9]__0 
       (.CLR(1'b0),
        .D(\<const1> ),
        .G(\m00_axi_awaddr_reg[31]_i_1_n_0 ),
        .GE(1'b1),
        .Q(thalfword_1[9]));
endmodule

(* ORIG_REF_NAME = "smallpond_axi_v1_0_M00_AXI" *) 
module design_1_smallpond_axi4_interface_0_0_smallpond_axi_v1_0_M00_AXI
   (INIT_AXI_TXN,
    ERROR,
    TXN_DONE,
    M_AXI_ACLK,
    M_AXI_ARESETN,
    M_AXI_AWADDR,
    M_AXI_AWPROT,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BRESP,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARADDR,
    M_AXI_ARPROT,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RVALID,
    M_AXI_RREADY);
  input INIT_AXI_TXN;
  output ERROR;
  output TXN_DONE;
  input M_AXI_ACLK;
  input M_AXI_ARESETN;
  output [31:0]M_AXI_AWADDR;
  output [2:0]M_AXI_AWPROT;
  output M_AXI_AWVALID;
  input M_AXI_AWREADY;
  output [31:0]M_AXI_WDATA;
  output [3:0]M_AXI_WSTRB;
  output M_AXI_WVALID;
  input M_AXI_WREADY;
  input [1:0]M_AXI_BRESP;
  input M_AXI_BVALID;
  output M_AXI_BREADY;
  output [31:0]M_AXI_ARADDR;
  output [2:0]M_AXI_ARPROT;
  output M_AXI_ARVALID;
  input M_AXI_ARREADY;
  input [31:0]M_AXI_RDATA;
  input [1:0]M_AXI_RRESP;
  input M_AXI_RVALID;
  output M_AXI_RREADY;


endmodule
module xVIA(.a(w),.b(w));
inout w;
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
