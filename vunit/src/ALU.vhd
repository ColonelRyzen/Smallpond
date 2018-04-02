library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.ALL;

---------- ALU 32-bit VHDL ---------------------

entity ALU is
Port (  clk_in : in STD_LOGIC;
        reset_in : in STD_LOGIC;
        --Inputs
        a, b	: in STD_LOGIC_VECTOR(31 downto 0);		-- 2 inputs 32-bit
        ALU_OP	: in STD_LOGIC_VECTOR(3 downto 0);      -- 1 input 4-bit for selecting function
        SUB		: in std_logic;							-- determines if subtracting or adding
        
        --Outputs
        Result  : out  STD_LOGIC_VECTOR(31 downto 0);	-- Result of ALU
        
        --input/output
        CPSR	: out STD_LOGIC_VECTOR(3 downto 0)      -- N, Z, C, V
        --counter: out integer range 0 to 4
        );
end ALU;

architecture Behavioral of ALU is

signal carryOut	: std_logic := '0';
signal carryIn	: std_logic	:= '0';
signal negative	: std_logic	:= '0';
signal overflow	: std_logic	:= '0';

signal tmp		: std_logic_vector (32 downto 0);
signal clk_counter : integer range 0 to 5 := 0;

begin

    clock_counter: process (clk_in, reset_in)
    begin
        if reset_in = '1' then
            clk_counter <= 0;
        elsif rising_edge(clk_in) then
            if clk_counter = 5 then
                clk_counter <= 0;
                --counter <= clk_counter;
            else
                clk_counter <= clk_counter + 1;
                --counter <= clk_counter;
            end if;
        end if;
    end process;

    alu: process(clk_in)
    begin
        if rising_edge(clk_in) then
            if clk_counter = 3 then
                case ALU_OP is
                    when "0000" => 			  -- AND
                        tmp <= '0' & (a AND b);
                        Result <= a AND b;
                    
                    when "0001" => 			  -- OR
                        tmp <= '0' & (a OR b);
                        Result <= a OR b;
                        
                    when "0010" => 			  -- NOT
                        tmp <=  '0' & (NOT a);
                        Result <= NOT a;
                        
                    when "0011" => 			  -- NAND
                        tmp <= '0' & (a NAND b);
                        Result <= a NAND b;
                    
                    when "0100" => 			  -- NOR
                        tmp <= '0' & (a NOR b);
                        Result <= a NOR b;
                        
                    when "0101" => 			  -- XOR
                        tmp <= '0' & (a XOR b);
                        Result <= a XOR b;
                        
                    when "0110" => 			  -- XNOR
                        tmp <= '0' & (a XNOR b);
                        Result <= a XNOR b;
                        
                    when "0111" => 			  -- ADDITION / SUBTRACTION
                       if (SUB = '0') then
                           tmp <= ('0' & a) + ('0' & b);
                           Result <= a + b;
                       else
                           tmp <= ('0' & a) - ('0' & b);
                           Result <= a - b;
                       end if;
                       
                       -- set Carryout flag
                        Carryout <= tmp(32);    --grab extra bit (32nd) and assign that to the carryOut
                    
                       --set carryIn flag using : carryOut, A's MSB (31st), B's MSB (31st), tmp(31)
                       if ( (a(31) = '0' and  b(31) = '0' and tmp(31) = '1' and carryOut = '0') or 
                           (a(31) = '0' and  b(31) = '1' and tmp(31) = '0' and carryOut = '1') or
                           (a(31) = '1' and  b(31) = '0' and tmp(31) = '1' and carryOut = '1') or
                           (a(31) = '1' and  b(31) = '1' and tmp(31) = '1' and carryOut = '1')
                       ) then
                            CarryIn <= '1';
                       end if;
                    
                    when "1000" =>              -- LSL (logically shift left)
                        tmp <= '0' & (std_logic_vector(unsigned(a) sll to_integer(unsigned(b))));
                        Result <= std_logic_vector(unsigned(a) sll to_integer(unsigned(b)));
                        
                    when "1001" =>              -- LSR (logically shift right)
                        tmp <= '0' & (std_logic_vector(unsigned(a) srl to_integer(unsigned(b))));
                        Result <= std_logic_vector(unsigned(a) srl to_integer(unsigned(b)));
                        
                    when "1010" => 			-- ASR (arithmetically shift right)
                        tmp <= '0' & (to_stdlogicvector(to_bitvector(a) sra to_integer(unsigned(b))));
                        Result <= to_stdlogicvector(to_bitvector(a) sra to_integer(unsigned(b)));
                        
                    when others => -- default case for error checking the op codes being passed in are wanted ones
                        --Result <= x"00000000";
                        tmp <= '0' & (x"00000000");
                        Result <= x"00000000";
                end case;
                
                
                -- Set the 32 bit in tmp signal into the output (Result) of ALU
                --Result <= tmp(31 downto 0);

                -- carryOut flag
                CPSR(1) <= carryOut;
                
                -- Zero flag
                if (tmp(31 downto 0) = x"00000000") then
                    CPSR(2) <= '1';	-- set zero flag to one if result = 0
                else
                    CPSR(2) <= '0';	-- set zero flag to zero if result != 0
                end if;
                
                -- negative flag
                negative <= tmp(31);
                CPSR(3) <= negative;
                
                -- overflow flag
                overflow <= carryOut xor carryIn;
                CPSR(0) <= overflow;
            end if;
            --Result <= tmp(31 downto 0);
        end if;
    end process;


end Behavioral;