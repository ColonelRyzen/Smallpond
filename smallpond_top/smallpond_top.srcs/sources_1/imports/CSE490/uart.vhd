-- Grant Iraci 2018, MIT License
-- Heavily based off http://www.bealto.com/fpga-uart_rx.html

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basic_uart is
  port (
    clk: in std_logic;                          -- 36x oversampling
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
end basic_uart;

architecture behavioral of basic_uart is

  type fsm_state_t is (idle, active); -- common to both RX and TX FSM

  signal rx_fsm_state: fsm_state_t := idle;                -- FSM state
  signal rx_counter: integer range 0 to 16 := 0;                 -- tick count
  signal rx_bits: std_logic_vector(7 downto 0);            -- last 8 received bits
  signal rx_nbits: integer range 0 to 10 := 0;   -- number of received bits (includes start bit)

  signal tx_fsm_state: fsm_state_t := idle; -- FSM state
  signal tx_counter: integer range 0 to 16 := 0; -- tick count
  signal tx_bits: std_logic_vector(8 downto 0); -- bits to emit, includes start bit
  signal tx_nbits: integer range 0 to 10 := 0; -- number of bits left to send

begin

  -- RX FSM
  rx_process: process (clk) is
  begin
    if rising_edge(clk) then
        if (rx_fsm_state = idle) then
            rx_counter <= 0;
            rx_bits <= (others => '0');
            rx_nbits <= 0;
            rx_valid <= '0';
            if rx = '0' then
              -- start a new byte
              rx_fsm_state <= active;
            else
              -- keep idle
              rx_fsm_state <= idle;
            end if;
        elsif (rx_fsm_state = active) then
            if rx_counter = 8 then
                -- sample next RX bit (at the middle of the counter cycle)
                if rx_nbits = 9 then
                    rx_fsm_state <= idle; -- back to idle state to wait for next start bit
                    rx_valid <= rx; -- OK if stop bit is '1'
                else
                    rx_bits <= rx & rx_bits(7 downto 1); -- shift new bit in bits
                    rx_nbits <= rx_nbits + 1;
                end if;
            end if;
            if rx_counter = 16 then
                rx_counter <= 0;
            else
                rx_counter <= rx_counter + 1;
            end if;
        end if;
    end if;
  end process;

  -- TX FSM
  tx_process: process (clk) is
  begin
    if rising_edge(clk) then
        if (tx_fsm_state = idle) then
            if tx_enable = '1' then
              -- start a new bit
              tx_bits <= tx_data & '0';  -- data & start
              tx_nbits <= 10; -- send 10 bits (includes '1' stop bit)
              tx_counter <= 0;
              tx_fsm_state <= active;
            else
              -- keep idle
              tx_bits <= (others => '1');
              tx_nbits <= 0;
              tx_counter <= 0;
              tx_fsm_state <= idle;
            end if;
        elsif (tx_fsm_state = active) then
            if tx_counter = 16 then
                -- send next bit
                if tx_nbits = 0 then
                    -- turn idle
                    tx_fsm_state <= idle;
                    tx_bits <= (others => '1');
                else
                    tx_bits <= '1' & tx_bits(8 downto 1);
                    tx_nbits <= tx_nbits - 1;
                end if;
                tx_counter <= 0;
            else
                tx_counter <= tx_counter + 1;
            end if;
        end if;
    end if;
  end process;

rx_data <= rx_bits;
tx <= tx_bits(0);
tx_ready <= '1' when tx_fsm_state = idle else '0';

end behavioral;
