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

    signal halt_cpu, cpu_halted, reg_file_write_en, mem_enable : std_logic;
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

--          Reg Write testbench
--            if state = 0 then    
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"50";
--                    tx_enable_tb <= '1';
--                    state <= 1;
--                end if;
--            elsif state = 1 then
--                state <= 2;
--            elsif state = 2 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"05";
--                    tx_enable_tb <= '1';
--                    state <= 3;
--                end if; 
--            elsif state = 3 then
--                state <= 4;
--            elsif state = 4 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"FF";
--                    tx_enable_tb <= '1';
--                    state <= 5;
--                end if; 
--            elsif state = 5 then
--                state <= 6;
--            elsif state = 6 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"FF";
--                    tx_enable_tb <= '1';
--                    state <= 7;
--                end if;
--            elsif state = 7 then
--                state <= 8;
--            elsif state = 8 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"FF";
--                    tx_enable_tb <= '1';
--                    state <= 9;
--                end if;
--            elsif state = 9 then
--                state <= 10;
--            elsif state = 10 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"FF";
--                    tx_enable_tb <= '1';
--                    state <= 11;
--                end if;
--            elsif state = 11 then
--                state <= 11;
--            end if;

            if state = 0 then    
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"57";
                    tx_enable_tb <= '1';
                    state <= 1;
                end if;
            elsif state = 1 then
                if (tx_ready_tb = '0') then
                    state <= 2;
                end if;
            elsif state = 2 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 3;
                end if; 
            elsif state = 3 then
                if (tx_ready_tb = '0') then
                    state <= 4;
                end if;
            elsif state = 4 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 5;
                end if; 
            elsif state = 5 then
                if (tx_ready_tb = '0') then
                    state <= 6;
                end if;
            elsif state = 6 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 7;
                end if;
            elsif state = 7 then
                if (tx_ready_tb = '0') then
                    state <= 8;
                end if;
            elsif state = 8 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"08";
                    tx_enable_tb <= '1';
                    state <= 9;
                end if;
            elsif state = 9 then
                if (tx_ready_tb = '0') then
                    state <= 10;
                end if;
            elsif state = 10 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"FF";
                    tx_enable_tb <= '1';
                    state <= 11;
                end if;
            elsif state = 11 then
                if (tx_ready_tb = '0') then
                    state <= 12;
                end if;
            elsif state = 12 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"FF";
                    tx_enable_tb <= '1';
                    state <= 13;
                end if;
            elsif state = 13 then
                if (tx_ready_tb = '0') then
                    state <= 14;
                end if;
            elsif state = 14 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"FF";
                    tx_enable_tb <= '1';
                    state <= 15;
                end if;
            elsif state = 15 then
                if (tx_ready_tb = '0') then
                    state <= 16;
                end if;
            elsif state = 16 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"FF";
                    tx_enable_tb <= '1';
                    state <= 17;
                end if;
            elsif state = 17 then
                state <= 18;
            elsif state <= 18 then
                state <= 19;
            elsif state = 19 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"77";
                    tx_enable_tb <= '1';
                    state <= 20;
                end if;
            elsif state = 20 then
                if (tx_ready_tb = '0') then
                    state <= 21;
                end if;
            elsif state = 21 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 22;
                end if;
            elsif state = 22 then
                if (tx_ready_tb = '0') then
                    state <= 23;
                end if;
            elsif state = 23 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 24;
                end if;
            elsif state = 24 then
                if (tx_ready_tb = '0') then
                    state <= 25;
                end if;
            elsif state = 25 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"00";
                    tx_enable_tb <= '1';
                    state <= 26;
                end if;
            elsif state = 26 then
                if (tx_ready_tb = '0') then
                    state <= 27;
                end if;
            elsif state = 27 then
                if (tx_ready_tb = '1') then
                    tx_data_tb <= x"08";
                    tx_enable_tb <= '1';
                    state <= 28;
                end if;
            elsif state = 28 then
                state <= 28;
--            elsif state = 29 then
--                state <= 30;
--            elsif state = 30 then
--                state <= 31;
--            elsif state = 31 then
--                state <= 32;
--            elsif state = 32 then
--                state <= 33;
--            elsif state = 33 then
--                state <= 34;
--            elsif state = 34 then
--                state <= 35;
--            elsif state = 35 then
--                if (tx_ready_tb = '0') then
--                    state <= 36;
--                end if;
--            elsif state = 36 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"77";
--                    tx_enable_tb <= '1';
--                    state <= 37;
--                end if;
--            elsif state = 37 then
--                if (tx_ready_tb = '0') then
--                    state <= 38;
--                end if;
--            elsif state = 38 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 39;
--                end if;
--            elsif state = 39 then
--                if (tx_ready_tb = '0') then
--                    state <= 40;
--                end if;
--            elsif state = 40 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 41;
--                end if;
--            elsif state = 41 then
--                if (tx_ready_tb = '0') then
--                    state <= 42;
--                end if;
--            elsif state = 42 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"00";
--                    tx_enable_tb <= '1';
--                    state <= 43;
--                end if;
--            elsif state = 43 then
--                if (tx_ready_tb = '0') then
--                    state <= 44;
--                end if;
--            elsif state = 44 then
--                if (tx_ready_tb = '1') then
--                    tx_data_tb <= x"08";
--                    tx_enable_tb <= '1';
--                    state <= 45;
--                end if;
--            elsif state = 45 then
--                state <= 45;
            end if;
            
            
        end if;
    end process;

end Behavioral;
