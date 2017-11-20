----------------------------------------------------------------------------------
-- Company:
-- Engineer:
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( clk_in : in STD_LOGIC;
           op_code_in : in STD_LOGIC_VECTOR (5 downto 0);
           -- Datapath Signals
           reg_write_out : out STD_LOGIC;
           counter_bit_out : out STD_LOGIC;
           cpsr_set_bit_out : out STD_LOGIC;
           alu_src_out : out STD_LOGIC;
           alu_op_out : out STD_LOGIC_VECTOR (3 downto 0);
           sub_out : out STD_LOGIC;
           pc_src_out : out STD_LOGIC;
           jump_out : out STD_LOGIC;
           mem_read_out : out STD_LOGIC;
           mem_write_out : out STD_LOGIC;
           mem_to_reg_out : out STD_LOGIC;
           -- End Datapath Signals
           cpsr_bits_in : in STD_LOGIC_VECTOR (3 downto 0);
           counter_bit_in : in STD_LOGIC;
           cpsr_set_bit_in : in STD_LOGIC;
           condition_code_in : in STD_LOGIC_VECTOR (3 downto 0);
           branch_counter_in : in STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is

begin
-- Process to decode the instruction we are dealing with
-- Appropriate signals will be generated depending on the instruction flowing in.
-- Signals were determined on the google spread sheet
-- Case statement handles the decoding and signal assignment
    instruction_decode: process(clk_in)
    begin
    -- Process runs on 100MHz clock
    -- Case statement needs to be evaluates on the second minor cycle ofeach instruction
    -- Case for every instruction
    -- Checks in order of instructions in the spreadsheet
    -- 000001 -> 001100 are the 'A' type
    -- 011000 -> 101100 are the 'I' type
    -- 111100 -> 111110 are the 'B' type
    -- 111111 is the 'J' type
    -- Case comment format is "-- Instruction name - 'instruction alias'"

        case op_code_in is
--########################################################################################################--
        -- Begin 'A' type
--########################################################################################################--
    -------------------------------------------------------------
            -- Addition - 'ADD'
    -------------------------------------------------------------
            when "000001" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "0111";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0111";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "0111";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Logical And - 'AND'
    -------------------------------------------------------------
            when "000010" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "0000";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "0000";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Arithmatic Shift Right - 'ASR'
    -------------------------------------------------------------
            when "000011" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "1010";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1010";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "1010";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Logical Shift Left - 'LSL'
    -------------------------------------------------------------
            when "000100" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "1000";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1000";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "1000";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Logical Shift Right - 'LSR'
    -------------------------------------------------------------
            when "000101" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "1001";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "1001";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "1001";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Logical Nand - 'NAND'
    -------------------------------------------------------------
            when "000110" =>
                -- AL (Always)- Proceed as normal
                if condition_code_in = "0000" then
                    reg_write_out <= '1';
                    counter_bit_out <= counter_bit_in;
                    cpsr_set_bit_out <= cpsr_set_bit_in;
                    alu_src_out <= '0';
                    alu_op_out <= "0011";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                -- EQ (Equal) - Z set
                elsif condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '0' and cpsr_bits_in(3) = cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '0' or cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        reg_write_out <= '1';
                        counter_bit_out <= counter_bit_in;
                        cpsr_set_bit_out <= cpsr_set_bit_in;
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    else
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0011";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "0011";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;
    -------------------------------------------------------------
            -- Logical Nor - 'NOR'
    -------------------------------------------------------------
            when "000111" =>
                reg_write_out <= '1';
                counter_bit_out <= counter_bit_in;
                cpsr_set_bit_out <= cpsr_set_bit_in;
                alu_src_out <= '0';
                alu_op_out <= "0100";
                sub_out <= '0';
                pc_src_out <= '0';
                jump_out <= '0';
                mem_read_out <= '0';
                mem_write_out <= '0';
                mem_to_reg_out <= '1';


                -- EQ (Equal) - Z set
                if condition_code_in = "0001" then
                    if cpsr_bits_in(2) = '0' then
                        reg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NE (Not Equal) - Z clear
                elsif condition_code_in = "0010" then
                    if cpsr_bits_in(2) = '1' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CA (Carry Set) - C set
                elsif condition_code_in = "0011" then
                    if cpsr_bits_in(1) = '0' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- CC (Carry Clear) - C clear
                elsif condition_code_in = "0100" then
                    if cpsr_bits_in(1) = '1' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- NG (Negative) - N set
                elsif condition_code_in = "0101" then
                    if cpsr_bits_in(3) = '0' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- PZ (Positive) - N clear
                elsif condition_code_in = "0110" then
                    if cpsr_bits_in(3) = '1' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VS (Overflow Set) - V set
                elsif condition_code_in = "0111" then
                    if cpsr_bits_in(0) = '0' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- VC (Overflow Clear) - V clear
                elsif condition_code_in = "1000" then
                    if cpsr_bits_in(0) = '1' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                -- HI (Unsigned Higher) - C set and Z clear
                elsif condition_code_in = "1001" then
                    if cpsr_bits_in(1) = '0' and cpsr_bits_in(2) = '1' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LS (Unsigned Lower or Same) - C clear and Z set
                elsif condition_code_in = "1010" then
                    if cpsr_bits_in(1) = '1' and cpsr_bits_in(2) = '0' then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GE (Signed Greater Than or Equal) - N set and V set OR N clear and V clear (N==V)
                elsif condition_code_in = "1011" then
                    if cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LT (Signed Less Than) - N set and V clear OR N clear and V set (N!=V)
                elsif condition_code_in = "1100" then
                    if cpsr_bits_in(3) = cpsr_bits_in(0) then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- GT (Signed Greater Than) - Z clear and, N and V set OR N and V clear (Z==0, N==V)
                elsif condition_code_in = "1101" then
                    if cpsr_bits_in(2) = '1' and cpsr_bits_in(3) /= cpsr_bits_in(0) then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;

                -- LE (Less Than or Equal) - Z set or, N set and V clear OR N clear and V set (Z==1 or N!=V)
                elsif condition_code_in = "1110" then
                    if cpsr_bits_in(2) = '1' or cpsr_bits_in(3) = cpsr_bits_in(0) then
                        eg_write_out <= '0';
                        counter_bit_out <= '0';
                        cpsr_set_bit_out <= '0';
                        alu_src_out <= '0';
                        alu_op_out <= "0100";
                        sub_out <= '0';
                        pc_src_out <= '0';
                        jump_out <= '0';
                        mem_read_out <= '0';
                        mem_write_out <= '0';
                        mem_to_reg_out <= '1';
                    end if;
                else
                    reg_write_out <= '0';
                    counter_bit_out <= '0';
                    cpsr_set_bit_out <= '0';
                    alu_src_out <= '0';
                    alu_op_out <= "0100";
                    sub_out <= '0';
                    pc_src_out <= '0';
                    jump_out <= '0';
                    mem_read_out <= '0';
                    mem_write_out <= '0';
                    mem_to_reg_out <= '1';
                end if;

    -------------------------------------------------------------
            -- Logical Not - 'NOT'
    -------------------------------------------------------------
            when "001000" =>

    -------------------------------------------------------------
            -- Logical Or - 'OR'
    -------------------------------------------------------------
            when "001001" =>

    -------------------------------------------------------------
            -- Subtract - 'SUB'
    -------------------------------------------------------------
            when "001010" =>

    -------------------------------------------------------------
            -- Logical Exclusive Nor - 'XNOR'
    -------------------------------------------------------------
            when "001011" =>

    -------------------------------------------------------------
            -- Logical Exclusive Or - 'XOR'
    -------------------------------------------------------------
            when "001100" =>

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

    -------------------------------------------------------------
            -- Logical And Immediate - 'ANDI'
    -------------------------------------------------------------
            when "011001" =>

    -------------------------------------------------------------
            -- Arithmatic Shift Right Immediate - 'ASRI'
    -------------------------------------------------------------
            when "011010" =>

    -------------------------------------------------------------
            -- Load - 'LDR'
    -------------------------------------------------------------
            when "011011" =>

    -------------------------------------------------------------
            -- Load Byte - 'LDRB'
    -------------------------------------------------------------
            when "011100" =>

    -------------------------------------------------------------
            -- Load Byte Unsigned - 'LDRBU'
    -------------------------------------------------------------
            when "011101" =>

    -------------------------------------------------------------
            -- Load Halfword - 'LDRH'
    -------------------------------------------------------------
            when "011110" =>

    -------------------------------------------------------------
            -- Load Halfword Unsigned - 'LDRHU'
    -------------------------------------------------------------
            when "011111" =>

    -------------------------------------------------------------
            -- Logical Shift Left Immediate - 'LSLI'
    -------------------------------------------------------------
            when "100000" =>

    -------------------------------------------------------------
            -- Logical Shift Right Immediate - 'LSRI'
    -------------------------------------------------------------
            when "100001" =>

    -------------------------------------------------------------
            -- Load Upper Immediate - 'LUI'
    -------------------------------------------------------------
            when "100010" =>

    -------------------------------------------------------------
            -- Logical Nand Immediate - 'NANDI'
    -------------------------------------------------------------
            when "100011" =>

    -------------------------------------------------------------
            -- Logical Nor Immediate - 'NORI'
    -------------------------------------------------------------
            when "100100" =>

    -------------------------------------------------------------
            -- Logical Or Immediate - 'ORI'
    -------------------------------------------------------------
            when "100101" =>

    -------------------------------------------------------------
            -- Store - 'STR'
    -------------------------------------------------------------
            when "100110" =>

    -------------------------------------------------------------
            --Store Byte - 'STRB'
    -------------------------------------------------------------
            when "100111" =>

    -------------------------------------------------------------
            -- Store Halfword - 'STRH'
    -------------------------------------------------------------
            when "101000" =>

    -------------------------------------------------------------
            -- Subtract Immediate - 'SUBI'
    -------------------------------------------------------------
            when "101001" =>

    -------------------------------------------------------------
            -- Logical Exclusive Nor Immediate - 'XNORI'
    -------------------------------------------------------------
            when "101010" =>

    -------------------------------------------------------------
            -- Logical Exclusive Or Immediate - 'XORI'
    -------------------------------------------------------------
            when "101011" =>

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

    -------------------------------------------------------------
            -- Branch and Link - 'BL'
    -------------------------------------------------------------
            when "111101" =>

    -------------------------------------------------------------
            -- Branch and Return - 'BR'
    -------------------------------------------------------------
            when "111110" =>

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

--########################################################################################################--
        -- End 'J' type
--########################################################################################################--
        end case;

    end process;


end Behavioral;
