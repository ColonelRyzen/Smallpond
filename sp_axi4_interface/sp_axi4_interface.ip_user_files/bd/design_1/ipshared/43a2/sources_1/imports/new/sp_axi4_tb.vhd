----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2017 10:45:48 AM
-- Design Name: 
-- Module Name: sp_axi4_tb - Behavioral
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

entity sp_axi4_tb is
  Port (
    sp_read : out std_logic; --(1 for read, 0 otherwise)
    sp_sign_extend : out std_logic; --sign extended=1
    sp_write : out std_logic; --(1 for write, 0 otherwise)
    sp_op_len : out std_logic_vector(1 downto 0); --(00:byte,01:halfword,10:word,11:invalid)
    sp_addr : out std_logic_vector(31 downto 0);
    sp_data : inout std_logic_vector(31 downto 0);
    sp_over : in std_logic; --(1 when data/operation complete, 0 otherwise)
    sp_error : in std_logic; --(1 for error)
    
    sw : in std_logic_vector(3 downto 0);
    led0_r : out std_logic;
    led0_g : out std_logic;
    led0_b : out std_logic;
    led : out std_logic_vector(3 downto 0);
    btn : in std_logic_vector(3 downto 0)
  );
end sp_axi4_tb;

architecture Behavioral of sp_axi4_tb is

--signal tmp : std_logic_vector(3 downto 0);

begin

--tmp <= sw;
led <= sp_data(3 downto 0);

sp_addr <= x"80000000";
sp_op_len <= "00";
sp_sign_extend <= '0';

process(btn(0)) begin
    sp_read <= '0';
    sp_data <= x"0000000" & sw;--tmp;
    sp_write <= '1';
end process;

process(sp_over, sp_error) begin
    if(sp_error = '1') then
        led0_r <= '1';
        led0_g <= '0';
        led0_b <= '0';
        sp_read <= '0';
        sp_write <= '0';
    elsif(sp_over = '1') then
        led0_r <= '0';
        led0_g <= '1';
        led0_b <= '0';
        sp_read <= '0';
        sp_write <= '0';
    end if;
end process;

process(btn(1)) begin
    sp_data <= x"00000000";
    led0_r <= '0';
    led0_g <= '0';
    led0_b <= '1';
end process;

process(btn(3)) begin
    sp_write <= '0';
    sp_read <= '1';
end process;

--for use without board I/O
--    stimulus : process begin
--        sp_read <= '0';
--        sp_sign_extend <= '0';
--        sp_op_len <= "00";
--        sp_addr <= x"80000000";
--        sp_data <= x"00000003";
--        sp_write <= '1';
        
--        wait for 10 ns;
        
--        sp_write <= '0';
--        sp_data <= x"00000000";
        
--        wait for 10 ns;
        
--        sp_read <= '1';
        
--        wait for 10 ns;
        
        
--    end process;

end Behavioral;
