----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2017 06:17:32 PM
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tb is
--  Port ( );
end alu_tb;

architecture Behavioral of alu_tb is
 -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
		Port (
		--Inputs
		clk_in : in STD_LOGIC;
		reset_in: in STD_LOGIC;
		a, b	: in std_logic_vector(31 downto 0);		-- 2 inputs 8-bit
		ALU_OP	: in std_logic_vector(3 downto 0);		-- 1 input 4-bit for selecting function
		SUB		: in std_logic;							-- determines if subtracting or adding
		
		--Outputs
		Result  : out  std_logic_vector(31 downto 0);	-- Result of ALU
		
		--input/output
		CPSR	: out std_logic_vector(3 downto 0)      -- N, Z, C, V
		--counter : out integer range 0 to 4
		);
    END COMPONENT;
	
	--Inputs
	    signal clk_in  : std_logic;
	    signal reset_in  : std_logic;
		signal A 		: std_logic_vector(31 downto 0);
		signal B 		: std_logic_vector(31 downto 0);
		signal ALU_OP 	: std_logic_vector(3 downto 0);
		signal SUB 		: std_logic := '0';
		signal signBit	: std_logic := '0';
	
	--Outputs
		signal Result 	: std_logic_vector(31 downto 0);
		signal CPSR 	: std_logic_vector(3 downto 0);
		--signal counter : integer range 0 to 4 := 0;
		
		constant clk_period : time := 10ns;
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          clk_in => clk_in,
          reset_in => reset_in,
          a 	 => A,
          b 	 => B,
          ALU_OP => ALU_OP,
          SUB 	 => SUB,
		  Result => Result,
		  CPSR	 => CPSR
		  --counter => counter
        );

    clk_proc: process
    begin
        clk_in <= '0';
        wait for clk_period/2;
        clk_in <= '1';
        wait for clk_period/2;
	end process;
		
   -- Stimulus process
   stimulus: process
   begin
   	    
   	    reset_in <= '1';
   	    wait for 25 ns;
   	    
   	    reset_in <= '0';
		ALU_OP <= "0000";
		A <= x"00000043";
		B <= x"00000002";
		wait for 50 ns;
		
        ALU_OP <= "0001";
        A <= x"00001010";
        B <= x"00098765";
        wait for 50 ns;
        
        ALU_OP <= "0010";
	    A <= x"00004300";
        B <= x"000ABAC0";
        wait for 50 ns;
        
        ALU_OP <= "0011";
        A <= x"00003456";
        B <= x"10101010";
        wait for 50 ns;
        
        ALU_OP <= "0100";
        A <= x"00000040";
        B <= x"00000023";
        wait for 50 ns;
        
        ALU_OP <= "0101";
        A <= x"88888888";
        B <= x"78787878";
        wait for 50 ns;
        
        ALU_OP <= "0110";
        SUB <= '1';
        A <= x"000000F6";
        B <= x"0000000A";
        wait for 50 ns;
        
        ALU_OP <= "0111";
        SUB <= '1';
        A <= x"000000F6";
        B <= x"0FFFFFFF";
        wait for 50 ns;	  
        
        ALU_OP <= "0111";
        SUB <= '0';
        A <= x"000000F6";
        B <= x"0000000A";
        wait for 50 ns;
        
        
        -- shifting left logically
        
        ALU_OP <= "1000";
        A <= x"000000F6";
        B <= x"0000000A";
        wait for 50 ns;
        
        -- shifting right logically
        ALU_OP <= "1001";
        A <= x"00F60000";
        B <= x"00000007";
        wait for 50 ns;
        
        
        -- shifting airthmatically right
        
        ALU_OP <= "1010";
        A <= x"AB000000";
        B <= x"00000007";
        wait for 50 ns;	   
        
        ALU_OP <= "1010";
        A <= x"7B000000";
        B <= x"00000007";
        wait for 50 ns;       
          
	
   end process;



end Behavioral;
