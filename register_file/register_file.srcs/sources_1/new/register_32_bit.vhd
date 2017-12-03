----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2017 11:03:34 PM
-- Design Name: 
-- Module Name: register_32_bit - Behavioral
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
    Port ( clk_in : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           d_in : in STD_LOGIC_VECTOR (31 downto 0);
           load_in : in STD_LOGIC;
           q_out : out STD_LOGIC_VECTOR (31 downto 0));
end register_32_bit;

architecture Behavioral of register_32_bit is

begin
process(clk_in,reset_in)
    begin
        if reset_in = '1' then
            q_out <= x"00000000";
        elsif rising_edge(clk_in) then
            if load_in = '1' then
                q_out <= d_in;
            end if;
        end if;
    end process;

end Behavioral;
