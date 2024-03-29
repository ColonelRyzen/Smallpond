----------------------------------------------------------------------------------
-- Company:
-- Engineer: Zachary Salim
--
-- Create Date: 11/18/2017 06:37:42 PM
-- Design Name:
-- Module Name: control_unit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( clk_in : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           clk_counter_in : in integer;
           halt_request : in STD_LOGIC;
           cpu_halted : out STD_LOGIC;
           alu_datapath_result : in STD_LOGIC_VECTOR(31 downto 0);
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
           mem_write_out : out STD_LOGIC_VECTOR(3 downto 0);
           mem_to_reg_out : out STD_LOGIC;
           -- End Datapath Signals
           cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
           counter_bit_in : in STD_LOGIC;
           branch_counter_bit_in : in STD_LOGIC;
           cpsr_set_bit_in : in STD_LOGIC;
           condition_code_in : in STD_LOGIC_VECTOR (3 downto 0)
           );

end control_unit;

architecture Behavioral of control_unit is

attribute dont_touch : string;
signal instruction_runs: STD_LOGIC := '0';
attribute dont_touch of instruction_runs : signal is "true";
signal reg_write_old: STD_LOGIC := '0';
attribute dont_touch of reg_write_old : signal is "true";
signal mem_read_old : STD_LOGIC := '0';
attribute dont_touch of mem_read_old : signal is "true";
signal mem_write_old : STD_LOGIC_VECTOR(3 downto 0) := "0000";
attribute dont_touch of mem_write_old : signal is "true";
signal halted : STD_LOGIC := '0';
attribute dont_touch of halted : signal is "true";

begin

    -- clock_counter: process(clk_in,reset_in)
    -- begin
    --     if reset_in = '1' then
    --         clk_counter <= 0;
    --     elsif rising_edge(clk_in) then
    --         if halted = '0' then
    --             if clk_counter = 5 then
    --                 clk_counter <= 0;
    --             else
    --                 clk_counter <= clk_counter + 1;
    --             end if;
    --         end if;
    --     end if;
    -- end process;



-- Process to decode the instruction we are dealing with
-- Appropriate signals will be generated depending on the instruction flowing in.
-- Signals were determined on the google spread sheet
-- Case statement handles the decoding and signal assignment
    instruction_decode: process(clk_in,reset_in)
    begin


        if rising_edge(clk_in) then
            if halted = '1' and halt_request = '1' then
                --TODO: Debug core stuff.
            elsif halt_request = '0' and halted = '1' then
                halted <= '0';
                cpu_halted <= '0';
            elsif halt_request = '1' and halted = '0' then
                halted <= '1';
                cpu_halted <= '1';
            elsif halted = '0' and halt_request = '0' then
                halted <= '0';
                cpu_halted <= '0';

                -- Increment PC if statement. This will enable the pc_write_out signal in first stage
                if clk_counter_in = 0 and reset_in = '0' then
                    pc_write_out <= '0';

                end if;


                -- Case statement needs to be evaluates on the second minor cycle ofeach instruction
                -- Case for every instruction
                -- Checks in order of instructions in the spreadsheet
                -- 000001 -> 001100 are the 'A' type
                -- 011000 -> 101100 are the 'I' type
                -- 111100 -> 111110 are the 'B' type
                -- 111111 is the 'J' type
                -- Case comment format is "-- Instruction name - 'instruction alias'"
                if clk_counter_in = 1 and reset_in = '0' then
                    instruction_runs <= '1';
                    case op_code_in is
            --########################################################################################################--
                    -- Begin 'A' type
            --########################################################################################################--
                -------------------------------------------------------------
                        -- Addition - 'ADD'
                -------------------------------------------------------------
                        when "000001" =>
                            reg_write_old <= '1';
                            alu_src_out <= '0';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0111";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical And - 'AND'
                -------------------------------------------------------------
                        when "000010" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0000";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Arithmatic Shift Right - 'ASR'
                -------------------------------------------------------------
                        when "000011" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "1010";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "1010";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical Shift Left - 'LSL'
                -------------------------------------------------------------
                        when "000100" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "1000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1000";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "1000";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical Shift Right - 'LSR'
                -------------------------------------------------------------
                        when "000101" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "1001";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "1001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "1001";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical Nand - 'NAND'
                -------------------------------------------------------------
                        when "000110" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0011";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0011";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0011";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical Nor - 'NOR'
                -------------------------------------------------------------
                        when "000111" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0100";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0100";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0100";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;

                -------------------------------------------------------------
                        -- Logical Not - 'NOT'
                -------------------------------------------------------------
                        when "001000" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0010";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0010";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0010";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Logical Or - 'OR'
                -------------------------------------------------------------
                        when "001001" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0001";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0001";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0001";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Subtract - 'SUB'
                -------------------------------------------------------------
                        when "001010" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0111";
                            sub_out <= '1';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0111";
                                    sub_out <= '1';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0111";
                                sub_out <= '1';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Logical Exclusive Nor - 'XNOR'
                -------------------------------------------------------------
                        when "001011" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0110";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0110";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0110";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Logical Exclusive Or - 'XOR'
                -------------------------------------------------------------
                        when "001100" =>
                            reg_write_old <= '1';


                            alu_src_out <= '0';
                            alu_op_out <= "0101";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0101";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
            --########################################################################################################--
                    -- End 'A' tpye
            --########################################################################################################--


            --########################################################################################################--
                    -- Begin 'I' type
            --########################################################################################################--

                -------------------------------------------------------------
                        -- Addition Immediate - 'ADDI'
                -------------------------------------------------------------
                        when "011000" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical And Immediate - 'ANDI'
                -------------------------------------------------------------
                        when "011001" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Arithmatic Shift Right Immediate - 'ASRI'
                -------------------------------------------------------------
                        when "011010" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "1010";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Load - 'LDR'
                -------------------------------------------------------------
                        when "011011" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Load Byte - 'LDRB'
                -------------------------------------------------------------
                        when "011100" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Load Byte Unsigned - 'LDRBU'
                -------------------------------------------------------------
                        when "011101" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Load Halfword - 'LDRH'
                -------------------------------------------------------------
                        when "011110" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Load Halfword Unsigned - 'LDRHU'
                -------------------------------------------------------------
                        when "011111" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Logical Shift Left Immediate - 'LSLI'
                -------------------------------------------------------------
                        when "100000" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "1000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Shift Right Immediate - 'LSRI'
                -------------------------------------------------------------
                        when "100001" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "1001";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Load Upper Immediate - 'LUI'
                -------------------------------------------------------------
                        when "100010" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0001";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Nand Immediate - 'NANDI'
                -------------------------------------------------------------
                        when "100011" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0011";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Nor Immediate - 'NORI'
                -------------------------------------------------------------
                        when "100100" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0100";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Or Immediate - 'ORI'
                -------------------------------------------------------------
                        when "100101" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0001";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Store - 'STR'
                -------------------------------------------------------------
                        when "100110" =>
                            reg_write_old <= '0';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "1111";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        --Store Byte - 'STRB'
                -------------------------------------------------------------
                        when "100111" =>
                            reg_write_old <= '0';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0001";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Store Halfword - 'STRH'
                -------------------------------------------------------------
                        when "101000" =>
                            reg_write_old <= '0';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '1';
                            mem_write_old <= "0011";
                            mem_to_reg_out <= '0';
                -------------------------------------------------------------
                        -- Subtract Immediate - 'SUBI'
                -------------------------------------------------------------
                        when "101001" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0111";
                            sub_out <= '1';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Exclusive Nor Immediate - 'XNORI'
                -------------------------------------------------------------
                        when "101010" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0110";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';
                -------------------------------------------------------------
                        -- Logical Exclusive Or Immediate - 'XORI'
                -------------------------------------------------------------
                        when "101011" =>
                            reg_write_old <= '1';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '1';
                            alu_op_out <= "0101";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '1';

            --########################################################################################################--
                    -- End 'I' type
            --########################################################################################################--


            --########################################################################################################--
                    -- Begin 'B' type
            --########################################################################################################--

                -------------------------------------------------------------
                        -- Branch - 'B'
                -------------------------------------------------------------
                        when "111100" =>
                            reg_write_old <= '0';

                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '1';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0101";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Branch and Link - 'BL'
                -------------------------------------------------------------
                        when "111101" =>
                            reg_write_old <= '0';

                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '1';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0101";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
                -------------------------------------------------------------
                        -- Branch and Return - 'BR'
                -------------------------------------------------------------
                        when "111110" =>
                            reg_write_old <= '0';

                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '1';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';

                            -- AL (Always) - Unconditional
                            if condition_code_in = "0000" then
                                null;
                            -- EQ (Equal) - Z set
                            elsif condition_code_in = "0001" then
                                if cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NE (Not Equal) - Z clear
                            elsif condition_code_in = "0010" then
                                if cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CA (Carry Set) - C set
                            elsif condition_code_in = "0011" then
                                if cpsr_bits_in(1) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- CC (Carry Clear) - C clear
                            elsif condition_code_in = "0100" then
                                if cpsr_bits_in(1) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- NG (Negative) - N set
                            elsif condition_code_in = "0101" then
                                if cpsr_bits_in(3) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- PZ (Positive) - N clear
                            elsif condition_code_in = "0110" then
                                if cpsr_bits_in(3) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VS (Overflow Set) - V set
                            elsif condition_code_in = "0111" then
                                if cpsr_bits_in(0) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- VC (Overflow Clear) - V clear
                            elsif condition_code_in = "1000" then
                                if cpsr_bits_in(0) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            -- HI (Unsigned Higher) - C set and Z clear
                            elsif condition_code_in = "1001" then
                                if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LS (Unsigned Lower or Same) - C clear or Z set
                            elsif condition_code_in = "1010" then
                                if cpsr_bits_in(1) = '1' or cpsr_bits_in(2) = '0' then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                            elsif condition_code_in = "1011" then
                                if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                            elsif condition_code_in = "1100" then
                                if cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                            elsif condition_code_in = "1101" then
                                if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;

                            -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                            elsif condition_code_in = "1110" then
                                if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                                    reg_write_old <= '0';
                                    counter_bit_out <= '0';
                                    cpsr_set_bit_out <= '0';
                                    alu_src_out <= '0';
                                    alu_op_out <= "0101";
                                    sub_out <= '0';
                                    pc_src_out <= '0';
                                    jump_out <= '0';
                                    mem_read_old <= '0';
                                    mem_write_old <= "0000";
                                    mem_to_reg_out <= '1';
                                    instruction_runs <= '0';
                                end if;
                            else
                                reg_write_old <= '0';
                                counter_bit_out <= '0';
                                cpsr_set_bit_out <= '0';
                                alu_src_out <= '0';
                                alu_op_out <= "0101";
                                sub_out <= '0';
                                pc_src_out <= '0';
                                jump_out <= '0';
                                mem_read_old <= '0';
                                mem_write_old <= "0000";
                                mem_to_reg_out <= '1';
                            end if;
            --########################################################################################################--
                    -- End 'B' type
            --########################################################################################################--


            --########################################################################################################--
                    -- Begin 'J' type
            --########################################################################################################--

                -------------------------------------------------------------
                        -- Jump - 'J'
                -------------------------------------------------------------
                        when "111111" =>
                            reg_write_old <= '0';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '1';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
            --########################################################################################################--
                    -- End 'J' type
            --########################################################################################################--

                        when others =>
                            reg_write_old <= '0';
                            counter_bit_out <= '0';
                            cpsr_set_bit_out <= '0';
                            alu_src_out <= '0';
                            alu_op_out <= "0000";
                            sub_out <= '0';
                            pc_src_out <= '0';
                            jump_out <= '0';
                            mem_read_old <= '0';
                            mem_write_old <= "0000";
                            mem_to_reg_out <= '0';
                    end case;
                elsif clk_counter_in = 1 and reset_in = '1' then
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "0000";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= "0000";
                    mem_to_reg_out <= '0';
                end if;

                if clk_counter_in = 2 and reset_in = '0' and instruction_runs = '1' then
                    pc_write_out <= '1';
                end if;

                if clk_counter_in = 3 and reset_in = '0' and instruction_runs = '1' then
                    sub_out <= '0';
                    mem_read_out <= mem_read_old;
                    if alu_datapath_result(1 downto 0) = "00" then
                        mem_write_out <= mem_write_old;
                    elsif alu_datapath_result(1 downto 0) = "01" then
                        mem_write_out <= mem_write_old(2 downto 0) & '0';
                    elsif alu_datapath_result(1 downto 0) = "10" then
                        mem_write_out <= mem_write_old(1 downto 0) & "00";
                    elsif alu_datapath_result(1 downto 0) = "11" then
                        mem_write_out <= mem_write_old(0) & "000";
                    end if;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    if (op_code_in /= "111100" or op_code_in /= "111101" or op_code_in /= "111110") then
                        counter_bit_out <= counter_bit_in;
                    else
                        counter_bit_out <= branch_counter_bit_in;
                    end if;
                    pc_write_out <= '0';
                elsif clk_counter_in = 3 and (instruction_runs = '0' or reset_in = '1') then
                    mem_read_out <= '0';
                    mem_write_out <= "0000";
                    cpsr_set_bit_out <= '0';
                    counter_bit_out <= '0';
                    pc_write_out <= '0';
                end if;
                -- This is for a potential update of teh cpsr or counter registers
                if clk_counter_in = 4 and reset_in = '0' and instruction_runs = '1' then
                    reg_write_out <= reg_write_old;
                    cpsr_set_bit_out <= '0';
                    counter_bit_out <= '0';
                    mem_read_out <= '1';
                    mem_write_out <= "0000";
                    pc_write_out <= '0';
                elsif clk_counter_in = 4 and (instruction_runs = '0' or reset_in = '1') then
                    reg_write_out <= '0';
                    mem_read_out <= '0';
                end if;

                -- This is for the write back stage
                -- reg_write_out is enabled and all other write signals are disbaled
                if clk_counter_in = 5 and reset_in = '0' and instruction_runs = '1' then
                    reg_write_out <= '0';
                    mem_read_out <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
