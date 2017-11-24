----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2017 04:38:00 PM
-- Design Name: 
-- Module Name: control_unit_tb - Behavioral
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

entity control_unit_tb is

end control_unit_tb;

architecture Behavioral of control_unit_tb is

component control_unit port(clk_in : in STD_LOGIC;
                           reset_in : in STD_LOGIC;
                           op_code_in : in STD_LOGIC_VECTOR (5 downto 0);
                           reg_write_out : out STD_LOGIC;
                           counter_bit_out : out STD_LOGIC;
                           cpsr_set_bit_out : out STD_LOGIC;
                           alu_src_out : out STD_LOGIC;
                           alu_op_out : out STD_LOGIC_VECTOR (3 downto 0);
                           sub_out : out STD_LOGIC;
                           pc_src_out : out STD_LOGIC;
                           jump_out : out STD_LOGIC;
                           mem_read_out : out STD_LOGIC;
                           mem_write_out : out STD_LOGIC;
                           mem_to_reg_out : out STD_LOGIC;
                           cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
                           counter_bit_in : in STD_LOGIC;
                           cpsr_set_bit_in : in STD_LOGIC;
                           condition_code_in : in STD_LOGIC_VECTOR (3 downto 0);
                           branch_counter_in : in STD_LOGIC);

end component;

signal clk_tb_in : STD_LOGIC := '0';
signal reset_tb_in : STD_LOGIC := '0';
signal op_code_tb_in : STD_LOGIC_VECTOR (5 downto 0);
signal reg_write_tb_out : STD_LOGIC;
signal counter_bit_tb_out : STD_LOGIC;
signal cpsr_set_bit_tb_out : STD_LOGIC;
signal alu_src_tb_out : STD_LOGIC;
signal alu_op_tb_out : STD_LOGIC_VECTOR (3 downto 0);
signal sub_tb_out : STD_LOGIC;
signal pc_src_tb_out : STD_LOGIC;
signal jump_tb_out : STD_LOGIC;
signal mem_read_tb_out : STD_LOGIC;
signal mem_write_tb_out : STD_LOGIC;
signal mem_to_reg_tb_out : STD_LOGIC;
signal cpsr_bits_tb_in : STD_LOGIC_VECTOR (3 downto 0);
signal counter_bit_tb_in : STD_LOGIC;
signal cpsr_set_bit_tb_in : STD_LOGIC;
signal condition_code_tb_in : STD_LOGIC_VECTOR (3 downto 0);
signal branch_counter_tb_in : STD_LOGIC;

constant clk_period : time := 10ns;

begin
    UUT: control_unit port map (clk_in => clk_tb_in,
                                reset_in => reset_tb_in,
                                op_code_in => op_code_tb_in,
                                reg_write_out => reg_write_tb_out,
                                counter_bit_out => counter_bit_tb_out,
                                cpsr_set_bit_out => cpsr_set_bit_tb_out,
                                alu_src_out => alu_src_tb_out,
                                alu_op_out => alu_op_tb_out,
                                sub_out => sub_tb_out,
                                pc_src_out => pc_src_tb_out,
                                jump_out => jump_tb_out,
                                mem_read_out => mem_read_tb_out,
                                mem_write_out => mem_write_tb_out,
                                mem_to_reg_out => mem_to_reg_tb_out,
                                cpsr_bits_in => cpsr_bits_tb_in,
                                counter_bit_in => counter_bit_tb_in,
                                cpsr_set_bit_in => cpsr_set_bit_tb_in,
                                condition_code_in => condition_code_tb_in,
                                branch_counter_in => branch_counter_tb_in
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
        --ADD instruction
        reset_tb_in <= '1';
        wait for 20 ns;
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0000";
        wait for 60 ns;
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0000";
        wait for 60 ns;
    end process;

end Behavioral;
