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
        uart_rx : in STD_LOGIC;
        uart_tx : out STD_LOGIC;
--        halt_request : in STD_LOGIC;
        memory_data_in : in STD_LOGIC_VECTOR(31 downto 0);
        memory_data_out : out STD_LOGIC_VECTOR(31 downto 0);
        memory_ready : in STD_LOGIC;
        memory_enable_out : out STD_LOGIC;
        memory_write_out : out STD_LOGIC_VECTOR(3 downto 0);
        memory_address_out : out STD_LOGIC_VECTOR(31 downto 0)
        );
end smallpond_top;

architecture Behavioral of smallpond_top is

    attribute dont_touch : string;
    signal cpu_clk : STD_LOGIC := '0';
    attribute dont_touch of cpu_clk : signal is "true";

    --signals between register_file and alu
    signal reg_alu_a : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    --signal reg_alu_b : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal reg_alu_src_0 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal alu_reg_cpsr : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    attribute dont_touch of alu_reg_cpsr : signal is "true";

    --signals between control_unit and register_file
    signal reg_ctrl_cpsr : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal ctrl_reg_reg_write : STD_LOGIC := '0';
    signal ctrl_reg_counter : STD_LOGIC := '0';
    signal ctrl_reg_pc_write : STD_LOGIC := '0';
    signal ctrl_reg_cpsr_set : STD_LOGIC := '0';


    --signals between control_unit and alu
    signal ctrl_alu_alu_op : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    attribute dont_touch of ctrl_alu_alu_op : signal is "true";
    signal ctrl_alu_sub : STD_LOGIC := '0';
    attribute dont_touch of ctrl_alu_sub : signal is "true";

    --Datapath Signals
    signal alu_datapath_result : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    attribute dont_touch of alu_datapath_result : signal is "true";
    signal datapath_reg_write_data : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_reg_write_register : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_reg_read_register_0 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_reg_read_register_1 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal datapath_ctrl_op_code : STD_LOGIC_VECTOR(5 downto 0) := "000000";
    signal datapath_ctrl_cpsr_set_bit : STD_LOGIC := '0'; -- bit 10
    signal datapath_ctrl_counter_bit : STD_LOGIC := '0'; -- bit 9
    signal datapath_ctrl_cond_bits : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal datapath_ctrl_branch_counter : STD_LOGIC := '0'; -- bit b 25

    signal datapath_immediate_sign_extend : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; -- datapath sign extended immediate

    signal ctrl_datapath_mem_to_reg : STD_LOGIC;
    signal ctrl_datapath_alu_src : STD_LOGIC := '0';
    signal ctrl_datapath_pc_src : STD_LOGIC := '0';
    signal ctrl_datapath_jump : STD_LOGIC := '0';

    signal reg_datapath_pc_data : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_reg_pc_data : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_alu_src_result : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    attribute dont_touch of datapath_alu_src_result : signal is "true";
    signal datapath_pc_src_result : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_pc_input : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal datapath_instruction_address : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

    -- datapath branch signals
    signal datapath_branch_immediate_sign_extend : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

    attribute dont_touch of datapath_branch_immediate_sign_extend : signal is "true";
    signal datapath_branch_plus_pc : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

    -- datapath jump signals
    signal datapath_jump_pc : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    attribute dont_touch of datapath_jump_pc : signal is "true";

    signal memory_enable : STD_LOGIC := '0';
--    signal memory_ready : STD_LOGIC := '0';
    signal memory_write : STD_LOGIC_VECTOR(3 downto 0) := "0000";
   -- signal memory_data_in : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
   signal mem_data_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
   signal mem_address_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
--    attribute dont_touch of memory_address_out : signal is "true

    signal dbg_reg_write_en : STD_LOGIC;
    signal dbg_reg_data_out : STD_LOGIC_VECTOR(31 downto 0);
    signal dbg_write_register, dbg_read_register : STD_LOGIC_VECTOR(4 downto 0);
    signal dbg_mem_data_out, dbg_mem_address_out : STD_LOGIC_VECTOR(31 downto 0);
    signal dbg_mem_write : STD_LOGIC_VECTOR(3 downto 0);
    signal dbg_mem_enable : STD_LOGIC;
    signal dbg_mem_ready : STD_LOGIC;

    --result signals for dbg and datapath driver multiplexing
    signal dbg_datapath_reg_write : STD_LOGIC;
    signal dbg_datapath_write_data_in : STD_LOGIC_VECTOR(31 downto 0);
    signal dbg_datapath_write_register, dbg_datapath_read_register : STD_LOGIC_VECTOR(4 downto 0);

    signal memory_clk : STD_LOGIC := '0';
    signal cpu_clk_8 : STD_LOGIC := '0';
    signal clk_divider : STD_LOGIC_VECTOR(1 downto 0) := "00";

    signal clk_counter : integer range 0 to 5 := 4;

    signal halt_request : STD_LOGIC := '0';
    attribute dont_touch of halt_request : signal is "true"; 
    signal cpu_halted : STD_LOGIC := '0';
    attribute dont_touch of cpu_halted : signal is "true";

    component debug is
    port (
            clk: in std_logic;

            halt_cpu: out std_logic;
            cpu_halted: in std_logic;

            reg_file_write_en : out std_logic;
            reg_file_data_in : in std_logic_vector(31 downto 0);
            reg_file_data_out : out std_logic_vector(31 downto 0);
            write_register : out std_logic_vector(4 downto 0);
            read_register : out std_logic_vector(4 downto 0);

            mem_data_in: in std_logic_vector(31 downto 0);
            mem_data_out: out std_logic_vector(31 downto 0);
            mem_addr_out: out std_logic_vector(31 downto 0);
            mem_write: out std_logic_vector(3 downto 0);
            mem_enable: out std_logic;
            
            pc_in : in std_logic_vector(31 downto 0);
            clk_counter : in integer;

            uart_rx: in std_logic;
            uart_tx: out std_logic
        );

    end component;


begin

    alu: entity work.ALU port map(  clk_in => clk_in,
                                    reset_in => reset_in,
                                    clk_counter => clk_counter,
                                    a => reg_alu_a,
                                    b => datapath_alu_src_result,
                                    ALU_OP => ctrl_alu_alu_op,
                                    SUB => ctrl_alu_sub,
                                    Result => alu_datapath_result,
                                    CPSR => alu_reg_cpsr
                                    );


    register_file : entity work.register_file_array port map (  clk_in => clk_in,
                                                    reset_in => reset_in,
                                                    clk_counter => clk_counter,
                                                    reg_write_in => dbg_datapath_reg_write,
                                                    counter_bit_in => ctrl_reg_counter,
                                                    write_register_in => dbg_datapath_write_register,
                                                    read_register_0_in => dbg_datapath_read_register,
                                                    read_register_1_in => datapath_reg_read_register_1,
                                                    write_data_in => dbg_datapath_write_data_in,
                                                    pc_write_in => ctrl_reg_pc_write,
                                                    pc_write_data_in => datapath_pc_input,
                                                    pc_data_out => datapath_instruction_address,
                                                    cpsr_set_bit_in => ctrl_reg_cpsr_set,
                                                    cpsr_cond_bits_alu_in => alu_reg_cpsr,
                                                    cpsr_cond_bits_control_out => reg_ctrl_cpsr,
                                                    register_0_out => reg_alu_a,
                                                    register_1_out => reg_alu_src_0
                                                    );

    control_unit : entity work.control_unit port map (  clk_in => clk_in,
                                            reset_in => reset_in,
                                            clk_counter_in => clk_counter,
                                            halt_request => halt_request,
                                            cpu_halted => cpu_halted,
                                            alu_datapath_result => alu_datapath_result,
                                            op_code_in => datapath_ctrl_op_code,
                                            reg_write_out => ctrl_reg_reg_write,
                                            counter_bit_out => ctrl_reg_counter,
                                            cpsr_set_bit_out => ctrl_reg_cpsr_set,
                                            alu_src_out => ctrl_datapath_alu_src,
                                            alu_op_out => ctrl_alu_alu_op,
                                            sub_out => ctrl_alu_sub,
                                            pc_write_out => ctrl_reg_pc_write,
                                            pc_src_out => ctrl_datapath_pc_src,
                                            jump_out => ctrl_datapath_jump,
                                            mem_read_out => memory_enable,
                                            mem_write_out => memory_write,
                                            mem_to_reg_out => ctrl_datapath_mem_to_reg,
                                            cpsr_bits_in => reg_ctrl_cpsr,
                                            counter_bit_in => datapath_ctrl_counter_bit,
                                            branch_counter_bit_in => datapath_ctrl_branch_counter,
                                            cpsr_set_bit_in => datapath_ctrl_cpsr_set_bit,
                                            condition_code_in => datapath_ctrl_cond_bits
                                            );

    gdb_debug : debug port map( clk => clk_in,
                                halt_cpu => halt_request,
                                cpu_halted => cpu_halted,
                                reg_file_write_en => dbg_reg_write_en,
                                reg_file_data_in => reg_alu_a,
                                reg_file_data_out => dbg_reg_data_out,
                                write_register => dbg_write_register,
                                read_register => dbg_read_register,
                                mem_data_in => memory_data_in,
                                mem_data_out => dbg_mem_data_out,
                                mem_addr_out => dbg_mem_address_out,
                                mem_write => dbg_mem_write,
                                mem_enable => dbg_mem_enable,
                                pc_in => reg_datapath_pc_data,
                                clk_counter => clk_counter,
                                uart_rx => uart_rx,
                                uart_tx => uart_tx
                                );



        --Mapping debug signals to existing signals. Multiplexing the drivers for the nets
        dbg_datapath_reg_write <= dbg_reg_write_en when cpu_halted = '1' else ctrl_reg_reg_write;
        dbg_datapath_write_data_in <= dbg_reg_data_out when cpu_halted = '1' else datapath_reg_write_data;
        dbg_datapath_write_register <= dbg_write_register when cpu_halted = '1' else datapath_reg_write_register;
        dbg_datapath_read_register <= dbg_read_register when cpu_halted = '1' else datapath_reg_read_register_0;

        memory_data_out <= dbg_mem_data_out when cpu_halted = '1' else mem_data_out;
        memory_address_out <= dbg_mem_address_out when cpu_halted = '1' else mem_address_out;
        memory_write_out <= dbg_mem_write when cpu_halted = '1' else memory_write;
        memory_enable_out <= dbg_mem_enable when cpu_halted = '1' else memory_enable;
        
        


    clock_counter: process (clk_in, reset_in)
    begin
        if reset_in = '1' then
            clk_counter <= 0;
        elsif rising_edge(clk_in) then
            if clk_counter = 5 then
                clk_counter <= 0;
            else
                clk_counter <= clk_counter + 1;
            end if;
        end if;
    end process;

    datapath : process(clk_in)
    begin
        if rising_edge(clk_in) then
            -- INSTRUCTION FETCH
            if clk_counter = 0 and reset_in = '0' then

                reg_datapath_pc_data <= datapath_instruction_address + x"00000004";


            --Fetch instruction and set the decode signals
            --branch and jump logic

               -- A type instruction decode
               -- Splitting up the instruction
               datapath_ctrl_op_code <= memory_data_in(31 downto 26);         -- bits 31 to 26
               datapath_reg_write_register <= memory_data_in(25 downto 21);   -- bits 25 to 21
               datapath_reg_read_register_0 <= memory_data_in(20 downto 16);  -- bits 20 to 16
               datapath_reg_read_register_1 <= memory_data_in(15 downto 11);  -- bits 15 to 11

               datapath_ctrl_cpsr_set_bit <= memory_data_in(10);              -- bit 10
               datapath_ctrl_counter_bit <= memory_data_in(9);                -- bit 9
                                                                          -- bits 8 to 4 UNUSED
               datapath_ctrl_cond_bits <= memory_data_in(3 downto 0);         -- bits 3 to 0

               --datapath_branch_immediate <= instruction(21 downto 4);
               if memory_data_in(17) = '1' then
                   datapath_branch_immediate_sign_extend <= "00000000000000" & memory_data_in(21 downto 4);
               else
                   datapath_branch_immediate_sign_extend <= "11111111111111" & memory_data_in(21 downto 4);
               end if;

               -- J type instruction decode


            end if;
            -- INSTRUCTION DECODE AND OPERAND FETCH
            if clk_counter = 1  and reset_in = '0' then

                -- I type instruction decode
                --datapath_immediate <= instruction(15 downto 0);             -- I type immediate
                if memory_data_in(15) = '1' then
                    datapath_immediate_sign_extend <= x"FFFF" & memory_data_in(15 downto 0);
                else
                    datapath_immediate_sign_extend <= x"0000" & memory_data_in(15 downto 0);
                end if;


                -- B type instruction decode
                datapath_ctrl_branch_counter <= memory_data_in(25);


                datapath_jump_pc <= reg_datapath_pc_data(31 downto 28) & memory_data_in(25 downto 0) & "00";

                --datapath_branch_plus_pc <= std_logic_vector(unsigned(datapath_branch_immediate_sign_extend) sll 2) + reg_datapath_pc_data;

                --branch logic
                if ctrl_datapath_pc_src = '1' then
                    datapath_pc_src_result <= std_logic_vector(unsigned(datapath_branch_immediate_sign_extend) sll 2) + reg_datapath_pc_data;
                else
                    datapath_pc_src_result <= reg_datapath_pc_data;
                end if;

            end if;

            if clk_counter = 2  and reset_in = '0' then
                -- alu operations
                if ctrl_datapath_alu_src = '0' then
                    datapath_alu_src_result <= reg_alu_src_0;
                else
                    datapath_alu_src_result <= datapath_immediate_sign_extend;
                end if;

                 --jump logic
              if ctrl_datapath_jump = '1' then
                  --datapath_reg_pc_data <= datapath_jump_pc;
                  datapath_pc_input <= datapath_jump_pc;
              else
                  --datapath_reg_pc_data <= datapath_pc_src_result;
                  datapath_pc_input <= datapath_pc_src_result;
              end if;

            end if;

            -- EXECUTE
            if clk_counter = 3  and reset_in = '0' then




            end if;
            -- MEMORY
            if clk_counter = 4  and reset_in = '0' then
            -- memory operations
                if memory_enable = '1' then
                    mem_address_out <= alu_datapath_result;

                    if (memory_write and "1111") /= "0000" then
                        mem_address_out <= alu_datapath_result;
                        mem_data_out <= reg_alu_src_0;
                    end if;
                end if;
            -- mem to reg
                if ctrl_datapath_mem_to_reg = '0' then
                    datapath_reg_write_data <= memory_data_in;
                else
                    datapath_reg_write_data <= alu_datapath_result;
                end if;
            end if;

            -- WRITE BACK
            if clk_counter = 5 and reset_in = '0' then
                --Send next instruction address
                mem_address_out <= reg_datapath_pc_data;
            end if;
        end if;


    end process;




end Behavioral;
