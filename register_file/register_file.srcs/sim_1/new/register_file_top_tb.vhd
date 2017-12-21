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
                                 -- Register Outputs
                                 r0_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r1_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r2_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r3_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r4_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r5_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r6_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r7_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r8_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r9_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r10_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r11_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r12_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r13_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r14_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r15_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r16_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r17_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r18_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r19_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r20_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r21_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r22_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r23_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r24_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r25_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r26_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r27_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r28_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r29_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r30_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r31_out : out STD_LOGIC_VECTOR (31 downto 0);
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
-- Register outputs
signal r0_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r1_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r2_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r3_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r4_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r5_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r6_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r7_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r8_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r9_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r10_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r11_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r12_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r13_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r14_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r15_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r16_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r17_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r18_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r19_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r20_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r21_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r22_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r23_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r24_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r25_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r26_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r27_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r28_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r29_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r30_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r31_tb_out : STD_LOGIC_VECTOR (31 downto 0);

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
                                     r0_out => r0_tb_out,
                                     r1_out => r1_tb_out,
                                     r2_out => r2_tb_out,
                                     r3_out => r3_tb_out,
                                     r4_out => r4_tb_out,
                                     r5_out => r5_tb_out,
                                     r6_out => r6_tb_out,
                                     r7_out => r7_tb_out,
                                     r8_out => r8_tb_out,
                                     r9_out => r9_tb_out,
                                     r10_out => r10_tb_out,
                                     r11_out => r11_tb_out,
                                     r12_out => r12_tb_out,
                                     r13_out => r13_tb_out,
                                     r14_out => r14_tb_out,
                                     r15_out => r15_tb_out,
                                     r16_out => r16_tb_out,
                                     r17_out => r17_tb_out,
                                     r18_out => r18_tb_out,
                                     r19_out => r19_tb_out,
                                     r20_out => r20_tb_out,
                                     r21_out => r21_tb_out,
                                     r22_out => r22_tb_out,
                                     r23_out => r23_tb_out,
                                     r24_out => r24_tb_out,
                                     r25_out => r25_tb_out,
                                     r26_out => r26_tb_out,
                                     r27_out => r27_tb_out,
                                     r28_out => r28_tb_out,
                                     r29_out => r29_tb_out,
                                     r30_out => r30_tb_out,
                                     r31_out => r31_tb_out,
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
        reset_tb_in <= '1';
        wait for 25 ns;
        
       -----------------------------------------------
        --------------Random Reads/Writes--------------
        -----------------------------------------------
        
        -- Write Register: 00000, Write Data: 8C08161B
        -- Read Register 1: 10000, Read Register 2: 01001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10000";
        read_register_2_tb_in <= "01001";
        write_register_tb_in <= "00000";
        write_data_tb_in <= x"8C08161B";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00001, Write Data: 850CADB5
        -- Read Register 1: 01011, Read Register 2: 11111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01011";
        read_register_2_tb_in <= "11111";
        write_register_tb_in <= "00001";
        write_data_tb_in <= x"850CADB5";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00010, Write Data: 777568F3
        -- Read Register 1: 10101, Read Register 2: 01110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10101";
        read_register_2_tb_in <= "01110";
        write_register_tb_in <= "00010";
        write_data_tb_in <= x"777568F3";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00011, Write Data: 39A317DD
        -- Read Register 1: 11100, Read Register 2: 01000
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11100";
        read_register_2_tb_in <= "01000";
        write_register_tb_in <= "00011";
        write_data_tb_in <= x"39A317DD";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00100, Write Data: AAD32406
        -- Read Register 1: 10011, Read Register 2: 11011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10011";
        read_register_2_tb_in <= "11011";
        write_register_tb_in <= "00100";
        write_data_tb_in <= x"AAD32406";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00101, Write Data: 3287C3E3
        -- Read Register 1: 01100, Read Register 2: 10110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01100";
        read_register_2_tb_in <= "10110";
        write_register_tb_in <= "00101";
        write_data_tb_in <= x"3287C3E3";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00110, Write Data: C51BAA00
        -- Read Register 1: 10000, Read Register 2: 11100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10000";
        read_register_2_tb_in <= "11100";
        write_register_tb_in <= "00110";
        write_data_tb_in <= x"C51BAA00";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 00111, Write Data: 9DF041DD
        -- Read Register 1: 00111, Read Register 2: 01001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00111";
        read_register_2_tb_in <= "01001";
        write_register_tb_in <= "00111";
        write_data_tb_in <= x"9DF041DD";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01000, Write Data: 7FCFA0C1
        -- Read Register 1: 00110, Read Register 2: 10110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00110";
        read_register_2_tb_in <= "10110";
        write_register_tb_in <= "01000";
        write_data_tb_in <= x"7FCFA0C1";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01001, Write Data: 4F401B3F
        -- Read Register 1: 11011, Read Register 2: 01011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11011";
        read_register_2_tb_in <= "01011";
        write_register_tb_in <= "01001";
        write_data_tb_in <= x"4F401B3F";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01010, Write Data: 2229B0FE
        -- Read Register 1: 00110, Read Register 2: 00010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00110";
        read_register_2_tb_in <= "00010";
        write_register_tb_in <= "01010";
        write_data_tb_in <= x"2229B0FE";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01011, Write Data: 945F41C7
        -- Read Register 1: 00110, Read Register 2: 01101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00110";
        read_register_2_tb_in <= "01101";
        write_register_tb_in <= "01011";
        write_data_tb_in <= x"945F41C7";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01100, Write Data: 5BD48FAA
        -- Read Register 1: 01010, Read Register 2: 00001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01010";
        read_register_2_tb_in <= "00001";
        write_register_tb_in <= "01100";
        write_data_tb_in <= x"5BD48FAA";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01101, Write Data: 990555FC
        -- Read Register 1: 10010, Read Register 2: 10000
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10010";
        read_register_2_tb_in <= "10000";
        write_register_tb_in <= "01101";
        write_data_tb_in <= x"990555FC";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01110, Write Data: 539DD66D
        -- Read Register 1: 01000, Read Register 2: 01001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01000";
        read_register_2_tb_in <= "01001";
        write_register_tb_in <= "01110";
        write_data_tb_in <= x"539DD66D";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 01111, Write Data: 70418791
        -- Read Register 1: 01101, Read Register 2: 00110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01101";
        read_register_2_tb_in <= "00110";
        write_register_tb_in <= "01111";
        write_data_tb_in <= x"70418791";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10000, Write Data: 4F6B50FC
        -- Read Register 1: 10100, Read Register 2: 00010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10100";
        read_register_2_tb_in <= "00010";
        write_register_tb_in <= "10000";
        write_data_tb_in <= x"4F6B50FC";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10001, Write Data: 9C3343E6
        -- Read Register 1: 01010, Read Register 2: 11100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01010";
        read_register_2_tb_in <= "11100";
        write_register_tb_in <= "10001";
        write_data_tb_in <= x"9C3343E6";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10010, Write Data: 7460C41A
        -- Read Register 1: 10111, Read Register 2: 10011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10111";
        read_register_2_tb_in <= "10011";
        write_register_tb_in <= "10010";
        write_data_tb_in <= x"7460C41A";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10011, Write Data: 679B6A17
        -- Read Register 1: 11010, Read Register 2: 00100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11010";
        read_register_2_tb_in <= "00100";
        write_register_tb_in <= "10011";
        write_data_tb_in <= x"679B6A17";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10100, Write Data: DDB87E93
        -- Read Register 1: 11110, Read Register 2: 11100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11110";
        read_register_2_tb_in <= "11100";
        write_register_tb_in <= "10100";
        write_data_tb_in <= x"DDB87E93";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10101, Write Data: 65D40C1E
        -- Read Register 1: 00001, Read Register 2: 11000
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00001";
        read_register_2_tb_in <= "11000";
        write_register_tb_in <= "10101";
        write_data_tb_in <= x"65D40C1E";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10110, Write Data: 3E576B45
        -- Read Register 1: 01010, Read Register 2: 01001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01010";
        read_register_2_tb_in <= "01001";
        write_register_tb_in <= "10110";
        write_data_tb_in <= x"3E576B45";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 10111, Write Data: B1B8D37E
        -- Read Register 1: 00001, Read Register 2: 01110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00001";
        read_register_2_tb_in <= "01110";
        write_register_tb_in <= "10111";
        write_data_tb_in <= x"B1B8D37E";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11000, Write Data: F82270B5
        -- Read Register 1: 10111, Read Register 2: 10101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10111";
        read_register_2_tb_in <= "10101";
        write_register_tb_in <= "11000";
        write_data_tb_in <= x"F82270B5";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11001, Write Data: 90F30FB4
        -- Read Register 1: 11110, Read Register 2: 00110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11110";
        read_register_2_tb_in <= "00110";
        write_register_tb_in <= "11001";
        write_data_tb_in <= x"90F30FB4";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11010, Write Data: FE508C5B
        -- Read Register 1: 00101, Read Register 2: 11010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00101";
        read_register_2_tb_in <= "11010";
        write_register_tb_in <= "11010";
        write_data_tb_in <= x"FE508C5B";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11011, Write Data: E107A32A
        -- Read Register 1: 01010, Read Register 2: 10110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01010";
        read_register_2_tb_in <= "10110";
        write_register_tb_in <= "11011";
        write_data_tb_in <= x"E107A32A";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11100, Write Data: B6D7BFEB
        -- Read Register 1: 10101, Read Register 2: 11010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10101";
        read_register_2_tb_in <= "11010";
        write_register_tb_in <= "11100";
        write_data_tb_in <= x"B6D7BFEB";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11101, Write Data: 64BDF746
        -- Read Register 1: 10111, Read Register 2: 10110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10111";
        read_register_2_tb_in <= "10110";
        write_register_tb_in <= "11101";
        write_data_tb_in <= x"64BDF746";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11110, Write Data: D3F562C5
        -- Read Register 1: 00000, Read Register 2: 00100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00000";
        read_register_2_tb_in <= "00100";
        write_register_tb_in <= "11110";
        write_data_tb_in <= x"D3F562C5";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Write Register: 11111, Write Data: 556E151C
        -- Read Register 1: 00101, Read Register 2: 01011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00101";
        read_register_2_tb_in <= "01011";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"556E151C";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -----------------------------------------------
        --------------Extra Reads--------------
        -----------------------------------------------
        
        -- Read Register 1: 10000, Read Register 2: 00100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10000";
        read_register_2_tb_in <= "00100";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 01101, Read Register 2: 11101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01101";
        read_register_2_tb_in <= "11101";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00100, Read Register 2: 11001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00100";
        read_register_2_tb_in <= "11001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10110, Read Register 2: 10010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10110";
        read_register_2_tb_in <= "10010";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10111, Read Register 2: 10110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10111";
        read_register_2_tb_in <= "10110";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11111, Read Register 2: 00100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11111";
        read_register_2_tb_in <= "00100";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11000, Read Register 2: 11001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11000";
        read_register_2_tb_in <= "11001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10111, Read Register 2: 00001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10111";
        read_register_2_tb_in <= "00001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11101, Read Register 2: 10010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11101";
        read_register_2_tb_in <= "10010";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00010, Read Register 2: 01111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00010";
        read_register_2_tb_in <= "01111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11011, Read Register 2: 10111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11011";
        read_register_2_tb_in <= "10111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00101, Read Register 2: 01101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00101";
        read_register_2_tb_in <= "01101";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 01101, Read Register 2: 01101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "01101";
        read_register_2_tb_in <= "01101";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00001, Read Register 2: 00111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00001";
        read_register_2_tb_in <= "00111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10000, Read Register 2: 11011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10000";
        read_register_2_tb_in <= "11011";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10001, Read Register 2: 10001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10001";
        read_register_2_tb_in <= "10001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00110, Read Register 2: 00000
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00110";
        read_register_2_tb_in <= "00000";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11111, Read Register 2: 11111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11111";
        read_register_2_tb_in <= "11111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00011, Read Register 2: 10011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00011";
        read_register_2_tb_in <= "10011";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00010, Read Register 2: 01010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00010";
        read_register_2_tb_in <= "01010";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00011, Read Register 2: 10101
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00011";
        read_register_2_tb_in <= "10101";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11001, Read Register 2: 11111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11001";
        read_register_2_tb_in <= "11111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10100, Read Register 2: 10001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10100";
        read_register_2_tb_in <= "10001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11111, Read Register 2: 00010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11111";
        read_register_2_tb_in <= "00010";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00101, Read Register 2: 01111
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00101";
        read_register_2_tb_in <= "01111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11011, Read Register 2: 01100
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11011";
        read_register_2_tb_in <= "01100";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10101, Read Register 2: 11011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10101";
        read_register_2_tb_in <= "11011";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00111, Read Register 2: 11000
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00111";
        read_register_2_tb_in <= "11000";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 10011, Read Register 2: 00010
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10011";
        read_register_2_tb_in <= "00010";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00111, Read Register 2: 01011
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00111";
        read_register_2_tb_in <= "01011";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 11011, Read Register 2: 00110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "11011";
        read_register_2_tb_in <= "00110";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
        
        -- Read Register 1: 00100, Read Register 2: 11001
        reset_tb_in <= '0';
        read_register_1_tb_in <= "00100";
        read_register_2_tb_in <= "11001";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"00000000";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;

        
    end process;

end Behavioral;
