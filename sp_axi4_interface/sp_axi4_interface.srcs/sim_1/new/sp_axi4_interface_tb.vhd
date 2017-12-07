----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2017 11:20:53 PM
-- Design Name: 
-- Module Name: sp_axi4_interface_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sp_axi4_interface_tb is
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
  sys_clock : in STD_LOGIC;
  usb_uart_rxd : in STD_LOGIC;
  usb_uart_txd : out STD_LOGIC
);
end sp_axi4_interface_tb;

architecture Behavioral of sp_axi4_interface_tb is
  component design_1_wrapper is
    port (
      usb_uart_rxd : in STD_LOGIC;
      usb_uart_txd : out STD_LOGIC;
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
      sys_clock : in STD_LOGIC;
      reset : in STD_LOGIC;
      sp_read_0 : in STD_LOGIC;
      sp_sign_extend_0 : in STD_LOGIC;
      sp_write_0 : in STD_LOGIC;
      sp_op_len_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
      sp_addr_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_data_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_data_out_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_over_0 : out STD_LOGIC;
      sp_error_0 : out STD_LOGIC
    );
  end component design_1_wrapper;
  
  signal sp_read : std_logic;
  signal sp_sign_extend : std_Logic;
  signal sp_write : std_logic;
  signal sp_op_len : std_logic_vector(1 downto 0);
  signal sp_addr : std_logic_vector(31 downto 0);
  signal sp_data_in : std_logic_vector(31 downto 0);
  signal sp_data_out : std_logic_vector(31 downto 0);
  signal sp_over : std_logic;
  signal sp_error : std_logic;
  
begin

sp_axi4_interface_1 : component design_1_wrapper
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
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
    
    go : process begin
      sp_read <= '0';
      sp_addr <= x"80000000";
      sp_op_len <= "00";
      sp_sign_extend <= '0';
      sp_data_out <= x"00000053";
      wait for 10 ns;
    end process;

end Behavioral;
