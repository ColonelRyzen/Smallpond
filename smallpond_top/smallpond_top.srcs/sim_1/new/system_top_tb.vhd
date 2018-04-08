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

entity system_top_tb is
--  Port ( );
end system_top_tb;

architecture Behavioral of system_top_tb is

    component system_top port(   clk_100 : in STD_LOGIC;
                                    reset_in : in STD_LOGIC;
                                    led : out STD_LOGIC_VECTOR(15 downto 0);
                                    sw : in STD_LOGIC_VECTOR(15 downto 0)
                                    );
    end component;

    signal clk_tb_in : STD_LOGIC := '0';
    signal reset_tb_in : STD_LOGIC := '0';
    signal led_tb : STD_LOGIC_VECTOR(15 downto 0);
    signal sw_tb : STD_LOGIC_VECTOR(15 downto 0);

    constant clk_period : time := 10 ns;
begin

    UUT: system_top port map (   clk_100 => clk_tb_in,
                                    reset_in => reset_tb_in,
                                    led => led_tb,
                                    sw => sw_tb
                                    );

    clk_proc: process
    begin
        clk_tb_in <= '0';
        wait for clk_period/2;
        clk_tb_in <= '1';
        wait for clk_period/2;
    end process;





end Behavioral;
