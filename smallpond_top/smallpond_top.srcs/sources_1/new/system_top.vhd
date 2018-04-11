----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2018 01:33:50 PM
-- Design Name: 
-- Module Name: system_top - Behavioral
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

entity system_top is
       port(
            clk_100 : in STD_LOGIC;
            reset_in : in STD_LOGIC;
            halt : in STD_LOGIC;
            led : out STD_LOGIC_VECTOR(15 downto 0);
            sw : in STD_LOGIC_VECTOR(15 downto 0)
       
       );
end system_top;

architecture Behavioral of system_top is

    attribute dont_touch : string;
    signal memory_clk : STD_LOGIC := '0';
    signal cpu_clk_8 : STD_LOGIC := '0';
    signal clk_divider : STD_LOGIC_VECTOR(1 downto 0) := "00";
    
    signal memory_read_out : STD_LOGIC := '0';
    signal memory_ready : STD_LOGIC := '0';
    signal memory_write_out : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal memory_data_in : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal memory_data_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    signal memory_address_out : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
    attribute dont_touch of memory_address_out : signal is "true";
     
    signal cpu_clk : STD_LOGIC := '0';
    attribute dont_touch of cpu_clk : signal is "true";
        
    component smallpond_top is
    Port (clk_in : in STD_LOGIC;
            reset_in : in STD_LOGIC;
            halt_request : in STD_LOGIC;
            memory_data_in : in STD_LOGIC_VECTOR(31 downto 0);
            memory_data_out : out STD_LOGIC_VECTOR(31 downto 0);
            memory_ready : in STD_LOGIC;
            memory_read_out : out STD_LOGIC;
            memory_write_out : out STD_LOGIC_VECTOR(3 downto 0);
            memory_address_out : out STD_LOGIC_VECTOR(31 downto 0)   
            );
    
    end component;

    component clk_div is
      Port ( 
        cpu_clk_8 : out STD_LOGIC;
        mem_clk : out STD_LOGIC;
        clk_in : in STD_LOGIC
      );
    end component;
    
    
    component memory is
        Port ( 
            clka : in STD_LOGIC;
            rsta : in STD_LOGIC;
            ena : in STD_LOGIC;
            wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
            addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
            dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
            douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
            rsta_busy : out STD_LOGIC
        );
    end component;

begin

    cpu : smallpond_top port map (  clk_in => cpu_clk,
                                    reset_in => reset_in,
                                    halt_request => halt,
                                    memory_data_in => memory_data_in,
                                    memory_data_out => memory_data_out,
                                    memory_ready => memory_ready,
                                    memory_read_out => memory_read_out,
                                    memory_write_out => memory_write_out,
                                    memory_address_out => memory_address_out
                                    );    
    
    clock_gen :  clk_div port map(  cpu_clk_8 => cpu_clk_8,
                                    mem_clk => memory_clk,
                                    clk_in => clk_100);
                                    
    mem : memory port map(   clka => memory_clk,
                                rsta => reset_in,
                                ena => memory_read_out,
                                wea => memory_write_out,
                                addra => memory_address_out,
                                dina => memory_data_out,
                                douta => memory_data_in,
                                rsta_busy => memory_ready);
    
    
                                    
    clock_division : process(cpu_clk_8)  
    begin
        if rising_edge(cpu_clk_8) then
            if clk_divider = "11" then
                clk_divider <= "00";
            else
                clk_divider <= clk_divider + 1;
            end if;
        end if;
    end process;
        
    cpu_clk <= clk_divider(1);  
    


end Behavioral;
