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
--                                 r0_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r1_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r2_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r3_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r4_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r5_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r6_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r7_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r8_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r9_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r10_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r11_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r12_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r13_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r14_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r15_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r16_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r17_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r18_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r19_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r20_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r21_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r22_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r23_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r24_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r25_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r26_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r27_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r28_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                 r29_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r30_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r31_out : out STD_LOGIC_VECTOR (31 downto 0);
                                 r1_enable_out : out STD_LOGIC;
                                 r2_enable_out : out STD_LOGIC;
                                 r21_enable_out : out STD_LOGIC;
                                 r22_enable_out : out STD_LOGIC;
                                 r30_enable_out : out STD_LOGIC;
                                 r31_enable_out : out STD_LOGIC;
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
--signal r0_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r1_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r2_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r3_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r4_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r5_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r6_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r7_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r8_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r9_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r10_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r11_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r12_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r13_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r14_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r15_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r16_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r17_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r18_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r19_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r20_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r21_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r22_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r23_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r24_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r25_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r26_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r27_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r28_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal r29_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r30_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r31_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal r1_enable_tb_out : STD_LOGIC;
signal r2_enable_tb_out : STD_LOGIC;
signal r21_enable_tb_out : STD_LOGIC;
signal r22_enable_tb_out : STD_LOGIC;
signal r30_enable_tb_out : STD_LOGIC;
signal r31_enable_tb_out : STD_LOGIC;

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
--                                     r0_out => r0_tb_out,
                                     r1_out => r1_tb_out,
                                     r2_out => r2_tb_out,
--                                     r3_out => r3_tb_out,
--                                     r4_out => r4_tb_out,
--                                     r5_out => r5_tb_out,
--                                     r6_out => r6_tb_out,
--                                     r7_out => r7_tb_out,
--                                     r8_out => r8_tb_out,
--                                     r9_out => r9_tb_out,
--                                     r10_out => r10_tb_out,
--                                     r11_out => r11_tb_out,
--                                     r12_out => r12_tb_out,
--                                     r13_out => r13_tb_out,
--                                     r14_out => r14_tb_out,
--                                     r15_out => r15_tb_out,
--                                     r16_out => r16_tb_out,
--                                     r17_out => r17_tb_out,
--                                     r18_out => r18_tb_out,
--                                     r19_out => r19_tb_out,
--                                     r20_out => r20_tb_out,
                                     r21_out => r21_tb_out,
                                     r22_out => r22_tb_out,
--                                     r23_out => r23_tb_out,
--                                     r24_out => r24_tb_out,
--                                     r25_out => r25_tb_out,
--                                     r26_out => r26_tb_out,
--                                     r27_out => r27_tb_out,
--                                     r28_out => r28_tb_out,
--                                     r29_out => r29_tb_out,
                                     r30_out => r30_tb_out,
                                     r31_out => r31_tb_out,
                                     r1_enable_out => r1_enable_tb_out,
                                     r2_enable_out => r2_enable_tb_out,
                                     r21_enable_out => r21_enable_tb_out,
                                     r22_enable_out => r22_enable_tb_out,
                                     r30_enable_out => r30_enable_tb_out,
                                     r31_enable_out => r31_enable_tb_out,
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
        
        
        -- Write Register: 00001, Write Data: 850CADB5
        -- Read Register 1: 01011, Read Register 2: 11111
--        reset_tb_in <= '0';
--        read_register_1_tb_in <= "01011";
--        read_register_2_tb_in <= "11111";
--        write_register_tb_in <= "00001";
--        write_data_tb_in <= x"850CADB5";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;
        
-------------------Normal Write Test-------------------       
        
--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_1_tb_in <= "10101";
--        read_register_2_tb_in <= "11111";
--        write_register_tb_in <= "11111";
--        write_data_tb_in <= x"777568F3";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;
        
--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_1_tb_in <= "10101";
--        read_register_2_tb_in <= "11111";
--        write_register_tb_in <= "11111";
--        write_data_tb_in <= x"57A5E8B2";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;

------------------End Normal Write-------------------

-------------------PC Write Test---------------------

--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_1_tb_in <= "10101";
--        read_register_2_tb_in <= "11111";
--        write_register_tb_in <= "11110";
--        write_data_tb_in <= x"57A5E8B2";
--        reg_write_tb_in <= '0';
--        pc_write_tb_in <= '1';
--        pc_write_data_tb_in <= x"7486AF3D";
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;
        
--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_1_tb_in <= "10101";
--        read_register_2_tb_in <= "11111";
--        write_register_tb_in <= "11111";
--        write_data_tb_in <= x"57A5E8B2";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;

-------------------End PC Write---------------------       
 
------------------CPSR Write Test-------------------- 
       
        -- Write Register: 00010, Write Data: 777568F3
        -- Read Register 1: 10101, Read Register 2: 01110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10101";
        read_register_2_tb_in <= "11111";
        write_register_tb_in <= "11110";
        write_data_tb_in <= x"57A5E8B2";
        reg_write_tb_in <= '0';
        pc_write_tb_in <= '0';
        pc_write_data_tb_in <= x"7486AF3D";
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '1';
        cpsr_cond_bits_alu_tb_in <= "1001";
        wait for 50 ns;
        
        -- Write Register: 00010, Write Data: 777568F3
        -- Read Register 1: 10101, Read Register 2: 01110
        reset_tb_in <= '0';
        read_register_1_tb_in <= "10101";
        read_register_2_tb_in <= "11111";
        write_register_tb_in <= "11111";
        write_data_tb_in <= x"57A5E8B2";
        reg_write_tb_in <= '1';
        pc_write_tb_in <= '0';
        counter_bit_tb_in <= '0';
        cpsr_set_bit_tb_in <= '0';
        wait for 50 ns;
       
    end process;

end Behavioral;
