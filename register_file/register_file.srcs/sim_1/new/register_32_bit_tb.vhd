----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2017 11:05:57 PM
-- Design Name: 
-- Module Name: register_32_bit_tb - Behavioral
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

entity register_32_bit_tb is
--  Port ( );
end register_32_bit_tb;

architecture Behavioral of register_32_bit_tb is

component register_32_bit port( clk_in : in STD_LOGIC;
                                reset_in : in STD_LOGIC;
                                d_in : in STD_LOGIC_VECTOR (31 downto 0);
                                enable_in : in STD_LOGIC;
                                q_out : out STD_LOGIC_VECTOR (31 downto 0));
                                
end component;

signal clk_tb_in : STD_LOGIC; 
signal reset_tb_in : STD_LOGIC; -- reset to 0x00000000
signal d_tb_in : STD_LOGIC_VECTOR(31 downto 0); -- input
signal load_tb_in : STD_LOGIC; -- load/enable
signal q_tb_out : STD_LOGIC_VECTOR(31 downto 0); -- output

constant clk_period : time := 10ns;

begin
    UUT: register_32_bit port map (clk_in => clk_tb_in,
                                   reset_in =>  reset_tb_in,
                                   d_in => d_tb_in,
                                   enable_in => load_tb_in,
                                   q_out => q_tb_out);
                                   
                                   
    clk_proc: process
    begin
        clk_tb_in <= '0';
        wait for clk_period/2;
        clk_tb_in <= '1';
        wait for clk_period/2;
    end process;
    
    stimulus: process
    begin
        -- reset
        reset_tb_in <= '1';
        wait for 20 ns;
        -- write 0x10000000 to register
        reset_tb_in <= '0';
        load_tb_in <= '1';
        d_tb_in <= x"10000000";
        wait for 20 ns;
        -- trying to write 0x00101000
        load_tb_in <= '0';
        d_tb_in <= x"00101000";
        wait for 20 ns;
    end process;

end Behavioral;
