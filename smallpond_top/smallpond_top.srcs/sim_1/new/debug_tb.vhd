----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2018 03:56:41 PM
-- Design Name: 
-- Module Name: debug_tb - Behavioral
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

entity debug_tb is
--  Port ( );
end debug_tb;

architecture Behavioral of debug_tb is

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
            mem_read: out std_logic;
            
            pc_in : in std_logic_vector(31 downto 0);
    
            uart_rx: in std_logic;
            uart_tx: out std_logic
        );
    end component;

begin


end Behavioral;
