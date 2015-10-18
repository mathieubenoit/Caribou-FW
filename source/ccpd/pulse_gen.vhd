----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2015 10:14:26 AM
-- Design Name: 
-- Module Name: pulse_gen_tb - Behavioral
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

entity pulse_gen is
generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00000"
  );
  port ( 
  RST    : in std_logic;
  SYSCLK : in std_logic;
  
  --IP BUS
  Bus2IP_Addr         : in std_logic_vector(31 downto 0);
  Bus2IP_RD           : in std_logic;
  Bus2IP_WR           : in std_logic;
  Bus2IP_Data         : in std_logic_vector(31 downto 0);
  IP2Bus_Data         : out std_logic_vector(31 downto 0);
  RDACK               : out std_logic;
  WRACK               : out std_logic;
  
  --pulse output
  pulse_out1          : out std_logic; 
  pulse_out2          : out std_logic; 
  pulse_out3          : out std_logic; 
  pulse_out4          : out std_logic
  );        
end pulse_gen;

architecture Behavioral of pulse_gen is

COMPONENT pulse_gen_core is
GENERIC(
  input_clk : INTEGER := 100_000_000 --input clock speed from user logic in Hz
  );   
PORT(
  clk           : IN    STD_LOGIC;   --system clock
  reset         : IN    STD_LOGIC;
  
  start_flg     : IN    STD_LOGIC;
  
  pulse_counter : IN    STD_LOGIC_VECTOR(15 DOWNTO 0);
  time_high_cnt : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
  time_low_cnt  : IN    STD_LOGIC_VECTOR(31 DOWNTO 0);
    
  pulse_out     : OUT   STD_LOGIC
);     
end COMPONENT;

-- IP BUS Signal
signal ipbus_wr               :std_logic;
signal ipbus_rd               :std_logic;
signal ipbus_addr             :std_logic_vector(31 downto 0);
signal ipbus_rdack            :std_logic;
signal ipbus_wrack          :std_logic;
signal ipbus_data_in    :std_logic_vector(31 downto 0);
signal ipbus_data_out   :std_logic_vector(31 downto 0);

signal reg0   :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal reg1   :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal reg2   :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal reg3   :STD_LOGIC_VECTOR(31 DOWNTO 0);
signal pulse_out :STD_LOGIC;

begin

pulse_generator:pulse_gen_core
GENERIC MAP(
  input_clk => 100_000_000
  ) 
PORT MAP(
  clk            => sysclk,
  reset          => rst,
  
  start_flg      => reg0(0),
  
  pulse_counter  => reg1(31 downto 16),
  time_high_cnt  => reg2,
  time_low_cnt   => reg3,
    
  pulse_out      => pulse_out
);     

pulse_out1 <= pulse_out and reg1(0);
pulse_out2 <= pulse_out and reg1(1);
pulse_out3 <= pulse_out and reg1(2);
pulse_out4 <= pulse_out and reg1(3);

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
                        when x"04" =>   if (ipbus_wr = '1') then 
                                            reg1 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                            ipbus_data_out <= reg1;
                                        end if;    
                        when x"08" =>   if (ipbus_wr = '1') then 
                                          reg2 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= reg2;
                                        end if;     
                                                                                                    						
                        when x"0C" =>   if (ipbus_wr = '1') then 
                                          reg3 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= reg3;
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
