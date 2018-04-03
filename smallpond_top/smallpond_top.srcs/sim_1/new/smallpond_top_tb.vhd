----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/23/2018 08:30:29 PM
-- Design Name:
-- Module Name: smallpond_top_tb - Behavioral
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

entity smallpond_top_tb is
--  Port ( );
end smallpond_top_tb;

architecture Behavioral of smallpond_top_tb is

    component smallpond_top port(   clk_in : in STD_LOGIC;
                                    reset_in : in STD_LOGIC
                                    );
    end component;

    signal clk_tb_in : STD_LOGIC := '0';
    signal reset_tb_in : STD_LOGIC := '0';

    constant clk_period : time := 10 ns;
begin

    UUT: smallpond_top port map (   clk_in => clk_tb_in,
                                    reset_in => reset_tb_in
                                    );

    clk_proc: process
    begin
        clk_tb_in <= '0';
        wait for clk_period/2;
        clk_tb_in <= '1';
        wait for clk_period/2;
    end process;





end Behavioral;
