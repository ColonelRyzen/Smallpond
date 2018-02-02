----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 05:55:24 PM
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

entity cpsr_register is
        Port ( clk_in : in STD_LOGIC;
               reset_in : in STD_LOGIC;
               d_in : in STD_LOGIC_VECTOR (31 downto 0);
               cpsr_data_in : in STD_LOGIC_VECTOR (3 downto 0);
               enable_in : in STD_LOGIC;
               cpsr_in : in STD_LOGIC;
               q_out : out STD_LOGIC_VECTOR (31 downto 0));
end cpsr_register;

architecture Behavioral of cpsr_register is

begin
process(clk_in,reset_in)
    begin
        if reset_in = '1' then
            q_out <= x"00000000";
        elsif rising_edge(clk_in) then
            if enable_in = '1' and cpsr_in = '0' then
                q_out <= d_in;
            elsif cpsr_in = '1' and enable_in = '0' then
                q_out(3 downto 0) <= cpsr_data_in;
            end if;
        end if;
    end process;

end Behavioral;
