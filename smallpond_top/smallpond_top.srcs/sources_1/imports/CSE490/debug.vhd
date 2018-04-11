library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity debug is
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
        mem_write: out std_logic;
        mem_read: out std_logic;

        uart_rx: in std_logic;
        uart_tx: out std_logic
    );
end debug;

architecture behavioral of debug is
    component basic_uart is
      port (
        clk: in std_logic;                          -- 36x oversampling (cpu_clk = 115200 baud)
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

    signal rx_data: std_logic_vector(7 downto 0);
    signal rx_valid: std_logic;

    signal tx_data : std_logic_vector(7 downto 0) := x"00";
    signal tx_enable : std_logic := '0';
    signal tx_ready : std_logic;

    type dbg_state is (
        D1,
        D2,
        D3,
        D4,
        D5,
        D6,
        D7,
        D8,
        D9
    );

    signal state: dbg_state := D1;
    signal cmd: std_logic_vector(7 downto 0) := x"00";

    signal halt: std_logic := '0';

    signal data_l: std_logic_vector(7 downto 0);
    signal data_h: std_logic_vector(7 downto 0);
    signal mem_address : std_logic_vector(31 downto 0);
    signal mem_data : std_logic_vector(31 downto 0);
    signal reg: std_logic_vector(4 downto 0);
    signal register_value : std_logic_vector(31 downto 0);

    signal bp0_addr: std_logic_vector(15 downto 0) := x"0000";
    signal bp0_enabled: std_logic := '1';

    attribute mark_debug : string;
    attribute keep : string;

    attribute mark_debug of state : signal is "true";
    attribute keep of state : signal is "true";

    attribute mark_debug of cmd : signal is "true";
    attribute keep of cmd : signal is "true";

    attribute mark_debug of halt : signal is "true";
    attribute keep of halt : signal is "true";

    attribute mark_debug of reg : signal is "true";
    attribute keep of reg : signal is "true";

    attribute mark_debug of mem_addr_out : signal is "true";
    attribute keep of mem_addr_out : signal is "true";

    attribute mark_debug of mem_data_in : signal is "true";
    attribute keep of mem_data_in : signal is "true";

    attribute mark_debug of rx_data : signal is "true";
    attribute keep of rx_data : signal is "true";

    attribute mark_debug of rx_valid : signal is "true";
    attribute keep of rx_valid : signal is "true";

begin

uart: basic_uart port map (
    clk => clk,
    rx_data => rx_data,
    rx_valid => rx_valid,

    tx_data => tx_data,
    tx_enable => tx_enable,
    tx_ready => tx_ready,

    tx => uart_tx,
    rx => uart_rx
);

dbg: process(clk)
begin
if rising_edge(clk) then
    tx_enable <= '0';

    reg_file_data_in <= x"00000000";
    reg_file_data_out <= x"00000000";
    read_register <= "00000";
    write_register <= "00000";
    reg_file_write_en <= '0';

    mem_read <= '0';
    mem_write <= '0';
    mem_data_out <= x"00000000";
    mem_addr_out <= x"dbdbdbdb";

    halt <= cpu_halted;

    if (bp0_enabled = '1' and pc_in = bp0_addr) then
        halt <= '1';
    end if;

    if (cmd = x"00") then
        if (rx_valid = '1') then
            cmd <= rx_data;
            state <= D1;
        end if;

    elsif (cmd = x"70") then -- 'p': Read register
        if (state = D1) then -- Wait for register to read
            if (rx_valid = '1') then
                read_register <= rx_data(4 downto 0);

                state <= D2;
            end if;

        elsif (state = D2) then
            register_value <= reg_file_data_in;
        elsif (state = D3) then  -- Write back register value
            if (tx_ready = '1') then
                tx_data <= register_value(31 downto 24);
                tx_enable <= '1';
                state <= D4;
            end if;

        elsif (state = D4) then  -- Write back register value
            if (tx_ready = '1') then
                tx_data <= register_value(23 downto 16);
                tx_enable <= '1';
                state <= D5;
            end if;

        elsif (state = D5) then  -- Write back register value
            if (tx_ready = '1') then
                tx_data <= register_value(15 downto 8);
                tx_enable <= '1';
                state <= D6;
            end if;

        elsif (state = D6) then  -- Write back register value
            if (tx_ready = '1') then
                tx_data <= register_value(7 downto 0);
                tx_enable <= '1';
                cmd <= x"00";
            end if;

        elsif (cmd = x"62") then -- 'b': Read memory BYTE
            if (state = D1) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_addr(31 downto 24) <= rx_data;
                    state <= D2;
                end if;
            if (state = D2) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_addr(23 downto 16) <= rx_data;
                    state <= D3;
                end if;
            if (state = D3) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_addr(15 downto 8) <= rx_data;
                    state <= D4;
                end if;
            if (state = D4) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_addr(7 downto 0) <= rx_data;
                    state <= D5;
                end if;

            elsif (state = D5) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get data
                    mem_data(31 downto 24) <= rx_data;
                    state <= D6;
                end if;
            elsif (state = D6) then  -- Read data
                -- Keep reading in case UART not ready
                mem_addr_out <= mem_addr;
                if (tx_ready = '1') then
                    tx_data <= mem_data_in;
                    tx_enable <= '1';
                    cmd <= x"00";
                end if;

            end if;

        elsif (cmd = x"42") then -- 'B': Write memory byte
            if (state = D1) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_address(31 downto 24) <= rx_data;
                    state <= D2;
                end if;
            elsif (state = D2) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_address(23 downto 16) <= rx_data;
                    state <= D3;
                end if;
            elsif (state = D3) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_address(15 downto 8) <= rx_data;
                    state <= D4;
                end if;
            elsif (state = D4) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get addr
                    mem_address(7 downto 0) <= rx_data;
                    state <= D5;
                end if;

            elsif (state = D5) then -- Wait for addr to write
                if (rx_valid = '1') then -- Get data
                    mem_data(7 downto 0) <= rx_data;
                    state <= D6;
                end if;
            elsif (state = D9) then
                mem_addr_out <= mem_address;
                mem_data_out <= mem_data;
                mem_write <= '1';
                cmd <= x"00";
            end if;


    elsif (cmd = x"77") then -- 'w': Read memory word
        if (state = D1) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_addr(31 downto 24) <= rx_data;
                state <= D2;
            end if;
        if (state = D2) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_addr(23 downto 16) <= rx_data;
                state <= D3;
            end if;
        if (state = D3) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_addr(15 downto 8) <= rx_data;
                state <= D4;
            end if;
        if (state = D4) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_addr(7 downto 0) <= rx_data;
                state <= D5;
            end if;

        elsif (state = D5) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(31 downto 24) <= rx_data;
                state <= D6;
            end if;
        elsif (state = D6) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(23 downto 16) <= rx_data;
                state <= D7;
            end if;
        elsif (state = D7) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(15 downto 8) <= rx_data;
                state <= D8;
            end if;
        elsif (state = D8) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(7 downto 0) <= rx_data;
                state <= D9;
            end if;
        elsif (state = D9) then  -- Read data
            -- Keep reading in case UART not ready
            mem_addr_out <= mem_addr;
            if (tx_ready = '1') then
                tx_data <= mem_data_in;
                tx_enable <= '1';
                cmd <= x"00";
            end if;

        end if;

    elsif (cmd = x"57") then -- 'W': Write memory word
        if (state = D1) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_address(31 downto 24) <= rx_data;
                state <= D2;
            end if;
        elsif (state = D2) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_address(23 downto 16) <= rx_data;
                state <= D3;
            end if;
        elsif (state = D3) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_address(15 downto 8) <= rx_data;
                state <= D4;
            end if;
        elsif (state = D4) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get addr
                mem_address(7 downto 0) <= rx_data;
                state <= D5;
            end if;

        elsif (state = D5) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(31 downto 24) <= rx_data;
                state <= D6;
            end if;
        elsif (state = D6) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(23 downto 16) <= rx_data;
                state <= D7;
            end if;
        elsif (state = D7) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(15 downto 8) <= rx_data;
                state <= D8;
            end if;
        elsif (state = D8) then -- Wait for addr to write
            if (rx_valid = '1') then -- Get data
                mem_data(7 downto 0) <= rx_data;
                state <= D9;
            end if;
        elsif (state = D9) then
            mem_addr_out <= mem_address;
            mem_data_out <= mem_data;
            mem_write <= '1';
            cmd <= x"00";
        end if;

    elsif (cmd = x"50") then -- 'P': Write register
        if (state = D1) then -- Wait for register to write
            if (rx_valid = '1') then
                reg <= rx_data;
                state <= D2;
            end if;
        elsif (state = D2) then -- Wait for value to write
            if (rx_valid = '1') then
                register_value(31 downto 24) <= rx_data;
                state <= D3;
            end if;
        elsif (state = D3) then -- Wait for value to write
            if (rx_valid = '1') then
                register_value(23 downto 16) <= rx_data;
                state <= D4;
            end if;
        elsif (state = D4) then -- Wait for value to write
            if (rx_valid = '1') then
                register_value(15 downto 8) <= rx_data;
                state <= D5;
            end if;
        elsif (state = D5) then -- Wait for value to write
            if (rx_valid = '1') then
                register_value(7 downto 0) <= rx_data;
                state <= D6;
            end if;
        elsif (state = D6) then  -- Set value
            write_register <= reg(4 downto 0);
            reg_file_data_out <= read_register;
            cmd <= x"00";
        end if;

    elsif (cmd = x"73") then -- 's': Single step
        if (state = D1) then
            halt <= '0';
            if (cpu_halted = '0') then
                state <= D2;
            end if;
        elsif (state = D2) then
            halt <= '1';
            if (cpu_halted = '1' and tx_ready = '1') then
                tx_data <= x"54";
                tx_enable <= '1';
                state <= D3;
            end if;
        elsif (state = D3) then
            if (tx_ready = '1') then
                tx_data <= x"73";
                tx_enable <= '1';
                cmd <= x"00";
            end if;
        end if;

    elsif (cmd = x"7A") then -- 'z': Set HW breakpoint
        if (state = D1) then -- Get addr high byte
            if (rx_valid = '1') then
                data_h <= rx_data;
                state <= D2;
            end if;
        elsif (state = D2) then  -- Get addr low byte
            if (rx_valid = '1') then
                data_l <= rx_data;
                state <= D3;
            end if;
        elsif (state = D3) then
            bp0_addr <= data_h & data_l;
            bp0_enabled <= '1';
            cmd <= x"00";
        end if;

    elsif (cmd = x"64") then -- 'd': Delete HW breakpoint
        bp0_enabled <= '0';
        cmd <= x"00";

    elsif (cmd = x"63") then -- 'c': Continue
        if (state = D1) then
            halt <= '0';
            if (cpu_halted = '0') then
                state <= D2;
            end if;
        elsif (state = D2) then
            if (cpu_halted = '1' and tx_ready = '1') then
                tx_data <= x"54";
                tx_enable <= '1';
                state <= D3;
            end if;
        elsif (state = D3) then
            if (tx_ready = '1') then
                tx_data <= x"7A";
                tx_enable <= '1';
                cmd <= x"00";
            end if;
        end if;

    else
        cmd <= x"00";
    end if;
end if;
end process;

halt_cpu <= halt;

end behavioral;
