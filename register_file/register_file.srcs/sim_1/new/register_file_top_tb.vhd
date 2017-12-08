----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2017 04:21:50 PM
-- Design Name: 
-- Module Name: register_file_top_tb - Behavioral
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

entity register_file_top_tb is
--  Port ( );
end register_file_top_tb;

architecture Behavioral of register_file_top_tb is

component register_file_top port(clk_in : in STD_LOGIC;
                                 reset_in : in STD_LOGIC;
                                 reg_write_in : in STD_LOGIC;
                                 counter_bit_in : in STD_LOGIC;
                                 write_register_in : in STD_LOGIC_VECTOR (4 downto 0);
                                 read_register_1_in : in STD_LOGIC_VECTOR (4 downto 0);
                                 read_register_2_in : in STD_LOGIC_VECTOR (4 downto 0);
                                 write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
                                 -- PC Signals
                                 pc_write_in : in STD_LOGIC;
                                 pc_write_data_in : in STD_LOGIC_VECTOR(31 downto 0);
                                 -- CPSR signals
                                 cpsr_set_bit_in : in STD_LOGIC;
                                 cpsr_cond_bits_alu_in : in STD_LOGIC_VECTOR(3 downto 0);
                                 cpsr_cond_bits_control_out : out STD_LOGIC_VECTOR (3 downto 0);
                                 -- Register outputs
                                 register_1_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 register_2_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 counter : out integer
                                 );
end component;

signal clk_tb_in : STD_LOGIC;
signal reset_tb_in : STD_LOGIC;
signal reg_write_tb_in : STD_LOGIC;
signal counter_bit_tb_in : STD_LOGIC;
signal write_register_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal read_register_1_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal read_register_2_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal write_data_tb_in : STD_LOGIC_VECTOR (31 downto 0);
-- PC Signals
signal pc_write_tb_in : STD_LOGIC;
signal pc_write_data_tb_in : STD_LOGIC_VECTOR(31 downto 0);
-- CPSR signals
signal cpsr_set_bit_tb_in : STD_LOGIC;
signal cpsr_cond_bits_alu_tb_in : STD_LOGIC_VECTOR(3 downto 0);
signal cpsr_cond_bits_control_tb_out : STD_LOGIC_VECTOR (3 downto 0);
-- Register outputs
signal register_1_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal register_2_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal counter_tb : integer;

constant clk_period : time := 10ns;

begin
    UUT: register_file_top port map (clk_in => clk_tb_in,
                                     reset_in => reset_tb_in,
                                     reg_write_in => reg_write_tb_in,
                                     counter_bit_in => counter_bit_tb_in,
                                     write_register_in => write_register_tb_in,
                                     read_register_1_in => read_register_1_tb_in,
                                     read_register_2_in => read_register_2_tb_in,
                                     write_data_in => write_data_tb_in,
                                     pc_write_in => pc_write_tb_in,
                                     pc_write_data_in => pc_write_data_tb_in,
                                     cpsr_set_bit_in => cpsr_set_bit_tb_in,
                                     cpsr_cond_bits_alu_in => cpsr_cond_bits_alu_tb_in,
                                     cpsr_cond_bits_control_out => cpsr_cond_bits_control_tb_out,
                                     register_1_out => register_1_tb_out,
                                     register_2_out => register_2_tb_out,
                                     counter => counter_tb
                                     );

    clk_proc: process
    begin
        clk_tb_in <= '0';
        wait for clk_period/2;
        clk_tb_in <= '1';
        wait for clk_period/2;
    end process;
    
    stimulus: process
    begin
        
    end process;

end Behavioral;
