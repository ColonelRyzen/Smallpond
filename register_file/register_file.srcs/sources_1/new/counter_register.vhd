----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2017 02:43:06 PM
-- Design Name: 
-- Module Name: counter_register - Behavioral
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

entity counter_register is
    Port ( clk_in : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           counter_data_in : in STD_LOGIC_VECTOR(31 downto 0);
           d_in : in STD_LOGIC_VECTOR (31 downto 0);
           counter_in : in STD_LOGIC;
           enable_in : in STD_LOGIC;
           --counter_data_out : out STD_LOGIC_VECTOR(31 downto 0);
           q_out : out STD_LOGIC_VECTOR (31 downto 0));
end counter_register;

architecture Behavioral of counter_register is

begin
process(clk_in,reset_in)
begin
    if reset_in = '1' then
        q_out <= x"00000000";
    elsif rising_edge(clk_in) then
        if enable_in = '1' and counter_in = '0' then
            q_out <= d_in;
        elsif counter_in = '1' and enable_in = '0' then
            q_out <= counter_data_in;
        end if;
    end if;
end process;

end Behavioral;
