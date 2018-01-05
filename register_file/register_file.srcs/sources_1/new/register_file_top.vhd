----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 12/02/2017 05:47:02 PM
-- Design Name:
-- Module Name: register_file_top - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_top is
    Port ( clk_in : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           reg_write_in : in STD_LOGIC;
           counter_bit_in : in STD_LOGIC;
           write_register_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_register_1_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_register_2_in : in STD_LOGIC_VECTOR (4 downto 0);
           write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
           -- PC Signals
           pc_write_in : in STD_LOGIC;
           pc_write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
           -- CPSR signals
           cpsr_set_bit_in : in STD_LOGIC;
           cpsr_cond_bits_alu_in : in STD_LOGIC_VECTOR (3 downto 0);
           cpsr_cond_bits_control_out : out STD_LOGIC_VECTOR (3 downto 0);
           -- Register outputs
           register_1_out : out STD_LOGIC_VECTOR (31 downto 0);
           register_2_out : out STD_LOGIC_VECTOR (31 downto 0);
           -- Register Values
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
           r30_enable_out : out STD_LOGIC;
           r31_enable_out : out STD_LOGIC;
           counter : out integer range 0 to 4);
end register_file_top;

architecture Behavioral of register_file_top is

-- Individual output signals for each register to go to the output muxes
signal r0_output : STD_LOGIC_VECTOR(31 downto 0);
signal r1_output : STD_LOGIC_VECTOR(31 downto 0);
signal r2_output : STD_LOGIC_VECTOR(31 downto 0);
signal r3_output : STD_LOGIC_VECTOR(31 downto 0);
signal r4_output : STD_LOGIC_VECTOR(31 downto 0);
signal r5_output : STD_LOGIC_VECTOR(31 downto 0);
signal r6_output : STD_LOGIC_VECTOR(31 downto 0);
signal r7_output : STD_LOGIC_VECTOR(31 downto 0);
signal r8_output : STD_LOGIC_VECTOR(31 downto 0);
signal r9_output : STD_LOGIC_VECTOR(31 downto 0);
signal r10_output : STD_LOGIC_VECTOR(31 downto 0);
signal r11_output : STD_LOGIC_VECTOR(31 downto 0);
signal r12_output : STD_LOGIC_VECTOR(31 downto 0);
signal r13_output : STD_LOGIC_VECTOR(31 downto 0);
signal r14_output : STD_LOGIC_VECTOR(31 downto 0);
signal r15_output : STD_LOGIC_VECTOR(31 downto 0);
signal r16_output : STD_LOGIC_VECTOR(31 downto 0);
signal r17_output : STD_LOGIC_VECTOR(31 downto 0);
signal r18_output : STD_LOGIC_VECTOR(31 downto 0);
signal r19_output : STD_LOGIC_VECTOR(31 downto 0);
signal r20_output : STD_LOGIC_VECTOR(31 downto 0);
signal r21_output : STD_LOGIC_VECTOR(31 downto 0);
signal r22_output : STD_LOGIC_VECTOR(31 downto 0);
signal r23_output : STD_LOGIC_VECTOR(31 downto 0);
signal r24_output : STD_LOGIC_VECTOR(31 downto 0);
signal r25_output : STD_LOGIC_VECTOR(31 downto 0);
signal r26_output : STD_LOGIC_VECTOR(31 downto 0);
signal r27_output : STD_LOGIC_VECTOR(31 downto 0);
signal r28_output : STD_LOGIC_VECTOR(31 downto 0);
signal r29_output : STD_LOGIC_VECTOR(31 downto 0);
signal r30_output : STD_LOGIC_VECTOR(31 downto 0);
signal r31_output : STD_LOGIC_VECTOR(31 downto 0);

signal r0_input : STD_LOGIC;
signal r1_input : STD_LOGIC;
signal r2_input : STD_LOGIC;
signal r3_input : STD_LOGIC;
signal r4_input : STD_LOGIC;
signal r5_input : STD_LOGIC;
signal r6_input : STD_LOGIC;
signal r7_input : STD_LOGIC;
signal r8_input : STD_LOGIC;
signal r9_input : STD_LOGIC;
signal r10_input : STD_LOGIC;
signal r11_input : STD_LOGIC;
signal r12_input : STD_LOGIC;
signal r13_input : STD_LOGIC;
signal r14_input : STD_LOGIC;
signal r15_input : STD_LOGIC;
signal r16_input : STD_LOGIC;
signal r17_input : STD_LOGIC;
signal r18_input : STD_LOGIC;
signal r19_input : STD_LOGIC;
signal r20_input : STD_LOGIC;
signal r21_input : STD_LOGIC;
signal r22_input : STD_LOGIC;
signal r23_input : STD_LOGIC;
signal r24_input : STD_LOGIC;
signal r25_input : STD_LOGIC;
signal r26_input : STD_LOGIC;
signal r27_input : STD_LOGIC;
signal r28_input : STD_LOGIC;
signal r29_input : STD_LOGIC;
signal r30_input : STD_LOGIC;
signal r31_input : STD_LOGIC;

signal clk_counter: integer range 0 to 4 :=0;

-- counter register input signals
signal pos_counter: STD_LOGIC_VECTOR(31 downto 0);
signal neg_counter: STD_LOGIC_VECTOR(31 downto 0);

-- 2's complement pair registers input signals
signal r19_comp_input: STD_LOGIC_VECTOR(31 downto 0);
signal r20_comp_input: STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiating the 32 general purpose registers
    R0 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r0_input,q_out => r0_output);
    R1 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r1_input,q_out => r1_output);
    R2 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r2_input,q_out => r2_output);
    R3 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r3_input,q_out => r3_output);
    R4 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r4_input,q_out => r4_output);
    R5 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r5_input,q_out => r5_output);
    R6 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r6_input,q_out => r6_output);
    R7 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r7_input,q_out => r7_output);
    R8 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r8_input,q_out => r8_output);
    R9 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r9_input,q_out => r9_output);
    R10 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r10_input,q_out => r10_output);
    R11 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r11_input,q_out => r11_output);
    R12 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r12_input,q_out => r12_output);
    R13 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r13_input,q_out => r13_output);
    R14 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r14_input,q_out => r14_output);
    R15 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r15_input,q_out => r15_output);
    R16 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r16_input,q_out => r16_output);
    R17 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r17_input,q_out => r17_output);
    R18 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r18_input,q_out => r18_output);
    R19 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => r19_comp_input,load_in => r19_input,q_out => r19_output);
    R20 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => r20_comp_input,load_in => r20_input,q_out => r20_output);
    R21 : entity work.counter_register port map(clk_in => clk_in,
                                                reset_in => reset_in,
                                                counter_data_in => pos_counter,
                                                d_in => write_data_in,
                                                counter_in => counter_bit_in,
                                                load_in => r21_input,
                                                q_out => r21_output);
    R22 : entity work.counter_register port map(clk_in => clk_in,
                                                reset_in => reset_in,
                                                counter_data_in => neg_counter,
                                                d_in => write_data_in,
                                                counter_in => counter_bit_in,
                                                load_in => r22_input,
                                                q_out => r22_output);
    R23 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r23_input,q_out => r23_output);
    R24 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r24_input,q_out => r24_output);
    R25 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r25_input,q_out => r25_output);
    R26 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r26_input,q_out => r26_output);
    R27 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r27_input,q_out => r27_output);
    R28 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r28_input,q_out => r28_output);
    R29 : entity work.register_32_bit port map(clk_in => clk_in,reset_in => reset_in,d_in => write_data_in,load_in => r29_input,q_out => r29_output);
    R30 : entity work.pc_register port map(clk_in => clk_in,
                                           reset_in => reset_in,
                                           d_in => write_data_in,
                                           pc_data_in => pc_write_data_in,
                                           load_in => r30_input,
                                           pc_in => pc_write_in,
                                           q_out => r30_output);
    R31 : entity work.cpsr_register port map(clk_in => clk_in,
                                             reset_in => reset_in,
                                             d_in => write_data_in,
                                             cpsr_data_in => cpsr_cond_bits_alu_in,
                                             load_in => r31_input,
                                             cpsr_in => cpsr_set_bit_in,
                                             q_out => r31_output);

    --
    clock_counter: process(clk_in,reset_in)
    begin
        if reset_in = '1' then
            clk_counter <= 0;
        elsif rising_edge(clk_in) then
            if clk_counter = 4 then
                counter <= clk_counter;
                clk_counter <= 0;
            else
                clk_counter <= clk_counter + 1;
                counter <= clk_counter;
            end if;
        end if;
    end process;

    -- Process only runs in the second stage
    operand_fetch: process(clk_in,reset_in)
    begin
        if rising_edge(clk_in) then
            
            -- Set the register outputs to the proper ports
            r0_out <= r0_output;
            r1_out <= r1_output;
            r2_out <= r2_output;
            r3_out <= r3_output;
            r4_out <= r4_output;
            r5_out <= r5_output;
            r6_out <= r6_output;
            r7_out <= r7_output;
            r8_out <= r8_output;
            r9_out <= r9_output;
            r10_out <= r10_output;
            r11_out <= r11_output;
            r12_out <= r12_output;
            r13_out <= r13_output;
            r14_out <= r14_output;
            r15_out <= r15_output;
            r16_out <= r16_output;
            r17_out <= r17_output;
            r18_out <= r18_output;
            r19_out <= r19_output;
            r20_out <= r20_output;
            r21_out <= r21_output;
            r22_out <= r22_output;
            r23_out <= r23_output;
            r24_out <= r24_output;
            r25_out <= r25_output;
            r26_out <= r26_output;
            r27_out <= r27_output;
            r28_out <= r28_output;
            r29_out <= r29_output;
            r30_out <= r30_output;
            r31_out <= r31_output;
            
            cpsr_cond_bits_control_out <= r31_output(3 downto 0);
            if clk_counter = 0 and reset_in = '0' then
                 r0_input <= '0';
                 r1_input <= '0';
                 r2_input <= '0';
                 r3_input <= '0';
                 r4_input <= '0';
                 r5_input <= '0';
                 r6_input <= '0';
                 r7_input <= '0';
                 r8_input <= '0';
                 r9_input <= '0';
                 r10_input <= '0';
                 r11_input <= '0';
                 r12_input <= '0';
                 r13_input <= '0';
                 r14_input <= '0';
                 r15_input <= '0';
                 r16_input <= '0';
                 r17_input <= '0';
                 r18_input <= '0';
                 r19_input <= '0';
                 r20_input <= '0';
                 r21_input <= '0';
                 r22_input <= '0';
                 r23_input <= '0';
                 r24_input <= '0';
                 r25_input <= '0';
                 r26_input <= '0';
                 r27_input <= '0';
                 r28_input <= '0';
                 r29_input <= '0';
                 r30_input <= '0';
                 r31_input <= '0';
                 r30_enable_out <= r30_input;
                 r31_enable_out <= r31_input;
            end if;
            if clk_counter = 1 and reset_in = '0' then
                -- Case statement to set register_1_out to the read_register_1
                case read_register_1_in is
                    -- R0 is always 0. Write 0 out when its chosen.
                    when "00000" =>
                        register_1_out <= x"00000000";
                    when "00001" =>
                        register_1_out <= r1_output;
                    when "00010" =>
                        register_1_out <= r2_output;
                    when "00011" =>
                        register_1_out <= r3_output;
                    when "00100" =>
                        register_1_out <= r4_output;
                    when "00101" =>
                        register_1_out <= r5_output;
                    when "00110" =>
                        register_1_out <= r6_output;
                    when "00111" =>
                        register_1_out <= r7_output;
                    when "01000" =>
                        register_1_out <= r8_output;
                    when "01001" =>
                        register_1_out <= r9_output;
                    when "01010" =>
                        register_1_out <= r10_output;
                    when "01011" =>
                        register_1_out <= r11_output;
                    when "01100" =>
                        register_1_out <= r12_output;
                    when "01101" =>
                        register_1_out <= r13_output;
                    when "01110" =>
                        register_1_out <= r14_output;
                    when "01111" =>
                        register_1_out <= r15_output;
                    when "10000" =>
                        register_1_out <= r16_output;
                    when "10001" =>
                        register_1_out <= r17_output;
                    when "10010" =>
                        register_1_out <= r18_output;
                    when "10011" =>
                        register_1_out <= r19_output;
                    when "10100" =>
                        register_1_out <= r20_output;
                    when "10101" =>
                        register_1_out <= r21_output;
                    when "10110" =>
                        register_1_out <= r22_output;
                    when "10111" =>
                        register_1_out <= r23_output;
                    when "11000" =>
                        register_1_out <= r24_output;
                    when "11001" =>
                        register_1_out <= r25_output;
                    when "11010" =>
                        register_1_out <= r26_output;
                    when "11011" =>
                        register_1_out <= r27_output;
                    when "11100" =>
                        register_1_out <= r28_output;
                    when "11101" =>
                        register_1_out <= r29_output;
                    when "11110" =>
                        register_1_out <= r30_output;
                    when "11111" =>
                        register_1_out <= r31_output;
                    when others =>
                        null;
                end case;

                -- Case statement to set register_2_out to the read_register_2
                case read_register_2_in is
                    -- R0 is always 0. Write 0 out when its chosen.
                    when "00000" =>
                        register_2_out <= x"00000000";
                    when "00001" =>
                        register_2_out <= r1_output;
                    when "00010" =>
                        register_2_out <= r2_output;
                    when "00011" =>
                        register_2_out <= r3_output;
                    when "00100" =>
                        register_2_out <= r4_output;
                    when "00101" =>
                        register_2_out <= r5_output;
                    when "00110" =>
                        register_2_out <= r6_output;
                    when "00111" =>
                        register_2_out <= r7_output;
                    when "01000" =>
                        register_2_out <= r8_output;
                    when "01001" =>
                        register_2_out <= r9_output;
                    when "01010" =>
                        register_2_out <= r10_output;
                    when "01011" =>
                        register_2_out <= r11_output;
                    when "01100" =>
                        register_2_out <= r12_output;
                    when "01101" =>
                        register_2_out <= r13_output;
                    when "01110" =>
                        register_2_out <= r14_output;
                    when "01111" =>
                        register_2_out <= r15_output;
                    when "10000" =>
                        register_2_out <= r16_output;
                    when "10001" =>
                        register_2_out <= r17_output;
                    when "10010" =>
                        register_2_out <= r18_output;
                    when "10011" =>
                        register_2_out <= r19_output;
                    when "10100" =>
                        register_2_out <= r20_output;
                    when "10101" =>
                        register_2_out <= r21_output;
                    when "10110" =>
                        register_2_out <= r22_output;
                    when "10111" =>
                        register_2_out <= r23_output;
                    when "11000" =>
                        register_2_out <= r24_output;
                    when "11001" =>
                        register_2_out <= r25_output;
                    when "11010" =>
                        register_2_out <= r26_output;
                    when "11011" =>
                        register_2_out <= r27_output;
                    when "11100" =>
                        register_2_out <= r28_output;
                    when "11101" =>
                        register_2_out <= r29_output;
                    when "11110" =>
                        register_2_out <= r30_output;
                    when "11111" =>
                        register_2_out <= r31_output;
                    when others =>
                        null;
                end case;
            end if;
            -- Increment/Decrement counter if bit is set
            if clk_counter = 3 and reset_in = '0' then
                if counter_bit_in = '1' then
                    pos_counter <= r21_output + x"00000001";
                    neg_counter <= r22_output - x"00000001";
                end if;
            end if;
            
            -- Writing data to proper register
            -- Driving 2's complement pair
            if clk_counter = 4 and reset_in = '0' then
                --if reg_write_in = '1' then
                    case write_register_in is
                        when "00000" =>
                            r0_input <= reg_write_in;
                        when "00001" =>
                            r1_input <= reg_write_in;
                        when "00010" =>
                            r2_input <= reg_write_in;
                        when "00011" =>
                            r3_input <= reg_write_in;
                        when "00100" =>
                            r4_input <= reg_write_in;
                        when "00101" =>
                            r5_input <= reg_write_in;
                        when "00110" =>
                            r6_input <= reg_write_in;
                        when "00111" =>
                            r7_input <= reg_write_in;
                        when "01000" =>
                            r8_input <= reg_write_in;
                        when "01001" =>
                            r9_input <= reg_write_in;
                        when "01010" =>
                            r10_input <= reg_write_in;
                        when "01011" =>
                            r11_input <= reg_write_in;
                        when "01100" =>
                            r12_input <= reg_write_in;
                        when "01101" =>
                            r13_input <= reg_write_in;
                        when "01110" =>
                            r14_input <= reg_write_in;
                        when "01111" =>
                            r15_input <= reg_write_in;
                        when "10000" =>
                            r16_input <= reg_write_in;
                        when "10001" =>
                            r17_input <= reg_write_in;
                        when "10010" =>
                            r18_input <= reg_write_in;
                        when "10011" =>
                            r19_input <= reg_write_in;
                            r19_comp_input <= write_data_in;
                            r20_comp_input <= (not write_data_in) + x"00000001";
                        when "10100" =>
                            r20_input <= reg_write_in;
                            r20_comp_input <= write_data_in;
                            r19_comp_input <= (not write_data_in) + x"00000001";
                        when "10101" =>
                            r21_input <= reg_write_in;
                        when "10110" =>
                            r22_input <= reg_write_in;
                        when "10111" =>
                            r23_input <= reg_write_in;
                        when "11000" =>
                            r24_input <= reg_write_in;
                        when "11001" =>
                            r25_input <= reg_write_in;
                        when "11010" =>
                            r26_input <= reg_write_in;
                        when "11011" =>
                            r27_input <= reg_write_in;
                        when "11100" =>
                            r28_input <= reg_write_in;
                        when "11101" =>
                            r29_input <= reg_write_in;
                        when "11110" =>
                            r30_input <= reg_write_in;
                        when "11111" =>
                            r31_input <= reg_write_in;
                        when others =>
                            null;
                    end case;
               -- end if;
            end if;
        end if;
    end process;

end Behavioral;
