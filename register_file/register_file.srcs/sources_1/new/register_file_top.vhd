----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2017 05:47:02 PM
-- Design Name: 
-- Module Name: register_file_top - Behavioral
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

entity register_file_top is
    Port ( reg_write_in : in STD_LOGIC;
           counter_bit_in : in STD_LOGIC;
           write_register_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_register_1_in : in STD_LOGIC_VECTOR (0 downto 0);
           read_register_2_in : in STD_LOGIC_VECTOR (4 downto 0);
           write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
           pc_write_in : in STD_LOGIC;
           pc_write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
           cpsr_set_bit_in : in STD_LOGIC;
           cpsr_cond_bits_from_alu : in STD_LOGIC_VECTOR (3 downto 0);
           cpsr_cond_bits_to_control : out STD_LOGIC_VECTOR (3 downto 0);
           register_1_out : out STD_LOGIC_VECTOR (0 downto 0);
           register_2_out : out STD_LOGIC_VECTOR (310 downto 0);
           clk_in : in STD_LOGIC;
           reset_in : in STD_LOGIC);
end register_file_top;

architecture Behavioral of register_file_top is

begin


end Behavioral;
