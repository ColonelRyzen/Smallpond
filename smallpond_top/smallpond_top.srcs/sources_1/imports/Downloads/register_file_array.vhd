----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Zachary Salim
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
signal reg: register_array := (others => x"00000000");
attribute dont_touch : string;
attribute dont_touch of reg : signal is "true";
signal clk_counter: integer range 0 to 5 :=0;

begin

    clock_counter: process(clk_in)
        begin
            if rising_edge(clk_in) then
                if clk_counter = 5 then
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
                if clk_counter = 0 and reset_in = '0' then
                    
                end if;
                if clk_counter = 1 and reset_in = '0' then
                    if read_register_0_in = "00000" then
                        register_0_out <= x"00000000";
                    else
                        register_0_out <= reg(to_integer(unsigned(read_register_0_in)));
                    end if;
                    
                    if read_register_1_in = "00000" then
                        register_1_out <= x"00000000";
                    else
                        register_1_out <= reg(to_integer(unsigned(read_register_1_in)));
                    end if;
                    
                    
                    cpsr_cond_bits_control_out <= reg(31)(3 downto 0);
                end if;
                
                if clk_counter = 2 then
                    
                end if;
                
                -- Phase 3: ALU
                -- Set CPSR from ALU result if cpsr bit set
                if clk_counter = 3 then
                    if cpsr_set_bit_in = '1' then
                        reg(31)(3 downto 0) <= cpsr_cond_bits_alu_in;
                    end if;
                    if pc_write_in = '1' then
                        reg(30) <= pc_write_data_in;
                    end if;
                end if;
                
                -- Phase 4: Memory
                -- Increment/Decrement counter if counter bit set
                if clk_counter = 4 and reset_in = '0' then
                    if counter_bit_in = '1' then
                        reg(21) <= reg(21) + x"00000001";
                        reg(22) <= reg(22) - x"00000001";
                    end if;
                end if;

                if clk_counter = 5 and reset_in = '0' then
                    if reg_write_in = '1' then
                        if write_register_in = "00000" then
                            reg(0) <= x"00000000";
                        elsif write_register_in = "10011" then
                            reg(19) <= write_data_in;
                            reg(20) <= (not write_data_in) + x"00000001";
                        elsif write_register_in = "10100" then
                            reg(20) <= write_data_in;
                            reg(19) <= (not write_data_in) + x"00000001";
                        else
                            reg(to_integer(unsigned(write_register_in))) <= write_data_in;
                        end if;
                    end if;
                    pc_data_out <= reg(30);
                end if;
                if reset_in = '1' then
                    for i in 0 to 31 loop
                        reg(i) <= x"00000000";
                    end loop;
                end if;
            end if;
        end process;

end Behavioral;