library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity smallpond_axi4_v0_1 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Master Bus Interface M00_AXI
		C_M00_AXI_START_DATA_VALUE	: std_logic_vector	:= x"AA000000";
		C_M00_AXI_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"40000000";
		C_M00_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M00_AXI_DATA_WIDTH	: integer	:= 32;
		C_M00_AXI_TRANSACTIONS_NUM	: integer	:= 4
	);
	port (
		-- Users to add ports here
		sp_read : in std_logic; --(1 for read, 0 otherwise)
		sp_write : in std_logic; --(1 for write, 0 otherwise)
		sp_op_len : in std_logic_vector(1 downto 0); --(00:byte,01:halfword,10:word,11:invalid)
		sp_addr : in std_logic_vector(31 downto 0);
		sp_data : inout std_logic_vector(31 downto 0);
		sp_over : out std_logic; --(1 when data/operation complete, 0 otherwise)
		sp_error :out std_logic; --(1 for error)
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Master Bus Interface M00_AXI

		--INPUTS

		--clock
		m00_axi_aclk	: in std_logic;
		--reset (active low)
		m00_axi_aresetn	: in std_logic;
		--initiate axi transaction (leave disconnected)
		m00_axi_init_axi_txn	: in std_logic;

			--WRITE ADDRESS CHANNEL
		--slave write address ready
		m00_axi_awready	: in std_logic;

			--WRITE DATA CHANNEL
		--slave ready for data
		m00_axi_wready	: in std_logic;

			--WRITE RESPONSE CHANNEL
		--slave write response valid
		m00_axi_bvalid	: in std_logic;
		--slave write response (status of write transaction)
		m00_axi_bresp	: in std_logic_vector(1 downto 0);

			--READ ADDRESS CHANNEL
		--slave read address ready (slave ready for instructions)
		m00_axi_arready	: in std_logic;

			--READ DATA CHANNEL
		--slave read valid
		m00_axi_rvalid	: in std_logic;
		--slave read data
		m00_axi_rdata	: in std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
		--slave read response (status of read)
		m00_axi_rresp	: in std_logic_vector(1 downto 0);

		--OUTPUTS

		--error
		m00_axi_error	: out std_logic;
		m00_axi_txn_done	: out std_logic;

			--WRITE ADDRESS CHANNEL
		--write address
		m00_axi_awaddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		--protection type (data access or instruction access)
		m00_axi_awprot	: out std_logic_vector(2 downto 0);
		--write address valid
		m00_axi_awvalid	: out std_logic;

			--WRITE DATA CHANNEL
		--write data (data to be written)
		m00_axi_wdata	: out std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
		--write strobes (correspond to which byte lanes of channel contain valid data)
		m00_axi_wstrb	: out std_logic_vector(C_M00_AXI_DATA_WIDTH/8-1 downto 0);
		--write valid (valid write data and strobes available)
		m00_axi_wvalid	: out std_logic;

			--WRITE RESPONSE CHANNEL
		--master response ready (master can accept write response)
		m00_axi_bready	: out std_logic;

			--READ ADDRESS CHANNEL
		--read address (first address of read transfer)
		m00_axi_araddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		--protection type of transaction
		m00_axi_arprot	: out std_logic_vector(2 downto 0); --find and set to null value
		--read address valid
		m00_axi_arvalid	: out std_logic;

			--READ DATA CHANNEL
		--master read ready (master can read data/response)
		m00_axi_rready	: out std_logic

	);
end smallpond_axi4_v0_1;

architecture arch_imp of smallpond_axi4_v0_1 is

	-- component declaration
	component smallpond_axi4_v0_1_M00_AXI is
		generic (
		C_M_START_DATA_VALUE	: std_logic_vector	:= x"AA000000";
		C_M_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"40000000";
		C_M_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_DATA_WIDTH	: integer	:= 32;
		C_M_TRANSACTIONS_NUM	: integer	:= 4
		);
		port (
		INIT_AXI_TXN	: in std_logic;
		ERROR	: out std_logic;
		TXN_DONE	: out std_logic;
		M_AXI_ACLK	: in std_logic;
		M_AXI_ARESETN	: in std_logic;
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0);
		M_AXI_AWVALID	: out std_logic;
		M_AXI_AWREADY	: in std_logic;
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
		M_AXI_WVALID	: out std_logic;
		M_AXI_WREADY	: in std_logic;
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		M_AXI_BVALID	: in std_logic;
		M_AXI_BREADY	: out std_logic;
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0);
		M_AXI_ARVALID	: out std_logic;
		M_AXI_ARREADY	: in std_logic;
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_RRESP	: in std_logic_vector(1 downto 0);
		M_AXI_RVALID	: in std_logic;
		M_AXI_RREADY	: out std_logic
		);
	end component smallpond_axi4_v0_1_M00_AXI;

	-- signal declarations
	--to be used as transfer/temp data, before assigning to real entity output
	signal thalfword_0 : std_logic_vector(15 downto 0) := x"00000000"; --temp halfword 0
	signal thalfword_1 : std_logic_vector(15 downto 0) := x"00000000"; --temp halfword 1
	signal taddress : std_logic_vector(31 downto 0) := x"00000000"; --temp address
	signal step : std_logic_vector(1 downto 0) := '00';--current step
		--00 for ready, 01 for step 1, 10 for step 2, 11 for done

begin

-- Instantiation of Axi Bus Interface M00_AXI
smallpond_axi4_v0_1_M00_AXI_inst : smallpond_axi4_v0_1_M00_AXI
	generic map (
		C_M_START_DATA_VALUE	=> C_M00_AXI_START_DATA_VALUE,
		C_M_TARGET_SLAVE_BASE_ADDR	=> C_M00_AXI_TARGET_SLAVE_BASE_ADDR,
		C_M_AXI_ADDR_WIDTH	=> C_M00_AXI_ADDR_WIDTH,
		C_M_AXI_DATA_WIDTH	=> C_M00_AXI_DATA_WIDTH,
		C_M_TRANSACTIONS_NUM	=> C_M00_AXI_TRANSACTIONS_NUM
	)
	port map (
		INIT_AXI_TXN	=> m00_axi_init_axi_txn,
		ERROR	=> m00_axi_error,
		TXN_DONE	=> m00_axi_txn_done,
		M_AXI_ACLK	=> m00_axi_aclk,
		M_AXI_ARESETN	=> m00_axi_aresetn,
		M_AXI_AWADDR	=> m00_axi_awaddr,
		M_AXI_AWPROT	=> m00_axi_awprot,
		M_AXI_AWVALID	=> m00_axi_awvalid,
		M_AXI_AWREADY	=> m00_axi_awready,
		M_AXI_WDATA	=> m00_axi_wdata,
		M_AXI_WSTRB	=> m00_axi_wstrb,
		M_AXI_WVALID	=> m00_axi_wvalid,
		M_AXI_WREADY	=> m00_axi_wready,
		M_AXI_BRESP	=> m00_axi_bresp,
		M_AXI_BVALID	=> m00_axi_bvalid,
		M_AXI_BREADY	=> m00_axi_bready,
		M_AXI_ARADDR	=> m00_axi_araddr,
		M_AXI_ARPROT	=> m00_axi_arprot,
		M_AXI_ARVALID	=> m00_axi_arvalid,
		M_AXI_ARREADY	=> m00_axi_arready,
		M_AXI_RDATA	=> m00_axi_rdata,
		M_AXI_RRESP	=> m00_axi_rresp,
		M_AXI_RVALID	=> m00_axi_rvalid,
		M_AXI_RREADY	=> m00_axi_rready
	);

	-- Add user logic here

	--set protections
	m00_axi_arprot <= "010" -- data, non-secure, unprivileged
	m00_axi_awprot <= "010" -- data, non-secure, unprivileged

	process(sp_error) begin
		if sp_error='1' then
			--SCREAM HELP
		end if;
	end process;


--this code is awful and probably incorrect
	process(m00_axi_aresetn, sp_read, sp_write)
	begin
		taddress <= sp_addr;
		if m00_axi_aresetn = '0' then --RESET
			--reset?
			m00_axi_arvalid <= '0';
			m00_axi_rready <= '0';
			m00_axi_wstrb <= x"0";
			m00_axi_awvalid <= '0';
			m00_axi_wvalid <= '0';
			m00_axi_wstrb <= x"0";
			m00_axi_bready <= '0';
			step <= "00";
			sp_over <= '0';
		elsif sp_read='1' and step="00" then --READ
			step <= "01";
			m00_axi_araddr <= taddress;
			m00_axi_arvalid <= '1'; --assert read_address_valid
		elsif sp_write='1' and step="00" then --WRITE
			step <= "01";
			m00_axi_awaddr <= taddress;
			thalfword_0 <= sp_data(15 downto 0);
			thalfword_1 <= sp_data(31 downto 16);
			if sp_op_len = "00" then --writing byte
				m00_axi_wstrb <= "0001"; --x"1"
				step <= "10";
			elsif sp_op_len = "01" then --writing halfword (2 bytes)
				step <= "10";
				m00_axi_wstrb <= "0011"; --x"3"
			elsif sp_op_len = "10" then --writing word (4 bytes)
				m00_axi_wstrb <= "0011"; --only write lower half bytes in first cycle
				--send first word here
				m00_axi_wdata <= x"0000" & thalfword_1;
				m00_axi_awvalid <= '1';
				m00_axi_wvalid <= '1';
			else
				sp_error <= '1'; --is there a way to process sp_error=1 in a single place?
			end if;
		elsif sp_data='0' and sp_write='0' and m00_axi_aresetn='1' then
			step = '00'; --ready to process a request for Smallpond
			--other things here?
		else --do nothing
			--de-initialize things here as well???
			m00_axi_arvalid <= '0';
			m00_axi_rready <= '0';
			m00_axi_wstrb <= x"0";
			m00_axi_awvalid <= '0';
			m00_axi_wvalid <= '0';
			m00_axi_wstrb <= x"0";
			m00_axi_bready <= '0';
			--master signals to zero???
		end if;
	end process;

--READING PROCESSES--!~

	--accept/finalize handshake
	process begin
		wait until sp_read='1' and step="01" and rising_edge(m00_axi_aclk) and m00_axi_arready='1' and m00_axi_arvalid='1';
			m00_axi_arvalid <= '0'; --okay to de-assert read_address-ready
	end process;

	--if data is ready to be read, get ready to read it
	process begin
		wait until sp_read='1' and step="01" and rising_edge(m00_axi_aclk) and m00_axi_rvalid='1'; --wait until data is valid
			m00_axi_rready <= '1'; --assert ready to read
	end process;

	--if ready to read data read data!
	process begin
		wait until sp_read='1' and step="01"  and rising_edge(m00_axi_aclk) and m00_axi_rvalid='1' and m00_axi_rready <= '1';
			if rresp = "00" then
				thalfword_0 <= m00_axi_rdata(15 downto 0); --correct??!~
				m00_axi_rready <= '0'; --de-assert ready to read (already read)
				if sp_op_len = "00" then --already read 2 bytes (discard 2nd). No byte selection in AXI4-lite
					step <= "11";
					sp_data <= x"000000" & thalfword_0(7 downto 0);
					sp_over <= '1';
				elsif sp_op_len = "01" then --already read 2 bytes
					step <= "11";
					sp_data <= x"0000" & thalfword_0;
					sp_over <= '1';
				elsif sp_op_len = "10" then --already read 2 bytes, read 2 more
					step <= "10";
					--read 2 more bytes
					taddress <= taddress+2; --next address to read
					m00_axi_arvalid <= '1'; --assert read_address_valid
					--wait for next rising clock edge and read_address_ready
				else
					sp_error <= '1';
				end if;
			else
				sp_error <= '1';
			end if;
	end process;

	--if supposed to read full word, begin reading second word (finalize handshake)
	process begin
		wait until sp_read='1' and step="10" and rising_edge(m00_axi_aclk) and m00_axi_arready='1' and m00_axi_arvalid='1';
			m00_axi_arvalid <= '0'; --okay to de-assert read_address-ready
	end process;

	--get ready to read second halfword
	process begin
		wait until sp_read='1' and step="10" and rising_edge(m00_axi_aclk) and m00_axi_rvalid='1'; --wait until data is valid
			m00_axi_rready <= '1'; --assert ready to read
	end process;

	--read second halfword
	process begin
		wait until sp_read='1' and step="10" and rising_edge(m00_axi_aclk) and m00_axi_rvalid='1' and m00_axi_rready <= '1';
			if rresp = "00" then
				thalfword_1 <= m00_axi_rdata(15 downto 0); --correct??!~
				m00_axi_rready <= '0'; --de-assert ready to read (already read)
				sp_data <= thalfword_1 & thalfword_0;
				step <= "11";
				sp_over <= '1';
			else
				sp_error <= '1';
			end if;
	end process;

	--WRITING PROCESSES--!~

	--if writing a word, write first halfword (thalfword_1)
	process begin --slave is ready to accept write address
		wait until sp_write='1' and step="01" and m00_axi_wvalid='1' and rising_edge(m00_axi_aclk) and m00_axi_awready='1';
			m00_axi_awvalid <= '0';
	end process;

	process begin --slave is ready to accept data
		wait until sp_write='1' and step="01" and m00_axi_wvalid='1' and rising_edge(m00_axi_aclk) and m00_axi_wready='1';
			m00_axi_wvalid <= '0';
	end process;

	process begin --response is valid, signal ready to receive response
		wait until sp_write='1' and step="01" and rising_edge(m00_axi_aclk) and m00_axi_bvalid='1';
			m00_axi_bready <= '1';
	end process;

	process begin
		wait on sp_write='1' and step="01" and m00_axi_bresp and m00_axi_aclk='1'; --???? no idea if this is correct
			if m00_axi_bresp="00" then
				taddress <= taddress+2; --ready address to be correct
				step <= "10"; --next step
				m00_axi_wdata <= x"0000" & thalfword_0; --set data
				m00_axi_awvalid <= '1'; --signal address is valid
				m00_axi_wvalid <= '1'; --signal data is valid
			else -- "10" transaction failure, "11" incorrect slave address
				sp_error <= '1';
			end if;
	end process;

	--write thalfword_0
	process begin --slave is ready to accept write address
		wait until sp_write='1' and step="10" and m00_axi_wvalid='1' and rising_edge(m00_axi_aclk) and m00_axi_awready='1';
			m00_axi_awvalid <= '0';
	end process;

	process begin --slave is ready to accept data
		wait until sp_write='1' and step="10" and m00_axi_wvalid='1' and rising_edge(m00_axi_aclk) and m00_axi_wready='1';
			m00_axi_wvalid <= '0';
	end process;

	process begin --response is valid, signal ready to receive response
		wait until sp_write='1' and step="10" and rising_edge(m00_axi_aclk) and m00_axi_bvalid='1';
			m00_axi_bready <= '1';
	end process;

	process begin
		wait on sp_write='1' and step="10" and m00_axi_bresp and m00_axi_aclk='1'; --???? no idea if this is correct
			if m00_axi_bresp="00" then
				step <= "11"; --done
				sp_over='1';
			else -- "10" transaction failure, "11" incorrect slave address
				sp_error <= '1';
			end if;
	end process;

	-- User logic ends

end arch_imp;
