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
                                    reset_in : in STD_LOGIC;
                                    memory_data_in : in STD_LOGIC_VECTOR(31 downto 0);
                                    memory_read_out : out STD_LOGIC;
                                    memory_write_out : out STD_LOGIC;
                                    memory_address_out : out STD_LOGIC_VECTOR(31 downto 0)
                                    );
    end component;

    signal clk_tb_in : STD_LOGIC := '0';
    signal reset_tb_in : STD_LOGIC := '0';
    signal memory_data_tb_in : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal memory_read_tb_out : STD_LOGIC := '0';
    signal memory_write_tb_out : STD_LOGIC := '0';
    signal memory_address_tb_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

    constant clk_period : time := 10 ns;
begin

    UUT: smallpond_top port map (   clk_in => clk_tb_in,
                                    reset_in => reset_tb_in,
                                    memory_data_in => memory_data_tb_in,
                                    memory_read_out => memory_read_tb_out,
                                    memory_write_out => memory_write_tb_out,
                                    memory_address_out => memory_address_tb_out
                                    );

    clk_proc: process
    begin
        clk_tb_in <= '0';
        wait for clk_period/2;
        clk_tb_in <= '1';
        wait for clk_period/2;
    end process;
    
    stimulus : process
    begin
    
    reset_tb_in <= '1';
    wait for 250 ns;
    
    -- ADDI r1, r1, 4
    reset_tb_in <= '0';
--    memory_data_tb_in <= "01100000001000010000000000000100";
--    memory_data_tb_in <= "10011000011000110000000000000000";        -- STR
    memory_data_tb_in <= "10010100001000010000000000000100";          -- ORI
    wait for 3000 ns;
    
    -- ADDI r2, r1, 4
    memory_data_tb_in <= "01100000010000010000000000000100";
    wait for 3000 ns;
    
    -- ADD r3, r2, r1
    memory_data_tb_in <= "00000100011000100000100000000000";
    wait for 3000 ns;
    
    end process;


end Behavioral;
