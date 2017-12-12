--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.3.1 (lin64) Build 2035080 Fri Oct 20 14:20:00 MDT 2017
--Date        : Tue Dec 12 12:34:02 2017
--Host        : octopus-tetricus running 64-bit unknown
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    ddr3_sdram_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_sdram_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_sdram_cas_n : out STD_LOGIC;
    ddr3_sdram_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ddr3_sdram_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ras_n : out STD_LOGIC;
    ddr3_sdram_reset_n : out STD_LOGIC;
    ddr3_sdram_we_n : out STD_LOGIC;
    reset : in STD_LOGIC;
--    sp_addr_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    sp_data_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    sp_data_out_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
--    sp_error_0 : out STD_LOGIC;
--    sp_op_len_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
--    sp_over_0 : out STD_LOGIC;
--    sp_read_0 : in STD_LOGIC;
--    sp_sign_extend_0 : in STD_LOGIC;
--    sp_write_0 : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    ddr3_sdram_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ddr3_sdram_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_addr : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ddr3_sdram_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_sdram_ras_n : out STD_LOGIC;
    ddr3_sdram_cas_n : out STD_LOGIC;
    ddr3_sdram_we_n : out STD_LOGIC;
    ddr3_sdram_reset_n : out STD_LOGIC;
    ddr3_sdram_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    sp_read_0 : in STD_LOGIC;
    sp_sign_extend_0 : in STD_LOGIC;
    sp_write_0 : in STD_LOGIC;
    sp_op_len_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sp_error_0 : out STD_LOGIC;
    sp_over_0 : out STD_LOGIC;
    sp_data_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sp_addr_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sp_data_out_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1;
  
      signal sp_addr : std_logic_vector(31 downto 0);
      signal sp_data_in : std_logic_vector(31 downto 0);
      signal sp_data_out : std_logic_vector(31 downto 0);
      signal sp_error : std_logic;
      signal sp_op_len : std_logic_vector(1 downto  0);
      signal sp_over : std_logic;
      signal sp_read : std_logic;
      signal sp_write : std_logic;
      signal sp_sign_extend : std_logic;
      
begin
design_1_i: component design_1
     port map (
      ddr3_sdram_addr(13 downto 0) => ddr3_sdram_addr(13 downto 0),
      ddr3_sdram_ba(2 downto 0) => ddr3_sdram_ba(2 downto 0),
      ddr3_sdram_cas_n => ddr3_sdram_cas_n,
      ddr3_sdram_ck_n(0) => ddr3_sdram_ck_n(0),
      ddr3_sdram_ck_p(0) => ddr3_sdram_ck_p(0),
      ddr3_sdram_cke(0) => ddr3_sdram_cke(0),
      ddr3_sdram_cs_n(0) => ddr3_sdram_cs_n(0),
      ddr3_sdram_dm(1 downto 0) => ddr3_sdram_dm(1 downto 0),
      ddr3_sdram_dq(15 downto 0) => ddr3_sdram_dq(15 downto 0),
      ddr3_sdram_dqs_n(1 downto 0) => ddr3_sdram_dqs_n(1 downto 0),
      ddr3_sdram_dqs_p(1 downto 0) => ddr3_sdram_dqs_p(1 downto 0),
      ddr3_sdram_odt(0) => ddr3_sdram_odt(0),
      ddr3_sdram_ras_n => ddr3_sdram_ras_n,
      ddr3_sdram_reset_n => ddr3_sdram_reset_n,
      ddr3_sdram_we_n => ddr3_sdram_we_n,
      reset => reset,
      sp_addr_0(31 downto 0) => sp_addr(31 downto 0),
      sp_data_in_0(31 downto 0) => sp_data_in(31 downto 0),
      sp_data_out_0(31 downto 0) => sp_data_out(31 downto 0),
      sp_error_0 => sp_error,
      sp_op_len_0(1 downto 0) => sp_op_len(1 downto 0),
      sp_over_0 => sp_over,
      sp_read_0 => sp_read,
      sp_sign_extend_0 => sp_sign_extend,
      sp_write_0 => sp_write,
      sys_clock => sys_clock
    );
    
    stimulus : process begin
    
        sp_read <= '0';
        sp_op_len <= "01";
        sp_sign_extend <= '0';
        sp_addr <= x"80000000";
        sp_write <= '1';
        sp_data_in <= x"00003765";
        
        wait for 100ns;
        
        sp_write <= '0';
        
        wait for 100ns;
        
        sp_read <= '1';
        
        wait for 100ns;
    
    end process;
    
end STRUCTURE;
