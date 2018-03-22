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
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity smallpond_top is
  Port (clk_in : in STD_LOGIC;
        reset_in : in STD_LOGIC;
        memory_data_in : in STD_LOGIC_VECTOR(31 downto 0);
        memory_read_out : out STD_LOGIC;
        memory_write_out : out STD_LOGIC;
        memory_address_out : out STD_LOGIC_VECTOR(31 downto 0)
        );
end smallpond_top;

architecture Behavioral of smallpond_top is   
    
--    component ALU port (clk_in : in STD_LOGIC;
--                        reset_in : in STD_LOGIC;
--                        --Inputs
--                        a	: in STD_LOGIC_VECTOR(31 downto 0);		-- 2 inputs 32-bit
--                        b   : in STD_LOGIC_VECTOR(31 downto 0);
--                        ALU_OP	: in STD_LOGIC_VECTOR(3 downto 0);      -- 1 input 4-bit for selecting function
--                        SUB		: in std_logic;							-- determines if subtracting or adding
                        
--                        --Outputs
--                        Result  : out  STD_LOGIC_VECTOR(31 downto 0);	-- Result of ALU
                        
--                        --input/output
--                        CPSR	: out STD_LOGIC_VECTOR(3 downto 0)      -- N, Z, C, V
--                        );
        
--    end component;
    
--    component control_unit port(   clk_in : in STD_LOGIC;
--                                   reset_in : in STD_LOGIC;
--                                   op_code_in : in STD_LOGIC_VECTOR (5 downto 0);
--                                   -- Datapath Signals
--                                   reg_write_out : out STD_LOGIC;
--                                   counter_bit_out : out STD_LOGIC;
--                                   cpsr_set_bit_out : out STD_LOGIC;
--                                   alu_src_out : out STD_LOGIC;
--                                   alu_op_out : out STD_LOGIC_VECTOR (3 downto 0);
--                                   sub_out : out STD_LOGIC;
--                                   pc_write_out : out STD_LOGIC;
--                                   pc_src_out : out STD_LOGIC;
--                                   jump_out : out STD_LOGIC;
--                                   mem_read_out : out STD_LOGIC;
--                                   mem_write_out : out STD_LOGIC;
--                                   mem_to_reg_out : out STD_LOGIC;
--                                   -- End Datapath Signals
--                                   cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
--                                   counter_bit_in : in STD_LOGIC;
--                                   cpsr_set_bit_in : in STD_LOGIC;
--                                   condition_code_in : in STD_LOGIC_VECTOR (3 downto 0)
--                                );
--    end component;
    
--    component register_file_array port(clk_in : in STD_LOGIC;
--                                       reset_in : in STD_LOGIC;
--                                       reg_write_in : in STD_LOGIC;
--                                       counter_bit_in : in STD_LOGIC;
--                                       write_register_in : in STD_LOGIC_VECTOR (4 downto 0);
--                                       read_register_0_in : in STD_LOGIC_VECTOR (4 downto 0);
--                                       read_register_1_in : in STD_LOGIC_VECTOR (4 downto 0);
--                                       write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
--                                       pc_write_in : in STD_LOGIC;
--                                       pc_write_data_in : in STD_LOGIC_VECTOR (31 downto 0);
--                                       pc_data_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                       cpsr_set_bit_in : in STD_LOGIC;
--                                       cpsr_cond_bits_alu_in : in STD_LOGIC_VECTOR (3 downto 0);
--                                       cpsr_cond_bits_control_out : out STD_LOGIC_VECTOR (3 downto 0);
--                                       register_0_out : out STD_LOGIC_VECTOR (31 downto 0);
--                                       register_1_out : out STD_LOGIC_VECTOR (31 downto 0)
--                                        );
    
--    end component;

    signal cpu_clk : STD_LOGIC := '0';
    
    --signals between register_file and alu
    signal reg_alu_a : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal reg_alu_b : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal alu_reg_cpsr : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    
    --signals between control_unit and register_file
    signal reg_ctrl_cpsr : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal ctrl_reg_reg_write : STD_LOGIC := '0';
    signal ctrl_reg_counter : STD_LOGIC := '0';
    signal ctrl_reg_pc_write : STD_LOGIC := '0';
    signal ctrl_reg_pc_data : STD_LOGIC_VECTOR := x"00000000";
    signal ctrl_reg_cpsr_set : STD_LOGIC := '0';
    
    --signals between control_unit and alu
    signal ctrl_alu_alu_op : STD_LOGIC_VECTOR(3 downto 0) := x"0000";
    signal ctrl_alu_sub : STD_LOGIC := '0';
    
    --Datapath Signals
    signal alu_datapath_result : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_reg_write_data : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_reg_write_register : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_reg_read_register_0 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_reg_read_register_1 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_ctrl_op_code : STD_LOGIC_VECTOR(5 downto 0) := "000000";
    signal datapath_ctrl_cpsr_set_bit : STD_LOGIC := '0'; -- bit 10
    signal datapath_ctrl_counter_bit : STD_LOGIC := '0'; -- bit 9
    signal datapath_ctrl_cond_bits : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal datapath_ctrl_branch_counter : STD_LOGIC := '0'; -- bit b 25
    signal datapath_immediate : STD_LOGIC_VECTOR(15 downto 0) := x"00000000"; -- datapath immediate
    signal datapath_immediate_sign_extend : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; -- datapath sign extended immediate
    signal datapath_branch_immediate : STD_LOGIC_VECTOR(17 downto 0) := "00000000000000000";
    signal datapath_branch_immediate_sign_extend : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
    signal ctrl_datapath_mem_to_reg : STD_LOGIC := '0';
    signal ctrl_datapath_alu_src : STD_LOGIC := '0';
    signal ctrl_datapath_pc_src : STD_LOGIC := '0';
    signal ctrl_datapath_jump : STD_LOGIC := '0';
    signal datapath_instruction_address : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal instruction : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
   
    signal clk_counter : integer range 0 to 4 := 0;
    
    

begin

    alu: entity work.ALU port map(  clk_in => cpu_clk,
                                    reset_in => reset_in,
                                    a => reg_alu_a, 
                                    b => reg_alu_b,
                                    ALU_OP => ctrl_alu_alu_op,
                                    SUB => ctrl_alu_sub,
                                    Result => alu_datapath_result,
                                    CPSR => alu_reg_cpsr
                                    );
    
    
    register_file : entity work.register_file_array port map (  clk_in => cpu_clk,
                                                    reset_in => reset_in,
                                                    reg_write_in => ctrl_reg_reg_write,
                                                    counter_bit_in => ctrl_reg_counter,
                                                    write_register_in => datapath_reg_write_register,
                                                    read_register_0_in => datapath_reg_read_register_0,
                                                    read_register_1_in => datapath_reg_read_register_1,
                                                    write_data_in => datapath_reg_write_data,
                                                    pc_write_in => ctrl_reg_pc_write,
                                                    pc_write_data_in => ctrl_reg_pc_data,
                                                    pc_data_out => datapath_instruction_address,
                                                    cpsr_set_bit_in => ctrl_reg_cpsr_set,
                                                    cpsr_cond_bits_alu_in => alu_reg_cpsr,
                                                    cpsr_cond_bits_control_out => reg_ctrl_cpsr,
                                                    register_0_out => reg_alu_a,
                                                    register_1_out => reg_alu_b
                                                    );
                                                    
    control_unit : entity work.control_unit port map (  clk_in => cpu_clk,
                                            reset_in => reset_in,
                                            op_code_in => datapath_ctrl_op_code,
                                            reg_write_out => ctrl_reg_reg_write,
                                            counter_bit_out => ctrl_reg_counter,
                                            cpsr_set_bit_out => datapath_ctrl_cpsr_set_bit,
                                            alu_src_out => ctrl_datapath_alu_src,
                                            alu_op_out => ctrl_alu_alu_op,
                                            sub_out => ctrl_alu_sub,
                                            pc_write_out => ctrl_reg_pc_write,
                                            pc_src_out => ctrl_datapath_pc_src,
                                            jump_out => ctrl_datapath_jump,
                                            mem_read_out => memory_read_out,
                                            mem_write_out => memory_write_out,
                                            mem_to_reg_out => ctrl_datapath_mem_to_reg,
                                            cpsr_bits_in => reg_ctrl_cpsr,
                                            counter_bit_in => datapath_ctrl_counter_bit,
                                            cpsr_set_bit_in => ctrl_reg_cpsr_set,
                                            condition_code_in => datapath_ctrl_cond_bits
                                            );
    
    

    main_clk : process(clk_in)
    variable clk_count : integer := 0;
    begin
        if rising_edge(clk_in) then
            if clk_count = 500 then
                clk_count := 0;
                cpu_clk <= not cpu_clk;
            else
                clk_count := clk_count + 1;
            end if;
        end if;
    end process;
    
    clock_counter: process (clk_in, reset_in)
    begin
        if reset_in = '1' then
            clk_counter <= 0;
        elsif rising_edge(clk_in) then
            if clk_counter = 4 then
                clk_counter <= 0;
                --counter <= clk_counter;
            else
                clk_counter <= clk_counter + 1;
                --counter <= clk_counter;
            end if;
        end if;
    end process;
    
    datapath : process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            -- INSTRUCTION FETCH
            if clk_counter = 0 then
                memory_address_out <= datapath_instruction_address;
                ctrl_reg_pc_write <= '1';
                ctrl_reg_pc_data <= datapath_instruction_address + x"00000004";
                instruction <= memory_data_in;
                
            --Fetch instruction and set the decode signals
            --branch and jump logic
            -- INSTRUCTION DECODE AND OPERAND FETCH
            elsif clk_counter = 1 then
                ctrl_reg_pc_write <= '0';
                
                -- A type instruction decode
                -- Splitting up the instruction
                datapath_ctrl_op_code <= instruction(31 downto 26);         -- bits 31 to 26
                datapath_reg_write_register <= instruction(25 downto 21);   -- bits 25 to 21
                datapath_reg_read_register_0 <= instruction(20 downto 16);  -- bits 20 to 16
                datapath_reg_read_register_1 <= instruction(15 downto 11);  -- bits 15 to 11
                
                datapath_ctrl_cpsr_set_bit <= instruction(10);              -- bit 10
                datapath_ctrl_counter_bit <= instruction(9);                -- bit 9
                                                                            -- bits 8 to 4 UNUSED
                datapath_ctrl_cond_bits <= instruction(3 downto 0);         -- bits 3 to 0
                
                -- I type instruction decode
                datapath_immediate <= instruction(15 downto 0);             -- I type immediate
                
                
                -- B type instruction decode
                datapath_ctrl_branch_counter <= instruction(25);
                datapath_branch_immediate <= instruction(21 downto 4);
                
                
                
            -- branch and jump logic
            
            -- EXECUTE
            elsif clk_counter = 2 then
            -- branch and jump logic
            -- alu operations
            
            -- MEMORY
            elsif clk_counter = 3 then
            -- memory operations
            -- branch logic
            
            -- WRITE BACK
            elsif clk_counter = 4 then
            -- reg_file write back
            end if;
        end if;        
    
    
    end process;
    
    


end Behavioral;
