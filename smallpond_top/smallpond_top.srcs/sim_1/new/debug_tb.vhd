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
    port( clk : in std_logic;
            uart_rx : in std_logic;
            uart_tx : out std_logic);
end debug_tb;

architecture Behavioral of debug_tb is

    signal halt_cpu, cpu_halted, reg_file_write_en, mem_read : std_logic;
    signal reg_file_data_in, reg_file_data_out, mem_data_in, mem_data_out, mem_addr_out, pc_in : std_logic_vector(31 downto 0);
    signal write_register, read_register : std_logic_vector(4 downto 0);
    signal mem_write : std_logic_vector(3 downto 0);


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
    signal state : integer := 0;
    constant clk_period : time := 500 ns;
    
    
    
begin

    clk_proc: process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;


                            
        uart : basic_uart port map (   clk => clk_tb,
                                    rx_data => rx_data_tb,
                                    rx_valid => rx_valid_tb,
                                    tx_data => tx_data_tb,
                                    tx_enable => tx_enable_tb,
                                    tx_ready => tx_ready_tb,
                                    rx => uart_rx,
                                    tx => uart_tx);
                            
    process (clk_tb)
    begin
        if rising_edge(clk_tb) then
            tx_enable_tb <= '0';
--            if state = 0 then    
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"77";
--                    tx_enable_tb <= '1';
--                    state <= 1;
--                end if;
--            elsif (state = 1) then
--                state <= 2;
--            elsif state = 2 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 3;
--                end if;
--            elsif state = 3 then
--                state <= 4;
--            elsif state = 4 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 5;
--                end if;
--            elsif state = 5 then
--                state <= 6;
--            elsif state <= 6 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 7;
--                end if;
--            elsif state = 7 then
--                state <= 8;
--            elsif state = 8 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 9;
--                end if;
--            elsif state = 9 then
--                state <= 9;
--            end if;
            if state = 0 then    
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"50";
                    tx_enable_tb <= '1';
                    state <= 1;
                end if;
            elsif state = 1 then
                state <= 2;
            elsif state = 2 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= ""
                end if; 
                state <= 3;
            end if;
        end if;
    end process;

end Behavioral;
