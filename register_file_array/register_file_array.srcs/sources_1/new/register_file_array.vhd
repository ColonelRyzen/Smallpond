----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2018 03:19:19 PM
-- Design Name: 
-- Module Name: register_file_array - Behavioral
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

entity register_file_array is
    Port ( clk_in : in STD_LOGIC;
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
--           reg_31 : out STD_LOGIC_VECTOR (31 downto 0);
--           counter : out integer range 0 to 4
            );
end register_file_array;

architecture Behavioral of register_file_array is

type register_array is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal reg: register_array;
signal clk_counter: integer range 0 to 4 :=0;

begin

    clock_counter: process(clk_in,reset_in)
        begin
            if reset_in = '1' then
                clk_counter <= 0;
            elsif rising_edge(clk_in) then
                if clk_counter = 4 then
--                    counter <= clk_counter;
                    clk_counter <= 0;
                else
                    clk_counter <= clk_counter + 1;
--                    counter <= clk_counter;
                end if;
            end if;
        end process;

    operand_fetch: process(clk_in)
        begin
            if rising_edge(clk_in) then
                if clk_counter = 0 and reset_in ='0' then
                    pc_data_out <= reg(30);
                end if;
                if clk_counter = 1 and reset_in ='0' then
                    -- Case statement to set register_0_out to read_regesiter_0
                    case read_register_0_in is
                        when "00000" =>
                            register_0_out <= x"00000000";
                        when "00001" =>
                            register_0_out <= reg(1);
                        when "00010" =>
                            register_0_out <= reg(2);
                        when "00011" =>
                            register_0_out <= reg(3);
                        when "00100" =>
                            register_0_out <= reg(4);
                        when "00101" =>
                            register_0_out <= reg(5);
                        when "00110" =>
                            register_0_out <= reg(6);
                        when "00111" =>
                            register_0_out <= reg(7);
                        when "01000" =>
                            register_0_out <= reg(8);    
                        when "01001" =>
                            register_0_out <= reg(9);
                        when "01010" =>
                            register_0_out <= reg(10);
                        when "01011" =>
                            register_0_out <= reg(11);
                        when "01100" =>
                            register_0_out <= reg(12);
                        when "01101" =>
                            register_0_out <= reg(13);
                        when "01110" =>
                            register_0_out <= reg(14);
                        when "01111" =>
                            register_0_out <= reg(15);
                        when "10000" =>
                            register_0_out <= reg(16);
                        when "10001" =>
                            register_0_out <= reg(17);    
                        when "10010" =>
                            register_0_out <= reg(18);
                        when "10011" =>
                            register_0_out <= reg(19);
                        when "10100" =>
                            register_0_out <= reg(20);
                        when "10101" =>
                            register_0_out <= reg(21);
                        when "10110" =>
                            register_0_out <= reg(22);
                        when "10111" =>
                            register_0_out <= reg(23);    
                        when "11000" =>
                            register_0_out <= reg(24);
                        when "11001" =>
                            register_0_out <= reg(25);
                        when "11010" =>
                            register_0_out <= reg(26);
                        when "11011" =>
                            register_0_out <= reg(27);
                        when "11100" =>
                            register_0_out <= reg(28);
                        when "11101" =>
                            register_0_out <= reg(29);
                        when "11110" =>
                            register_0_out <= reg(30);
                        when "11111" =>
                            register_0_out <= reg(31);
                        when others =>
                            null;
                    end case;
                    
                    -- Case statement to set register_1_out to read_regesiter_1
                    case read_register_1_in is
                       when "00000" =>
                           register_1_out <= x"00000000";
                       when "00001" =>
                           register_1_out <= reg(1);
                       when "00010" =>
                           register_1_out <= reg(2);
                       when "00011" =>
                           register_1_out <= reg(3);
                       when "00100" =>
                           register_1_out <= reg(4);
                       when "00101" =>
                           register_1_out <= reg(5);
                       when "00110" =>
                           register_1_out <= reg(6);
                       when "00111" =>
                           register_1_out <= reg(7);
                       when "01000" =>
                           register_1_out <= reg(8);    
                       when "01001" =>
                           register_1_out <= reg(9);
                       when "01010" =>
                           register_1_out <= reg(10);
                       when "01011" =>
                           register_1_out <= reg(11);
                       when "01100" =>
                           register_1_out <= reg(12);
                       when "01101" =>
                           register_1_out <= reg(13);
                       when "01110" =>
                           register_1_out <= reg(14);
                       when "01111" =>
                           register_1_out <= reg(15);
                       when "10000" =>
                           register_1_out <= reg(16);
                       when "10001" =>
                           register_1_out <= reg(17);    
                       when "10010" =>
                           register_1_out <= reg(18);
                       when "10011" =>
                           register_1_out <= reg(19);
                       when "10100" =>
                           register_1_out <= reg(20);
                       when "10101" =>
                           register_1_out <= reg(21);
                       when "10110" =>
                           register_1_out <= reg(22);
                       when "10111" =>
                           register_1_out <= reg(23);    
                       when "11000" =>
                           register_1_out <= reg(24);
                       when "11001" =>
                           register_1_out <= reg(25);
                       when "11010" =>
                           register_1_out <= reg(26);
                       when "11011" =>
                           register_1_out <= reg(27);
                       when "11100" =>
                           register_1_out <= reg(28);
                       when "11101" =>
                           register_1_out <= reg(29);
                       when "11110" =>
                           register_1_out <= reg(30);
                       when "11111" =>
                           register_1_out <= reg(31);
                       when others =>
                           null;
                    end case;
                    -- Write to PC if PC write data enabled. Else increment by 1.
                    if pc_write_in = '1' then
                        reg(30) <= pc_write_data_in;
                    else
                        reg(30) <= reg(30) + x"00000001";
                    end if;
                    cpsr_cond_bits_control_out <= reg(31)(3 downto 0);
                end if;
                
                -- Phase 2: ALU
                -- Set CPSR from ALU result if cpsr bit set
                if clk_counter = 2 and reset_in = '0' then
                    if cpsr_set_bit_in = '1' then
                        reg(31) <= cpsr_cond_bits_alu_in;
                    end if;
                end if;
                
                -- Phase 3: Memory
                -- Increment/Decrement counter if counter bit set
                if clk_counter = 3 and reset_in = '0' then
                    if counter_bit_in = '1' then
                        reg(21) <= reg(21) + x"00000001";
                        reg(22) <= reg(22) - x"00000001";
                    end if;
                end if;
                
                if clk_counter = 4 and reset_in = '0' then
                    if reg_write_in = '1' then
                        case write_register_in is
                            when "00000" =>
                                reg(0) <= x"00000000";
                            when "00001" =>
                                reg(1) <= write_data_in;
                            when "00010" =>
                                reg(2) <= write_data_in;
                            when "00011" =>
                                reg(3) <= write_data_in;
                            when "00100" =>
                                reg(4) <= write_data_in;
                            when "00101" =>
                                reg(5) <= write_data_in;
                            when "00110" =>
                                reg(6) <= write_data_in;
                            when "00111" =>
                                reg(7) <= write_data_in;
                            when "01000" =>
                                reg(8) <= write_data_in;
                            when "01001" =>
                                reg(9) <= write_data_in;
                            when "01010" =>
                                reg(10) <= write_data_in;
                            when "01011" =>
                                reg(11) <= write_data_in;
                            when "01100" =>
                                reg(12) <= write_data_in;
                            when "01101" =>
                                reg(13) <= write_data_in;
                            when "01110" =>
                                reg(14) <= write_data_in;
                            when "01111" =>
                                reg(15) <= write_data_in;
                            when "10000" =>
                                reg(16) <= write_data_in;
                            when "10001" =>
                                reg(17) <= write_data_in;
                            when "10010" =>
                                reg(18) <= write_data_in;
                            when "10011" =>
                                reg(19) <= write_data_in;
                                reg(20) <= (not write_data_in) + x"00000001";
                            when "10100" =>
                                reg(20) <= write_data_in;
                                reg(19) <= (not write_data_in) + x"00000001";
                            when "10101" =>
                                reg(21) <= write_data_in;
                            when "10110" =>
                                reg(22) <= write_data_in;
                            when "10111" =>
                                reg(23) <= write_data_in;
                            when "11000" =>
                                reg(24) <= write_data_in;
                            when "11001" =>
                                reg(25) <= write_data_in;
                            when "11010" =>
                                reg(26) <= write_data_in;
                            when "11011" =>
                                reg(27) <= write_data_in;
                            when "11100" =>
                                reg(28) <= write_data_in;
                            when "11101" =>
                                reg(29) <= write_data_in;
                            when "11110" =>
                                reg(30) <= write_data_in;
                            when "11111" =>
                                reg(31) <= write_data_in;                      
                            when others =>
                                null;
                        end case;
                    end if;
                end if;
            end if;
        
        end process;

end Behavioral;
