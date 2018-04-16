----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2018 05:41:56 PM
-- Design Name: 
-- Module Name: uart_tb - Behavioral
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

entity uart_tb is
--  Port ( );
end uart_tb;

architecture Behavioral of uart_tb is

    component basic_uart is
        port (
            clk: in std_logic;                          -- 17x oversampling
            -- Client interface
            rx_data: out std_logic_vector(7 downto 0); -- received byte
            rx_valid: out std_logic;                  -- validates received byte (1 system clock spike)
        
            tx_data: in std_logic_vector(7 downto 0);  -- byte to send
            tx_enable: in std_logic;                   -- validates byte to send if tx_ready is '1'
            tx_ready: out std_logic;                   -- if '1', we can send a new byte, otherwise we won't take it
            -- Physical interface
            rx: in std_logic;
            tx: out std_logic
      );
    end component;

    signal clk_tb, rx_tb, tx_tb, tx_ready_tb, tx_enable_tb, rx_valid_tb : std_logic;
    signal rx_data_tb, tx_data_tb : std_logic_vector(7 downto 0);
    constant clk_period : time := 500 ns;

begin

    UUT : basic_uart port map (   clk => clk_tb,
                            rx_data => rx_data_tb,
                            rx_valid => rx_valid_tb,
                            tx_data => tx_data_tb,
                            tx_enable => tx_enable_tb,
                            tx_ready => tx_ready_tb,
                            rx => rx_tb,
                            tx => tx_tb);

    clk_proc: process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;
    
    stim : process
    begin
        rx_tb <= '0';
        rx_data_tb <= "00001111";
        rx_valid_tb <= '1';
        wait for 100 us;
        tx_enable_tb <= '1';
        tx_data_tb <= rx_data_tb;
        
        wait;
    end process;
    
    
end Behavioral;
