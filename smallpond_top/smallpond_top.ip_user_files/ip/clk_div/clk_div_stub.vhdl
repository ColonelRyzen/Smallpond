-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Tue Apr  3 14:16:25 2018
-- Host        : enterprise running 64-bit Ubuntu 16.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub {/media/zack/528CA51E8CA4FE1B/Users/zacks/Documents/UB/Senior/Fall
--               2017/CSE490/smallpond/Smallpond/smallpond_top/smallpond_top.runs/clk_div_synth_1/clk_div_stub.vhdl}
-- Design      : clk_div
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div is
  Port ( 
    cpu_clk_8 : out STD_LOGIC;
    mem_clk : out STD_LOGIC;
    clk_in : in STD_LOGIC
  );

end clk_div;

architecture stub of clk_div is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "cpu_clk_8,mem_clk,clk_in";
begin
end;
