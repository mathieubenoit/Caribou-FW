-------------------------------------------------------------------------------
-- Filename:        slave_attachment.vhd
-- Version:         v2.0
-- Description:     AXI slave attachment supporting single transfers
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author:      BSB
--
-- History:
--
--  BSB      05/20/10      -- First version
-- ~~~~~~
--  - Created the first version v1.00.a
-- ^^^^^^
-- ~~~~~~
--  SK       06/09/10      -- updated to reduce the utilization
--  1. State machine is re-designed
--  2. R and B channels are registered and AW, AR, W channels are non-registered
--  3. Address decoding is done only for the required address bits and not complete
--     32 bits
--  4. combined the response signals like ip2bus_error in optimzed code to remove the mux
--  5. Added local function "clog2" with "integer" as input in place of proc_common_pkg
--     function.
-- ^^^^^^
-- ~~~~~~
--  SK       12/16/12      -- v2.0
--  1. up reved to major version for 2013.1 Vivado release. No logic updates.
--  2. Updated the version of AXI LITE IPIF to v2.0 in X.Y format
--  3. updated the proc common version to proc_common_v4_0
--  4. No Logic Updates
-- ^^^^^^
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      access_cs machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

-------------------------------------------------------------------------------
--                     Definition of Generics
-------------------------------------------------------------------------------
-- C_IPIF_ABUS_WIDTH     -- IPIF Address bus width
-- C_IPIF_DBUS_WIDTH     -- IPIF Data Bus width
-- C_S_AXI_MIN_SIZE      -- Minimum address range of the IP
-- C_USE_WSTRB           -- Use write strobs or not
-- C_DPHASE_TIMEOUT      -- Data phase time out counter
-- C_ARD_ADDR_RANGE_ARRAY-- Base /High Address Pair for each Address Range
-- C_ARD_NUM_CE_ARRAY    -- Desired number of chip enables for an address range
-- C_FAMILY              -- Target FPGA family
-------------------------------------------------------------------------------
--                  Definition of Ports
-------------------------------------------------------------------------------
-- S_AXI_ACLK            -- AXI Clock
-- S_AXI_ARESET          -- AXI Reset
-- S_AXI_AWADDR          -- AXI Write address
-- S_AXI_AWVALID         -- Write address valid
-- S_AXI_AWREADY         -- Write address ready
-- S_AXI_WDATA           -- Write data
-- S_AXI_WSTRB           -- Write strobes
-- S_AXI_WVALID          -- Write valid
-- S_AXI_WREADY          -- Write ready
-- S_AXI_BRESP           -- Write response
-- S_AXI_BVALID          -- Write response valid
-- S_AXI_BREADY          -- Response ready
-- S_AXI_ARADDR          -- Read address
-- S_AXI_ARVALID         -- Read address valid
-- S_AXI_ARREADY         -- Read address ready
-- S_AXI_RDATA           -- Read data
-- S_AXI_RRESP           -- Read response
-- S_AXI_RVALID          -- Read valid
-- S_AXI_RREADY          -- Read ready
-- Bus2IP_Clk            -- Synchronization clock provided to User IP
-- Bus2IP_Reset          -- Active high reset for use by the User IP
-- Bus2IP_Addr           -- Desired address of read or write operation
-- Bus2IP_RNW            -- Read or write indicator for the transaction
-- Bus2IP_BE             -- Byte enables for the data bus
-- Bus2IP_CS             -- Chip select for the transcations
-- Bus2IP_RdCE           -- Chip enables for the read
-- Bus2IP_WrCE           -- Chip enables for the write
-- Bus2IP_Data           -- Write data bus to the User IP
-- IP2Bus_Data           -- Input Read Data bus from the User IP
-- IP2Bus_WrAck          -- Active high Write Data qualifier from the IP
-- IP2Bus_RdAck          -- Active high Read Data qualifier from the IP
-- IP2Bus_Error          -- Error signal from the IP
-------------------------------------------------------------------------------

entity axi_lite_ipif is
  generic (

    C_IPIF_ABUS_WIDTH   : integer := 32;
    C_IPIF_DBUS_WIDTH   : integer := 32;
    C_S_AXI_MIN_SIZE    : std_logic_vector(31 downto 0):= X"000001FF";
    C_USE_WSTRB         : integer := 0
        );
  port(
        -- AXI signals
    S_AXI_ACLK          : in  std_logic;
    S_AXI_ARESETN       : in  std_logic;
    S_AXI_AWADDR        : in  std_logic_vector
                          (C_IPIF_ABUS_WIDTH-1 downto 0);
    S_AXI_AWVALID       : in  std_logic;
    S_AXI_AWREADY       : out std_logic;
    S_AXI_WDATA         : in  std_logic_vector
                          (C_IPIF_DBUS_WIDTH-1 downto 0);
    S_AXI_WSTRB         : in  std_logic_vector
                          ((C_IPIF_DBUS_WIDTH/8)-1 downto 0);
    S_AXI_WVALID        : in  std_logic;
    S_AXI_WREADY        : out std_logic;
    S_AXI_BRESP         : out std_logic_vector(1 downto 0);
    S_AXI_BVALID        : out std_logic;
    S_AXI_BREADY        : in  std_logic;
    S_AXI_ARADDR        : in  std_logic_vector
                          (C_IPIF_ABUS_WIDTH-1 downto 0);
    S_AXI_ARVALID       : in  std_logic;
    S_AXI_ARREADY       : out std_logic;
    S_AXI_RDATA         : out std_logic_vector
                          (C_IPIF_DBUS_WIDTH-1 downto 0);
    S_AXI_RRESP         : out std_logic_vector(1 downto 0);
    S_AXI_RVALID        : out std_logic;
    S_AXI_RREADY        : in  std_logic;
    -- Controls to the IP/IPIF modules

    Bus2IP_Addr         : out std_logic_vector
                          (C_IPIF_ABUS_WIDTH-1 downto 0);
    Bus2IP_RD           : out std_logic;
    Bus2IP_WR           : out std_logic;
    Bus2IP_BE           : out std_logic_vector
                          (((C_IPIF_DBUS_WIDTH/8) - 1) downto 0);
    Bus2IP_Data         : out std_logic_vector
                          ((C_IPIF_DBUS_WIDTH-1) downto 0);
    IP2Bus_Data         : in  std_logic_vector
                          ((C_IPIF_DBUS_WIDTH-1) downto 0);
    IP2Bus_WrAck        : in  std_logic;
    IP2Bus_RdAck        : in  std_logic;
    IP2Bus_Error        : in  std_logic
    );
end entity axi_lite_ipif;

-------------------------------------------------------------------------------
architecture imp of axi_lite_ipif is
----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
signal s_axi_bvalid_i         : std_logic:= '0';
signal s_axi_arready_i        : std_logic;
signal s_axi_rvalid_i         : std_logic:= '0';
signal start                  : std_logic;
-- Intermediate IPIC signals
signal bus2ip_addr_i          : std_logic_vector
                                ((C_IPIF_ABUS_WIDTH-1) downto 0);


signal rd_done,wr_done        : std_logic;
signal rst                    : std_logic;

  type BUS_ACCESS_STATES is (
    SM_IDLE,
    SM_READ,
    SM_WRITE,
    SM_RESP
  );
signal state : BUS_ACCESS_STATES;

signal bus2ip_rd_i  : std_logic;
signal bus2ip_wr_i   : std_logic;
signal s_axi_bresp_i : std_logic_vector(1 downto 0):=(others => '0');
signal s_axi_rresp_i : std_logic_vector(1 downto 0):=(others => '0');
signal s_axi_rdata_i : std_logic_vector
                     (C_IPIF_DBUS_WIDTH-1 downto 0):=(others => '0');
-------------------------------------------------------------------------------
-- begin the architecture logic
-------------------------------------------------------------------------------
begin

-------------------------------------------------------------------------------
-- Address registered
-------------------------------------------------------------------------------

bus2ip_rd_i     <= '1' when S_AXI_ARVALID='1'
                  else
                  '0';
bus2ip_wr_i     <= '1' when S_AXI_AWVALID='1'
                  else
                  '0';
BUS2IP_RD     <= bus2ip_rd_i;
BUS2IP_WR     <= bus2ip_wr_i;
Bus2IP_BE      <= S_AXI_WSTRB when ((C_USE_WSTRB = 1) and (bus2ip_wr_i = '1'))
                  else
                  (others => '1');
Bus2IP_Data    <= S_AXI_WDATA;
Bus2IP_Addr    <= bus2ip_addr_i;

-- For AXI Lite interface, interconnect will duplicate the addresses on both the
-- read and write channel. so onlyone address is used for decoding as well as
-- passing it to IP.
bus2ip_addr_i  <= S_AXI_ARADDR  when (S_AXI_ARVALID='1')
		                        else S_AXI_AWADDR;


-- x_done signals are used to release the hold from AXI, it will generate "ready"
-- signal on the read and write address channels.

rd_done <= IP2Bus_RdAck ;
wr_done <= IP2Bus_WrAck ;

 -- REGISTERING_RESET_P: Invert the reset coming from AXI
 -----------------------
 REGISTERING_RESET_P : process (S_AXI_ACLK) is
  begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
     rst <=  not S_AXI_ARESETN;
    end if;
  end process REGISTERING_RESET_P;

-------------------------------------------------------------------------------
-- AXI Transaction Controller
-------------------------------------------------------------------------------
-- Access_Control: As per suggestion to optimize the core, the below state machine
--                 is re-coded. Latches are removed from original suggestions
Access_Control : process (S_AXI_ACLK) is
    begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
    if rst = '1' then
      state <= SM_IDLE;
    else
        case state is
          when SM_IDLE => if (S_AXI_ARVALID = '1') then  -- Read precedence over write
				state <= SM_READ;
			  elsif (S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
				state <= SM_WRITE;
			  else
			        state <= SM_IDLE;
			  end if;

          when SM_READ => if rd_done = '1' then
				state <= SM_RESP;
		          else
				state <= SM_READ;
			  end if;

          when SM_WRITE=> if (wr_done = '1') then
		                state <= SM_RESP;
		          else
				state <= SM_WRITE;
			  end if;

          when SM_RESP => if ((s_axi_bvalid_i and S_AXI_BREADY) or
			      (s_axi_rvalid_i and S_AXI_RREADY)) = '1' then
				state <= SM_IDLE;
			  else
				state <= SM_RESP;
			  end if;
	  -- coverage off
	  when others =>  state <= SM_IDLE;
	  -- coverage on
        end case;
    end if;
   end if;
  end process Access_Control;

-------------------------------------------------------------------------------
  -- AXI Transaction Controller signals registered
-------------------------------------------------------------------------------
-- S_AXI_RDATA_RESP_P : BElow process generates the RRESP and RDATA on AXI
-----------------------
S_AXI_RDATA_RESP_P : process (S_AXI_ACLK) is
  begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
      if (rst = '1') then
      	 s_axi_rresp_i <= (others => '0');
	 s_axi_rdata_i <= (others => '0');
      elsif state = SM_READ then
	s_axi_rresp_i <= (IP2Bus_Error) & '0';
        s_axi_rdata_i <=  IP2Bus_Data;
      end if;
    end if;
end process S_AXI_RDATA_RESP_P;

S_AXI_RRESP <= s_axi_rresp_i;
S_AXI_RDATA <= s_axi_rdata_i;
-----------------------------

-- S_AXI_RVALID_I_P : below process generates the RVALID response on read channel
----------------------
S_AXI_RVALID_I_P : process (S_AXI_ACLK) is
  begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
      if (rst = '1') then
         s_axi_rvalid_i <= '0';
      elsif ((state = SM_READ) and rd_done = '1') then
         s_axi_rvalid_i <= '1';
      elsif (S_AXI_RREADY = '1') then
         s_axi_rvalid_i <= '0';
      end if;
    end if;
end process S_AXI_RVALID_I_P;

-- -- S_AXI_BRESP_P: Below process provides logic for write response
-- -----------------
S_AXI_BRESP_P : process (S_AXI_ACLK) is
  begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
      if (rst = '1') then
      	 s_axi_bresp_i <= (others => '0');
      elsif (state = SM_WRITE) then
	 s_axi_bresp_i <= (IP2Bus_Error) & '0';
      end if;
    end if;
end process S_AXI_BRESP_P;

S_AXI_BRESP <= s_axi_bresp_i;
--S_AXI_BVALID_I_P: below process provides logic for valid write response signal
-------------------
S_AXI_BVALID_I_P : process (S_AXI_ACLK) is
  begin
    if S_AXI_ACLK'event and S_AXI_ACLK = '1' then
      if rst = '1' then
         s_axi_bvalid_i <= '0';
      elsif ((state = SM_WRITE) and wr_done = '1') then
         s_axi_bvalid_i <= '1';
      elsif (S_AXI_BREADY = '1') then
         s_axi_bvalid_i <= '0';
      end if;
    end if;
end process S_AXI_BVALID_I_P;

-----------------------------------------------------------------------------
S_AXI_BVALID <= s_axi_bvalid_i;
S_AXI_RVALID <= s_axi_rvalid_i;
-----------------------------------------------------------------------------
S_AXI_ARREADY <= rd_done;
S_AXI_AWREADY <= wr_done;
S_AXI_WREADY  <= wr_done;
-------------------------------------------------------------------------------
end imp;
