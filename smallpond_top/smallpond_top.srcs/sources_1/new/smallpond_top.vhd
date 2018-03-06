----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Zachary Salim
-- 
-- Create Date: 03/01/2018 11:42:16 AM
-- Design Name: 
-- Module Name: smallpond_top - Behavioral
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

entity smallpond_top is
  Port (clk_in : in STD_LOGIC;
        reset_in : in STD_LOGIC );
end smallpond_top;

architecture Behavioral of smallpond_top is

signal cpu_clk : STD_LOGIC := '0';
----CONTROL UNIT SIGNALS
--signal ctrl_reg_write_out : STD_LOGIC := '0';
--signal ctrl_counter_bit_out : STD_LOGIC := '0';
--signal ctrl_cpsr_set_bit_out : STD_LOGIC := '0';
--signal ctrl_alu_src_out : STD_LOGIC := '0';
--signal ctrl_sub_out : STD_LOGIC := '0';
--signal ctrl_pc_write_out : STD_LOGIC := '0';
--signal ctrl_src_out : STD_LOGIC := '0';
--signal ctrl_jum_out : STD_LOGIC := '0';
--signal ctrl_mem_read_out : STD_LOGIC := '0';
--signal ctrl_mem_write_out : STD_LOGIC := '0';
--signal ctrl_mem_to_reg_out : STD_LOGIC := '0';

----REGISTER FILE SIGNALS
--signal reg_pc_data_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--signal reg_cpsr_cond_bits_control_out : STD_LOGIC_VECTOR (3 downto 0) := "0000";
--signal 

----ALU SIGNALS
--signal alu_result_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--signal alu_cpsr_out : STD_LOGIC_VECTOR(3 downto 0) := "0000";
--signal alu_a_input : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--signal alu_b_input : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--signal alu_op_in : STD_LOGIC_VECTOR(3 downto 0) := x"00000000";
--signal alu_sub : STD_LOGIC := '0';


begin
    main_clk : process(clk_in)
    variable clk_counter : integer := 0;
    begin
        if rising_edge(clk_in) then
            if clk_counter = 500 then
                clk_counter := 0;
                cpu_clk <= not cpu_clk;
            else
                clk_counter := clk_counter + 1;
            end if;
        end if;
    end process;
    
    
    


end Behavioral;
