----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:56 02/06/2012 
-- Design Name: 
-- Module Name:    axi_minterface - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.02 - Date: 08/28/2015
--                 1. Swap the write data 32 LSB and MSB
--                 2. Read FIFO enable are delayed for one clock.
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axi_mburst1 is
  Generic(
    start_addr : std_logic_vector(27 downto 0) := X"800_0000";
    end_addr   : std_logic_vector(27 downto 0) := X"FFF_FFFF"
    );
  port (
    axi_clk 		: in std_logic;
    axi_reset 		: in std_logic;
    addr_rst        : in std_logic;
	 
    fifo_reset      : in std_logic;       
    fifo_wrclk      : in std_logic;
    fifo_data       : in std_logic_vector(31 downto 0);
    fifo_wren       : in std_logic;
    fifo_rdcnt      : out std_logic_vector(7 downto 0);  
    
    burst_addr      : out std_logic_vector(31 downto 0); 
    last_rd_tri     : in std_logic;  	 
	 
    axi_awready 	: in std_logic;
    axi_awaddr 	    : out std_logic_vector(31 downto 0);--32bit-->28bit: top.vhd assign high 4 bit
    axi_awvalid 	: out std_logic;	 
    axi_awlen 		: out std_logic_vector(7 downto 0);
    axi_awsize 	    : out std_logic_vector(2 downto 0);
    axi_awburst 	: out std_logic_vector(1 downto 0);
    axi_awcache 	: out std_logic_vector(3 downto 0);
    axi_awprot 	    : out std_logic_vector(2 downto 0);
 
    axi_wready 	    : in std_logic;
    axi_wdata 	    : out std_logic_vector(31 downto 0);
	axi_wvalid 	    : out std_logic;
    axi_wstrb 		: out std_logic_vector(3 downto 0);
    axi_wlast 		: out std_logic;

    axi_bvalid 	    : in std_logic; 
    axi_bresp 		: in std_logic_vector(1 downto 0);
    axi_bready 	    : out std_logic
	); 
end axi_mburst1;

architecture Behavioral of axi_mburst1 is


------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT fifo_generator_0
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    rd_data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF fifo_generator_0 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF fifo_generator_0 : COMPONENT IS "rst,wr_clk,rd_clk,din[31:0],wr_en,rd_en,dout[31:0],full,empty,rd_data_count[6:0],wr_data_count[6:0]";


type  state_type is (IDLE, ADDR_ACTIVE, DATA_ACTIVE, DELAY, BURST, HOLD);  
signal state: state_type;

signal burstcnt : INTEGER RANGE 0 TO 255;
signal burstcnt_latch : integer range 0 to 255;
signal axi_reset_i :std_logic;
signal axi_awaddr_i : std_logic_vector(27 downto 0);
signal axi_wlast_i  : std_logic;

signal fifo_rden   : std_logic;
signal fifo_rddata : std_logic_vector(31 downto 0);
signal fifo_full   : std_logic;
signal fifo_empty  : std_logic;
signal fifo_rdcnt_i  : std_logic_vector(7 downto 0);
signal fifo_rd_clk : std_logic;
signal fifo_wrcnt : std_logic_vector(7 downto 0);

signal last_rd_tri_i :std_logic;
signal last_rd_tri_delay :std_logic;

signal last_burst :std_logic;

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of last_rd_tri_i,state,fifo_rden ,fifo_rdcnt_i,fifo_empty,fifo_full:signal is "TRUE";
--attribute MARK_DEBUG of axi_awaddr,axi_awready,axi_awvalid,axi_wready :signal is "TRUE";
--attribute MARK_DEBUG of axi_wdata,axi_wvalid,axi_wlast :signal is "TRUE";

begin

REGISTERING_RESET_P:process (axi_clk) is
begin
    if rising_edge(axi_clk) then
     axi_reset_i <=  not axi_reset;
    end if;
end process REGISTERING_RESET_P;
  
  
----Base address is 0x10000000
axi_awaddr <= "0011" & axi_awaddr_i;
-- current address read out
burst_addr <= "0011" & axi_awaddr_i;

axi_wdata <= fifo_rddata;
axi_wlast <= axi_wlast_i;

fifo_rd_clk <= axi_clk;

fei4_data_fifo: fifo_generator_0
  PORT MAP (
    rst => fifo_reset,
    wr_clk => fifo_wrclk,
    rd_clk => axi_clk,
    din => fifo_data,
    wr_en => fifo_wren,
    rd_en => fifo_rden,
    dout => fifo_rddata,
    full => fifo_full,
    empty => fifo_empty,
    rd_data_count => fifo_rdcnt_i,
    wr_data_count => fifo_wrcnt
);

process(addr_rst,axi_wlast_i)
begin
if (addr_rst = '1') then
   axi_awaddr_i <= start_addr; --(others => '0');
elsif rising_edge(axi_wlast_i) then
   if (axi_awaddr_i < end_addr) then --128M Adress Space
       axi_awaddr_i <= axi_awaddr_i +  64;  --16Bursts*4Bytes
   else
       axi_awaddr_i <= X"0000000";
   end if;
end if;
end process;
   
process(axi_clk, axi_reset_i)
begin
  if(axi_reset_i = '1') then
    last_rd_tri_i <= '0';
  elsif rising_edge(axi_clk) then 
    last_rd_tri_delay <= last_rd_tri;
    if last_rd_tri = '1' and last_rd_tri_delay = '0' then
      last_rd_tri_i <= '1';
    else
      last_rd_tri_i <= '0';
    end if;
  end if;
  
end process;


    
process (axi_clk, axi_reset_i)
   begin
      if (axi_reset_i = '1') then
      		
		   axi_awvalid	<= '0';
		   axi_awburst  <= "00";
		   axi_awcache	<= "0000";
		   axi_awlen	<= x"00";
		   axi_awprot	<= "000";
		   axi_awsize 	<= "000";

--		   axi_wdata  <= (others => '0');
		   fifo_rden    <= '0';
		   axi_wvalid	<= '0';
		   axi_wlast_i	<= '0';
		   axi_wstrb 	<= x"0"; 
			
		   axi_bready	<= '0';
			
		   burstcnt <= 0;
		   burstcnt_latch <= 0;	
		   
	       state <= idle;
	       
	       last_burst <= '0';

			
    elsif rising_edge(axi_clk) then
        case state is
            when IDLE => 
                 burstcnt <= 0;
				 axi_bready <= '1';					--response always ready				 					
				 if(fifo_rdcnt_i >= X"10")  then      --fifo read counter lager than 16 * 4Byte
					axi_awvalid <= '1';
				    axi_awburst <= "01"; 			-- incrementing address type
					axi_awlen <= X"0F";   			-- 16 transfer per burst
					axi_awsize <= "010";            -- burst size, 010 - 4 bytes per beat					
					burstcnt <= 0;			
					axi_wstrb <= X"F";			    --control which byte can write, total 32 Bits - 4 bytes
					state <= addr_active;
					burstcnt_latch <= 15;	
					fifo_rden <= '1'; 
				elsif(last_rd_tri_i = '1') and fifo_rdcnt_i /= X"00"  then
					axi_awvalid <= '1';
                    axi_awburst <= "01";             -- incrementing address type
                    axi_awlen <= fifo_rdcnt_i;       -- 16 transfer per burst
                    axi_awsize <= "010";            -- burst size, 010 - 4 bytes per beat                    
                    burstcnt <= 0;            
                    axi_wstrb <= X"F";                --control which byte can write, total 32 Bits - 4 bytes
                    state <= addr_active;
                    last_burst <= '1';	
                    burstcnt_latch <=  to_integer(unsigned(fifo_rdcnt_i)) - 1;	
                    fifo_rden <= '1'; 			
				end if;
				
				
			when ADDR_ACTIVE =>
				--address transaction
				if (axi_awready = '1') then -- slave device is ready to accept an address and associated control signals
					axi_awvalid <= '0'; -- deassert write address valid signal
					axi_wvalid <= '1';	-- write data will be valid				
					state <= data_active;
					fifo_rden <= '0'; 
				end if;
				
				
			when DATA_ACTIVE =>				
				if (axi_wready = '1') then -- slave is ready to accept data
				    axi_wvalid <= '0'; -- deassert write data valid signal
				    fifo_rden <= '1'; -- prepare to read fifo
				    state <= BURST;
				end if;
			
			when DELAY =>
			   state <= burst;
				    					
			when BURST =>		
				--data transaction
				-- could have problems if axi_wready goes low in the 
				-- middle of the burst.
				axi_wvalid <= '1'; 
				--if (axi_wready = '1') then				 
--				    axi_wdata <= fifo_rddata(31 downto 0) & fifo_rddata(63 downto 32) ;
                    if (burstcnt = burstcnt_latch -1) then
                        fifo_rden <= '0'; 
                        burstcnt <= burstcnt + 1;
				    elsif (burstcnt = burstcnt_latch) then
				        axi_wlast_i <= '1';				 
                        state <= hold;
                    else
                        burstcnt <= burstcnt + 1;
				    end if;
				--else
				--    fifo_rden <= '0';
				--end if;

			when HOLD =>			    
				axi_wvalid <= '0';
				axi_wlast_i  <= '0';
				axi_wstrb <= x"0"; 		
			    if (axi_bvalid = '1') then
				    state <= idle;
				end if;
										
			when others =>
			    state <= IDLE;
          end case;			 
      end if;
   end process;

fifo_rdcnt <= fifo_rdcnt_i;

end Behavioral;
