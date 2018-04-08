-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../uart.srcs/sources_1/ip/clk_div/clk_div_clk_wiz.v" \
  "../../../../uart.srcs/sources_1/ip/clk_div/clk_div.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

