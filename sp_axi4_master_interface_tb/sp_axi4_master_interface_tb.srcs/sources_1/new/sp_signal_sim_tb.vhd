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
      sp_read : out STD_LOGIC;
      sp_sign_extend : out STD_LOGIC;
      sp_write : out STD_LOGIC;
      sp_op_len : out STD_LOGIC_VECTOR ( 1 downto 0 );
      sp_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_data_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
      sp_over : in STD_LOGIC;
      sp_error : in STD_LOGIC
);
end sp_axi4_interface_tb;

architecture Behavioral of sp_axi4_interface_tb is

    signal clk : std_logic;
    
    constant clk_period : time := 10ns;
  
begin

    clk_process : process begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    
    go : process begin
      sp_read <= '0';
      sp_addr <= x"80000000";
      sp_op_len <= "01";
      sp_sign_extend <= '0';
      sp_data_out <= x"00000053";
      sp_write <= '1';
      
      wait for 100ns;
      
      sp_write <= '0';
      
      wait for 100ns;
      
      sp_read <= '1';
      
    end process;

end Behavioral;
