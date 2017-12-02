----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2017 05:47:02 PM
-- Design Name: 
-- Module Name: 32_bit_register - Behavioral
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

entity register_32_bit is
    Port ( d : in STD_LOGIC_VECTOR (31 downto 0);
           ld : in STD_LOGIC;
           clear : in STD_LOGIC;
           clk_in : in STD_LOGIC;
           q : in STD_LOGIC_VECTOR (31 downto 0));
end register_32_bit;

architecture Behavioral of register_32_bit is

begin


end Behavioral;
