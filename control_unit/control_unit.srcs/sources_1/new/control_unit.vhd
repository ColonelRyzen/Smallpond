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
           reg_write_out : out STD_LOGIC;
           counter_bit_out : out STD_LOGIC;
           cpsr_set_bit_out : out STD_LOGIC;
           alu_src_out : out STD_LOGIC;
           alu_op_out : out STD_LOGIC_VECTOR (3 downto 0);
           pc_src_out : out STD_LOGIC;
           jump_out : out STD_LOGIC;
           mem_read_out : out STD_LOGIC;
           mem_write_out : out STD_LOGIC;
           mem_to_reg_out : out STD_LOGIC;
           cpsr_bits_in : in STD_LOGIC_VECTOR (5 downto 0);
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
    -- Case statement runs on 100MHz clock
    -- Case for every instruction
    -- Checks in order of instructions in the spreadsheet
    -- 000001 -> 001100 are the 'A' type
    -- 011000 -> 101100 are the 'I' type
    -- 111100 -> 111110 are the 'B' type
    -- 111111 is the 'J' type
    -- Case comment format is "-- Instruction name - 'instruction alias'"
    
        case op_code_in is
        -- Begin 'A' type
            -- Addition - 'ADD'
            when "000001" =>
            
            -- Logical And - 'AND'
            when "000010" =>
            
            -- Arithmatic Shift Right - 'ASR'
            when "000011" =>
            
            -- Logical Shift Left - 'LSL'
            when "000100" =>
            
            -- Logical Shift Right - 'LSR'
            when "000101" =>
            
            -- Logical Nand - 'NAND'
            when "000110" =>
            
            -- Logical Nor - 'NOR'
            when "000111" =>
            
            -- Logical Not - 'NOT'
            when "001000" =>
            
            -- Logical Or - 'OR'
            when "001001" =>
            
            -- Subtract - 'SUB'
            when "001010" =>
            
            -- Logical Exclusive Nor - 'XNOR'
            when "001011" =>
            
            -- Logical Exclusive Or - 'XOR'
            when "001100" =>
            
        -- End 'A' tpye
        
        -- Begin 'I' type
            -- Addition Immediate - 'ADDI'
            when "011000" =>
            
            -- Logical And Immediate - 'ANDI'
            when "011001" =>
            
            -- Arithmatic Shift Right Immediate - 'ASRI'
            when "011010" =>
            
            -- Load - 'LDR'
            when "011011" =>
            
            -- Load Byte - 'LDRB'            
            when "011100" =>
            
            -- Load Byte Unsigned - 'LDRBU'
            when "011101" =>
            
            -- Load Halfword - 'LDRH'
            when "011110" =>
            
            -- Load Halfword Unsigned - 'LDRHU'
            when "011111" =>
            
            -- Logical Shift Left Immediate - 'LSLI'
            when "100000" =>
            
            -- Logical Shift Right Immediate - 'LSRI'
            when "100001" =>
            
            -- Load Upper Immediate - 'LUI'
            when "100010" =>
            
            -- Logical Nand Immediate - 'NANDI'
            when "100011" =>
            
            -- Logical Nor Immediate - 'NORI'
            when "100100" =>
            
            -- Logical Or Immediate - 'ORI'
            when "100101" =>
            
            -- Store - 'STR'
            when "100110" =>
            
            --Store Byte - 'STRB'
            when "100111" =>
            
            -- Store Halfword - 'STRH'
            when "101000" =>
            
            -- Subtract Immediate - 'SUBI'
            when "101001" =>
            
            -- Logical Exclusive Nor Immediate - 'XNORI'
            when "101010" =>
            
            -- Logical Exclusive Or Immediate - 'XORI'
            when "101011" =>
            
        -- End 'I' type
        
        -- Begin 'B' type
            -- Branch - 'B'
            when "111100" =>
            
            -- Branch and Link - 'BL'
            when "111101" =>
            
            -- Branch and Return - 'BR'
            when "111110" =>
        -- End 'B' type
        
        -- Begin 'J' type
            -- Jump - 'J'
            when "111111" =>
        -- End 'J' type
        end case;
    
    end process;
    

end Behavioral;
