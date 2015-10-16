----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2015 10:30:31 AM
-- Design Name: 
-- Module Name: fei4b_config - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fei4b_cfg is
generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00600"
  );
Port ( 
    RST       : in std_logic;
    SYSCLK    : in std_logic;    

    --IP BUS
    Bus2IP_Addr         : in std_logic_vector(31 downto 0);
    Bus2IP_RD           : in std_logic;
    Bus2IP_WR           : in std_logic;
    Bus2IP_Data         : in std_logic_vector(31 downto 0);
    IP2Bus_Data         : out std_logic_vector(31 downto 0);
    RDACK               : out std_logic;
    WRACK               : out std_logic;  
    
    CLK160    : in std_logic;
    CMD_CLK   : in std_logic;
        
    CMD_OUT_P : out std_logic;
    CMD_OUT_N : out std_logic;
    
    cmd_out_test:out std_logic
);    
end fei4b_cfg;
architecture Behavioral of fei4b_cfg is

-- IP BUS Signal
signal ipbus_wr         :std_logic;
signal ipbus_rd         :std_logic;
signal ipbus_addr       :std_logic_vector(31 downto 0);
signal ipbus_rdack      :std_logic;
signal ipbus_wrack      :std_logic;
signal ipbus_data_in    :std_logic_vector(31 downto 0);
signal ipbus_data_out   :std_logic_vector(31 downto 0);

-- Internal register
signal reg0            :std_logic_vector(31 downto 0);
signal reg1            :std_logic_vector(31 downto 0);
signal reg2            :std_logic_vector(31 downto 0);
signal reg3            :std_logic_vector(31 downto 0);

--Control signals for the RAM inside the cfg core
signal ram_addr        :std_logic_vector(4 downto 0);
signal ram_wr_dat      :std_logic_vector(31 downto 0);
signal ram_rd_dat      :std_logic_vector(31 downto 0);
signal ram_wr_en       :std_logic;
signal ram_wr_clk      :std_logic;

signal cmd_clk_r     :std_logic;
signal cmd_out_r     : std_logic;
signal cmd_out_shift :std_logic_vector(3 downto 0);
signal cmd_out_r_o   :std_logic;

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of cmd_out_r_o,ram_addr,ram_wr_dat,ram_rd_dat,ram_wr_en : signal is "TRUE";

begin

-- cross clock domian

cmd_clk_r <= CMD_CLK;


fei4_cfg_module:entity work.fei4b_cfg_core
port map(
    RST            => RST,
    
    ram_addr        => ram_addr,
    ram_wr_dat      => ram_wr_dat,
    ram_rd_dat      => ram_rd_dat,
    ram_wr_en       => ram_wr_en,
    ram_wr_clk      => SYSCLK,
    
    CLK160         => CLK160,
    CMD_CLK        => cmd_clk_r,
    
    CFG_FLG        => reg0(0),
    CFG_REG        => reg1,
    WR_REG_DAT     => reg2(15 downto 0),
     
    CMD_OUT        => cmd_out_r
);

cmd_out_phase_shift:process(CLK160)
begin
if rising_edge(CLK160) then
   cmd_out_shift <= cmd_out_shift(2 downto 0) & cmd_out_r;
   cmd_out_r_o <= cmd_out_shift(conv_integer(reg3(1 downto 0)));
end if;
end process;

fei4_cmd_out_buf:OBUFDS
generic map (
  IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
  SLEW => "SLOW"-- Specify the output slew rate
  ) 
port map(
  O  => CMD_OUT_P, -- Diff_p output (connect directly to top-level port)
  OB => CMD_OUT_N, -- Diff_n output (connect directly to top-level port)
  -- Since the Positive output is connected to the negative input of the FEI4, the cmd out is 
  -- reversed.
  I => cmd_out_r_o  -- Buffer input
  );

cmd_out_test <= cmd_out_r_o ;

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
        reg0        <= (others => '0'); 
        reg1        <= (others => '0'); 
        reg2        <= (others => '0'); 
        reg3        <= (others => '0'); 
         
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
                                        
                        when x"10" =>  if (ipbus_wr = '1') then 
                                          ram_wr_en <= ipbus_data_in(0);
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= (others => '0');  
                                        end if;   
                                               
                        when "1XXXXXXX" => if (ipbus_wr = '1') then 
                                          
                                          ram_wr_dat <= ipbus_data_in;
                                          ram_addr <= ipbus_addr(6 downto 2);                                                                          
                                        elsif (ipbus_rd = '1') then
                                          ram_addr <= ipbus_addr(6 downto 2);  
                                          ipbus_data_out <= ram_rd_dat;                                         
                                        end if;   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              											
						when others =>						                
										ipbus_data_out <= (others => '0');
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
