----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/22/2018 11:19:48 AM
-- Design Name:
-- Module Name: register_file_array_tb - Behavioral
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

entity register_file_array_tb is
--  Port ( );
end register_file_array_tb;

architecture Behavioral of register_file_array_tb is

component register_file_array port(clk_in : in STD_LOGIC;
                                   reset_in : in STD_LOGIC;
                                   reg_write_in : in STD_LOGIC;
                                   counter_bit_in : in STD_LOGIC;
                                   write_register_in : in STD_LOGIC_VECTOR (4 downto 0);
                                   read_register_0_in : in STD_LOGIC_VECTOR (4 downto 0);
                                   read_register_1_in : in STD_LOGIC_VECTOR (4 downto 0);
                                   write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
                                   pc_write_in : in STD_LOGIC;
                                   pc_write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
                                   cpsr_set_bit_in : in STD_LOGIC;
                                   cpsr_cond_bits_alu_in : in STD_LOGIC_VECTOR (3 downto 0);
                                   cpsr_cond_bits_control_out : out STD_LOGIC_VECTOR (3 downto 0);
                                   register_0_out : out STD_LOGIC_VECTOR (31 downto 0);
                                   register_1_out : out STD_LOGIC_VECTOR (31 downto 0)
--                                   reg_31 : out STD_LOGIC_VECTOR (31 downto 0);
--                                   counter : out integer range 0 to 4
                                   );
end component;

signal clk_tb_in : STD_LOGIC;
signal reset_tb_in : STD_LOGIC;
signal reg_write_tb_in : STD_LOGIC;
signal counter_bit_tb_in : STD_LOGIC;
signal write_register_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal read_register_0_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal read_register_1_tb_in : STD_LOGIC_VECTOR (4 downto 0);
signal write_data_tb_in : STD_LOGIC_VECTOR (31 downto 0);
signal pc_write_tb_in : STD_LOGIC;
signal pc_write_data_tb_in : STD_LOGIC_VECTOR (31 downto 0);
signal cpsr_set_bit_tb_in : STD_LOGIC;
signal cpsr_cond_bits_alu_tb_in : STD_LOGIC_VECTOR (3 downto 0);
signal cpsr_cond_bits_control_tb_out : STD_LOGIC_VECTOR (3 downto 0);
signal register_0_tb_out : STD_LOGIC_VECTOR (31 downto 0);
signal register_1_tb_out : STD_LOGIC_VECTOR (31 downto 0);
--signal reg_31_tb : STD_LOGIC_VECTOR (31 downto 0);
--signal counter_tb : integer;

constant clk_period : time := 500ns;

begin
    UUT: register_file_array port map ( clk_in => clk_tb_in,
                                        reset_in => reset_tb_in,
                                        reg_write_in => reg_write_tb_in,
                                        counter_bit_in => counter_bit_tb_in,
                                        write_register_in => write_register_tb_in,
                                        read_register_0_in => read_register_0_tb_in,
                                        read_register_1_in => read_register_1_tb_in,
                                        write_data_in => write_data_tb_in,
                                        pc_write_in => pc_write_tb_in,
                                        pc_write_data_in => pc_write_data_tb_in,
                                        cpsr_set_bit_in => cpsr_set_bit_tb_in,
                                        cpsr_cond_bits_alu_in => cpsr_cond_bits_alu_tb_in,
                                        cpsr_cond_bits_control_out => cpsr_cond_bits_control_tb_out,
                                        register_0_out => register_0_tb_out,
                                        register_1_out => register_1_tb_out
--                                        reg_31 => reg_31_tb,
--                                        counter => counter_tb
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
        wait for 1250 ns;
        -----------------------------------------------
        --------------Random Reads/Writes--------------
        -----------------------------------------------


        -- Write Register: 00001, Write Data: 850CADB5
        -- Read Register 1: 01011, Read Register 2: 11111
--        reset_tb_in <= '0';
--        read_register_0_tb_in <= "01011";
--        read_register_1_tb_in <= "11111";
--        write_register_tb_in <= "00001";
--        write_data_tb_in <= x"850CADB5";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        wait for 50 ns;

-------------------Normal Write Test-------------------

       -- Write Register: 00010, Write Data: 777568F3
       -- Read Register 1: 10101, Read Register 2: 01110
       reset_tb_in <= '0';
       read_register_0_tb_in <= "10101";
       read_register_1_tb_in <= "10100";
       write_register_tb_in <= "10100";
       write_data_tb_in <= x"777568F3";
       reg_write_tb_in <= '1';
       pc_write_tb_in <= '0';
       counter_bit_tb_in <= '0';
       cpsr_set_bit_tb_in <= '0';
       wait for 2500 ns;

       -- Write Register: 00010, Write Data: 777568F3
       -- Read Register 1: 10101, Read Register 2: 01110
       reset_tb_in <= '0';
       read_register_0_tb_in <= "10101";
       read_register_1_tb_in <= "10100";
       write_register_tb_in <= "10100";
       write_data_tb_in <= x"57A5E8B2";
       reg_write_tb_in <= '1';
       pc_write_tb_in <= '0';
       counter_bit_tb_in <= '0';
       cpsr_set_bit_tb_in <= '0';
       wait for 2500 ns;

------------------End Normal Write-------------------

-------------------PC Write Test---------------------

--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_0_tb_in <= "10101";
--        read_register_1_tb_in <= "11111";
--        write_register_tb_in <= "11110";
--        write_data_tb_in <= x"57A5E8B2";
--        reg_write_tb_in <= '0';
--        pc_write_tb_in <= '1';
--        pc_write_data_tb_in <= x"7486AF3D";
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        cpsr_cond_bits_alu_tb_in <= "0000";
--        wait for 50 ns;

--        -- Write Register: 00010, Write Data: 777568F3
--        -- Read Register 1: 10101, Read Register 2: 01110
--        reset_tb_in <= '0';
--        read_register_0_tb_in <= "10101";
--        read_register_1_tb_in <= "11110";
--        write_register_tb_in <= "11111";
--        write_data_tb_in <= x"57A5E8B2";
--        reg_write_tb_in <= '1';
--        pc_write_tb_in <= '0';
--        counter_bit_tb_in <= '0';
--        cpsr_set_bit_tb_in <= '0';
--        cpsr_cond_bits_alu_tb_in <= "0000";
--        wait for 50 ns;

-------------------End PC Write---------------------

------------------CPSR Write Test--------------------

        -- -- Write Register: 00010, Write Data: 777568F3
        -- -- Read Register 1: 10101, Read Register 2: 01110
        -- reset_tb_in <= '0';
        -- read_register_0_tb_in <= "10101";
        -- read_register_1_tb_in <= "11111";
        -- write_register_tb_in <= "11110";
        -- write_data_tb_in <= x"57A5E8B2";
        -- reg_write_tb_in <= '0';
        -- pc_write_tb_in <= '0';
        -- pc_write_data_tb_in <= x"7486AF3D";
        -- counter_bit_tb_in <= '0';
        -- cpsr_set_bit_tb_in <= '1';
        -- cpsr_cond_bits_alu_tb_in <= "1001";
        -- wait for 50 ns;
        --
        -- -- Write Register: 00010, Write Data: 777568F3
        -- -- Read Register 1: 10101, Read Register 2: 01110
        -- reset_tb_in <= '0';
        -- read_register_0_tb_in <= "10101";
        -- read_register_1_tb_in <= "11111";
        -- write_register_tb_in <= "11111";
        -- write_data_tb_in <= x"57A5E8B2";
        -- reg_write_tb_in <= '1';
        -- pc_write_tb_in <= '0';
        -- counter_bit_tb_in <= '0';
        -- cpsr_set_bit_tb_in <= '0';
        -- wait for 50 ns;

    end process;

end Behavioral;
