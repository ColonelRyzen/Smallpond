// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3.1 (lin64) Build 2035080 Fri Oct 20 14:20:00 MDT 2017
// Date        : Sun Dec  3 20:12:43 2017
// Host        : octopus-tetricus running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /home/jrcharlo/Smallpond/sp_axi4_interface/sp_axi4_interface.srcs/sources_1/bd/design_1/ip/design_1_sp_axi4_tb_0_0/design_1_sp_axi4_tb_0_0_sim_netlist.v
// Design      : design_1_sp_axi4_tb_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_sp_axi4_tb_0_0,sp_axi4_tb,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "sp_axi4_tb,Vivado 2017.3.1" *) 
(* NotValidForBitStream *)
module design_1_sp_axi4_tb_0_0
   (sp_read,
    sp_sign_extend,
    sp_write,
    sp_op_len,
    sp_addr,
    sp_data,
    sp_over,
    sp_error,
    sw,
    led0_r,
    led0_g,
    led0_b,
    led,
    btn);
  output sp_read;
  output sp_sign_extend;
  output sp_write;
  output [1:0]sp_op_len;
  output [31:0]sp_addr;
  inout [31:0]sp_data;
  input sp_over;
  input sp_error;
  input [3:0]sw;
  output led0_r;
  output led0_g;
  output led0_b;
  output [3:0]led;
  input [3:0]btn;

  wire [3:0]btn;
  wire [3:0]led;
  wire led0_b;
  wire led0_g;
  wire led0_r;
  wire [31:0]sp_addr;
  wire [31:0]sp_data;
  wire sp_error;
  wire [1:0]sp_op_len;
  wire sp_over;
  wire sp_read;
  wire sp_sign_extend;
  wire sp_write;
  wire [3:0]sw;

  design_1_sp_axi4_tb_0_0_sp_axi4_tb U0
       (.btn(btn),
        .led(led),
        .led0_b(led0_b),
        .led0_g(led0_g),
        .led0_r(led0_r),
        .sp_addr(sp_addr),
        .sp_data(sp_data),
        .sp_error(sp_error),
        .sp_op_len(sp_op_len),
        .sp_over(sp_over),
        .sp_read(sp_read),
        .sp_sign_extend(sp_sign_extend),
        .sp_write(sp_write),
        .sw(sw));
endmodule

(* ORIG_REF_NAME = "sp_axi4_tb" *) 
module design_1_sp_axi4_tb_0_0_sp_axi4_tb
   (sp_read,
    sp_sign_extend,
    sp_write,
    sp_op_len,
    sp_addr,
    sp_data,
    sp_over,
    sp_error,
    sw,
    led0_r,
    led0_g,
    led0_b,
    led,
    btn);
  output sp_read;
  output sp_sign_extend;
  output sp_write;
  output [1:0]sp_op_len;
  output [31:0]sp_addr;
  inout [31:0]sp_data;
  input sp_over;
  input sp_error;
  input [3:0]sw;
  output led0_r;
  output led0_g;
  output led0_b;
  output [3:0]led;
  input [3:0]btn;

  wire \<const0> ;
  wire \<const1> ;

  assign led[3] = sp_data[9];
  assign led[2] = sp_data[9];
  assign led[1] = sp_data[9];
  assign led[0] = sp_data[9];
  assign led0_b = \<const1> ;
  assign led0_g = sp_data[9];
  assign led0_r = sp_data[9];
  assign sp_addr[31] = \<const1> ;
  assign sp_addr[30] = sp_data[9];
  assign sp_addr[29] = sp_data[9];
  assign sp_addr[28] = sp_data[9];
  assign sp_addr[27] = sp_data[9];
  assign sp_addr[26] = sp_data[9];
  assign sp_addr[25] = sp_data[9];
  assign sp_addr[24] = sp_data[9];
  assign sp_addr[23] = sp_data[9];
  assign sp_addr[22] = sp_data[9];
  assign sp_addr[21] = sp_data[9];
  assign sp_addr[20] = sp_data[9];
  assign sp_addr[19] = sp_data[9];
  assign sp_addr[18] = sp_data[9];
  assign sp_addr[17] = sp_data[9];
  assign sp_addr[16] = sp_data[9];
  assign sp_addr[15] = sp_data[9];
  assign sp_addr[14] = sp_data[9];
  assign sp_addr[13] = sp_data[9];
  assign sp_addr[12] = sp_data[9];
  assign sp_addr[11] = sp_data[9];
  assign sp_addr[10] = sp_data[9];
  assign sp_addr[9] = sp_data[9];
  assign sp_addr[8] = sp_data[9];
  assign sp_addr[7] = sp_data[9];
  assign sp_addr[6] = sp_data[9];
  assign sp_addr[5] = sp_data[9];
  assign sp_addr[4] = sp_data[9];
  assign sp_addr[3] = sp_data[9];
  assign sp_addr[2] = sp_data[9];
  assign sp_addr[1] = sp_data[9];
  assign sp_addr[0] = sp_data[9];
  assign sp_data[9] = sw[3];
  assign sp_data[9] = sw[2];
  assign sp_data[9] = sw[1];
  assign sp_data[9] = sw[0];
  assign sp_op_len[1] = sp_data[9];
  assign sp_op_len[0] = sp_data[9];
  assign sp_read = \<const1> ;
  assign sp_sign_extend = sp_data[9];
  assign sp_write = sp_data[9];
  xVIA sp_data_0via (sp_data[0], sp_data[9]);
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
  xVIA sp_data_1via (sp_data[1], sp_data[9]);
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
  xVIA sp_data_2via (sp_data[2], sp_data[9]);
  xVIA sp_data_30via (sp_data[30], sp_data[9]);
  xVIA sp_data_31via (sp_data[31], sp_data[9]);
  xVIA sp_data_3via (sp_data[3], sp_data[9]);
  xVIA sp_data_4via (sp_data[4], sp_data[9]);
  xVIA sp_data_5via (sp_data[5], sp_data[9]);
  xVIA sp_data_6via (sp_data[6], sp_data[9]);
  xVIA sp_data_7via (sp_data[7], sp_data[9]);
  xVIA sp_data_8via (sp_data[8], sp_data[9]);
  GND GND
       (.G(sp_data[9]));
  VCC VCC
       (.P(\<const1> ));
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
