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
                           pc_write_out : out STD_LOGIC;
                           pc_src_out : out STD_LOGIC;
                           jump_out : out STD_LOGIC;
                           mem_read_out : out STD_LOGIC;
                           mem_write_out : out STD_LOGIC;
                           mem_to_reg_out : out STD_LOGIC;
                           cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
                           counter_bit_in : in STD_LOGIC;
                           cpsr_set_bit_in : in STD_LOGIC;
                           condition_code_in : in STD_LOGIC_VECTOR (3 downto 0);
                           --branch_counter_in : in STD_LOGIC;
                           counter : out integer);

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
signal pc_write_tb_out : STD_LOGIC;
signal pc_src_tb_out : STD_LOGIC;
signal jump_tb_out : STD_LOGIC;
signal mem_read_tb_out : STD_LOGIC;
signal mem_write_tb_out : STD_LOGIC;
signal mem_to_reg_tb_out : STD_LOGIC;
signal cpsr_bits_tb_in : STD_LOGIC_VECTOR (3 downto 0);
signal counter_bit_tb_in : STD_LOGIC;
signal cpsr_set_bit_tb_in : STD_LOGIC;
signal condition_code_tb_in : STD_LOGIC_VECTOR (3 downto 0);
--signal branch_counter_tb_in : STD_LOGIC;
signal counter_tb : integer;

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
                                pc_write_out => pc_write_tb_out,
                                pc_src_out => pc_src_tb_out,
                                jump_out => jump_tb_out,
                                mem_read_out => mem_read_tb_out,
                                mem_write_out => mem_write_tb_out,
                                mem_to_reg_out => mem_to_reg_tb_out,
                                cpsr_bits_in => cpsr_bits_tb_in,
                                counter_bit_in => counter_bit_tb_in,
                                cpsr_set_bit_in => cpsr_set_bit_tb_in,
                                condition_code_in => condition_code_tb_in,
                                --branch_counter_in => branch_counter_tb_in,
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
        --ADD instruction
        reset_tb_in <= '1';
        wait for 25 ns;
        --ADD, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ADD, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ADD, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --AND, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --AND, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --ASR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --ASR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSL, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSL, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --LSR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --LSR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000101";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NAND, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NAND, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000110";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "000111";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --NOT, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --NOT, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001000";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --OR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --OR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001001";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --SUB, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --SUB, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001010";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XNOR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XNOR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001011";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: AL, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: AL, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: AL, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: EQ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: EQ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: EQ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: NE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: NE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: NE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: CA, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: CA, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: CA, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: CC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: CC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: CC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: NG, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: NG, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: NG, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: PZ, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: PZ, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: PZ, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: VS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: VS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: VS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: VC, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: VC, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: VC, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: HI, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: HI, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: HI, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LS, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LS, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LS, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: GE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: GE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: GE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: GT, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: GT, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: GT, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LE, TRUE, Count: 0, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LE, FALSE, Count: 0, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        --XOR, Cond: LE, TRUE, Count: 1, CPSR_set: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        --XOR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "001100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        cpsr_set_bit_tb_in <= '1';
        wait for 50 ns;

        -----------------------------------------------
        --------------I Type Instructions--------------
        -----------------------------------------------

        --ADDI
        reset_tb_in <= '0';
        op_code_tb_in <= "011000";
        wait for 50 ns;

        --ANDI
        reset_tb_in <= '0';
        op_code_tb_in <= "011001";
        wait for 50 ns;

        --ASRI
        reset_tb_in <= '0';
        op_code_tb_in <= "011010";
        wait for 50 ns;

        --LDR
        reset_tb_in <= '0';
        op_code_tb_in <= "011011";
        wait for 50 ns;

        --LDRB
        reset_tb_in <= '0';
        op_code_tb_in <= "011100";
        wait for 50 ns;

        --LDRBU
        reset_tb_in <= '0';
        op_code_tb_in <= "011101";
        wait for 50 ns;

        --LDRH
        reset_tb_in <= '0';
        op_code_tb_in <= "011110";
        wait for 50 ns;

        --LDRHU
        reset_tb_in <= '0';
        op_code_tb_in <= "011111";
        wait for 50 ns;

        --LSLI
        reset_tb_in <= '0';
        op_code_tb_in <= "100000";
        wait for 50 ns;

        --LSRI
        reset_tb_in <= '0';
        op_code_tb_in <= "100001";
        wait for 50 ns;

        --LUI
        reset_tb_in <= '0';
        op_code_tb_in <= "100010";
        wait for 50 ns;

        --NANDI
        reset_tb_in <= '0';
        op_code_tb_in <= "100011";
        wait for 50 ns;

        --NORI
        reset_tb_in <= '0';
        op_code_tb_in <= "100100";
        wait for 50 ns;

        --ORI
        reset_tb_in <= '0';
        op_code_tb_in <= "100101";
        wait for 50 ns;

        --STR
        reset_tb_in <= '0';
        op_code_tb_in <= "100110";
        wait for 50 ns;

        --STRB
        reset_tb_in <= '0';
        op_code_tb_in <= "100111";
        wait for 50 ns;

        --STRH
        reset_tb_in <= '0';
        op_code_tb_in <= "101000";
        wait for 50 ns;

        --SUBI
        reset_tb_in <= '0';
        op_code_tb_in <= "101001";
        wait for 50 ns;

        --XNORI
        reset_tb_in <= '0';
        op_code_tb_in <= "101010";
        wait for 50 ns;

        --XORI
        reset_tb_in <= '0';
        op_code_tb_in <= "101011";
        wait for 50 ns;

        -----------------------------------------------
        --------------J Type Instructions--------------
        -----------------------------------------------

        --J
        reset_tb_in <= '0';
        op_code_tb_in <= "111111";
        wait for 50 ns;

        -----------------------------------------------
        --------------B Type Instructions--------------
        -----------------------------------------------

        --B, Cond: AL, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: EQ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: NE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: CA, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: CC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: NG, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: PZ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: VS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "0111";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: VC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: HI, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: LS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: GE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: LT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: GT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --B, Cond: LE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --B, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111100";
        condition_code_tb_in <= "1110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: AL, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: EQ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: NE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: CA, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: CC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: NG, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: PZ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: VS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "0111";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: VC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: HI, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: LS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: GE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: LT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: GT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BL, Cond: LE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "1001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BL, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111101";
        condition_code_tb_in <= "1110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: AL, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0000";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: AL, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: EQ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0001";
        cpsr_bits_tb_in <= "0100";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: EQ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: NE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0010";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: NE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: CA, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0011";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: CA, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: CC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0100";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: CC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: NG, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0101";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: NG, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: PZ, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: PZ, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: VS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0111";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: VS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "0111";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: VC, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1000";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: VC, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1000";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: HI, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1001";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: HI, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1001";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: LS, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1010";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: LS, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1010";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: GE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1011";
        cpsr_bits_tb_in <= "1000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: GE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1011";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: LT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1100";
        cpsr_bits_tb_in <= "0010";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: LT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1100";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: GT, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1101";
        cpsr_bits_tb_in <= "0001";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: GT, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1101";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

        --BR, Cond: LE, TRUE, Count: 0
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1110";
        cpsr_bits_tb_in <= "0000";
        counter_bit_tb_in <= '0';
        wait for 50 ns;

        --BR, Cond: LE, FALSE, Count: 1, CPSR_set: 1
        reset_tb_in <= '0';
        op_code_tb_in <= "111110";
        condition_code_tb_in <= "1110";
        counter_bit_tb_in <= '1';
        wait for 50 ns;

    end process;

end Behavioral;
