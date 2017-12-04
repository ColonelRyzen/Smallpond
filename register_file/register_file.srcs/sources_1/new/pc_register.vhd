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

entity pc_register is
        Port ( clk_in : in STD_LOGIC;
               reset_in : in STD_LOGIC;
               d_in : in STD_LOGIC_VECTOR (31 downto 0);
               pc_data_in : in STD_LOGIC_VECTOR (31 downto 0);
               load_in : in STD_LOGIC;
               pc_in : in STD_LOGIC;
               q_out : out STD_LOGIC_VECTOR (31 downto 0));
end pc_register;

architecture Behavioral of pc_register is

begin
process(clk_in,reset_in)
    begin
        if reset_in = '1' then
            q_out <= x"00000000";
        elsif rising_edge(clk_in) then
            if load_in = '1' then
                q_out <= d_in;
            elsif pc_in = '1' then
                q_out <= pc_data_in;
            end if;
        end if;
    end process;

end Behavioral;
