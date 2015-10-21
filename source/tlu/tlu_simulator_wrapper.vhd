----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2015 04:37:58 PM
-- Design Name: 
-- Module Name: tlu_simulator_wrapper - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tlu_simulator_wrapper is
generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00000"
  );
Port (
    SYSCLK              :in std_logic;
    RST                 :in std_logic;

    --IP BUS
    Bus2IP_Addr         : in std_logic_vector(31 downto 0);
    Bus2IP_RD           : in std_logic;
    Bus2IP_WR           : in std_logic;
    Bus2IP_Data         : in std_logic_vector(31 downto 0);
    IP2Bus_Data         : out std_logic_vector(31 downto 0);
    RDACK               : out std_logic;
    WRACK               : out std_logic;   
    
    --TLU signals
    TLU_TRIGGER_OUT     : out std_logic;
    TLU_BUSY_IN         : out std_logic     
    );
end tlu_simulator_wrapper;

architecture Behavioral of tlu_simulator_wrapper is

signal tlu_master_output_en :std_logic;
signal reg0                 :std_logic_vector(31 downto 0);

signal tlu_tri_clk          :std_logic;
signal tlu_busy             :std_logic;
signal tlu_reset            :std_logic;
signal tlu_trigger          :std_logic;

-- IP BUS Signals
signal ipbus_wr         :std_logic;
signal ipbus_rd         :std_logic;
signal ipbus_addr       :std_logic_vector(31 downto 0);
signal ipbus_rdack      :std_logic;
signal ipbus_wrack      :std_logic;
signal ipbus_data_in    :std_logic_vector(31 downto 0);
signal ipbus_data_out   :std_logic_vector(31 downto 0);

begin

tlu_enable:process(RST, SYSCLK)
begin
if RST = '1' then
  tlu_master_output_en <= '0';
elsif rising_edge(SYSCLK) then
  if reg0 = X"A1B2C3D4" then
    tlu_master_output_en <= '1';
  else
    tlu_master_output_en <= '0';
  end if;
end if;
end process;

tlu_master:entity work.tlu_master_core
Generic map(
    sys_clk_freq => 100_000_000, --input clock speed from user logic in Hz
    trig_rate    => 500_000
) 
Port map(
    RST           => RST,
    SYSCLK        => SYSCLK,
    
    OUT_EN        => tlu_master_output_en,
    
    -- TLU signals
    TRIGGER_CLK_I => tlu_tri_clk,
    BUSY_I        => tlu_busy,
    RESET_O       => tlu_reset,
    TRIGGER_O     => tlu_trigger
);


----------------------------------IP BUS------------------------------------------------------
ipbus_wr      <= Bus2IP_WR;
ipbus_rd      <= Bus2IP_RD;
ipbus_addr    <= Bus2IP_Addr;
ipbus_data_in <= Bus2IP_Data;

process(SYSCLK,RST)
begin
		if (RST = '1') then
        ipbus_rdack <= '0';
        ipbus_wrack <= '0'; 
		else
			if rising_edge(SYSCLK) then
				if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then
					case ipbus_addr(7 downto 0) is
						--ADC DCLK frequency readout
                        when x"00" =>   if (ipbus_wr = '1') then 
                                            reg0 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                            ipbus_data_out <= reg0;
                                        end if;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                											
						when others =>
										  ipbus_data_out(31 downto 0) <= (others => '0');
				   end case;
				   
				   --read acknowlege generation
				   if(ipbus_rd = '1') then 
				     ipbus_rdack <= '1'; 
				   else 
				     ipbus_rdack <= '0';
				   end if;
				   
                   --write acknowlege generation
				   if(ipbus_wr = '1') then 
				     ipbus_wrack <= '1'; 
				   else 
				     ipbus_wrack <= '0'; 
				   end if;	
				  			  		   				   
				end if;
			end if;
		end if;
end process;	


select_output:process(ipbus_addr)
begin
    if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
    IP2Bus_Data <= ipbus_data_out;
    else
    IP2Bus_Data <= (others => 'Z');
    end if;
end process;	

process(SYSCLK)
begin
  if rising_edge(SYSCLK) then
    if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
      RDACK <= ipbus_rdack;
      WRACK <= ipbus_wrack;
    else
      RDACK <= 'Z';
      WRACK <= 'Z';
   end if;
 end if;
end process;

end Behavioral;
