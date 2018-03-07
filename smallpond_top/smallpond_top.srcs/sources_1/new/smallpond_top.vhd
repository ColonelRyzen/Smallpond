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

component ALU port (clk_in : in STD_LOGIC;
                    reset_in : in STD_LOGIC;
                    --Inputs
                    a, b	: in STD_LOGIC_VECTOR(31 downto 0);		-- 2 inputs 32-bit
                    ALU_OP	: in STD_LOGIC_VECTOR(3 downto 0);      -- 1 input 4-bit for selecting function
                    SUB		: in std_logic;							-- determines if subtracting or adding
                    
                    --Outputs
                    Result  : out  STD_LOGIC_VECTOR(31 downto 0);	-- Result of ALU
                    
                    --input/output
                    CPSR	: out STD_LOGIC_VECTOR(3 downto 0)      -- N, Z, C, V
                    );
    
end component;

component control_unit port(   clk_in : in STD_LOGIC;
                               reset_in : in STD_LOGIC := '0';
                               op_code_in : in STD_LOGIC_VECTOR (5 downto 0);
                               -- Datapath Signals
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
                               -- End Datapath Signals
                               cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
                               counter_bit_in : in STD_LOGIC;
                               cpsr_set_bit_in : in STD_LOGIC;
                               condition_code_in : in STD_LOGIC_VECTOR (3 downto 0)
                            );
end component;

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
                                   pc_data_out : out STD_LOGIC_VECTOR (31 downto 0);
                                   cpsr_set_bit_in : in STD_LOGIC;
                                   cpsr_cond_bits_alu_in : in STD_LOGIC_VECTOR (3 downto 0);
                                   cpsr_cond_bits_control_out : out STD_LOGIC_VECTOR (3 downto 0);
                                   register_0_out : out STD_LOGIC_VECTOR (31 downto 0);
                                   register_1_out : out STD_LOGIC_VECTOR (31 downto 0)
                                    );

end component;

begin

    alu: ALU port map(  clk_in => cpu_clk,
                        reset_in => reset_in,
                        a => , 
                        b => ,
                        ALU_OP => ,
                        SUB => ,
                        Result => ,
                        CPSR => );
    
    
    register_file : register_file_array port map (  clk_in => cpu_clk,
                                                    reset_in => reset_in,
                                                    );
    
    

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
