----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2015 09:54:28 AM
-- Design Name: 
-- Module Name: ccpd_cfg_tb - Behavioral
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

entity ccpd_cfg_tb is
generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00300"
  );
Port (
    sysclk             :in std_logic;
    rst                :in std_logic;

    --IP BUS
    Bus2IP_Addr         : in std_logic_vector(31 downto 0);
    Bus2IP_RD           : in std_logic;
    Bus2IP_WR           : in std_logic;
    Bus2IP_Data         : in std_logic_vector(31 downto 0);
    IP2Bus_Data         : out std_logic_vector(31 downto 0);
    RDACK               : out std_logic;
    WRACK               : out std_logic;    
           
    Sin                 :out std_logic;
    CkC                 :out std_logic;
    CkD                 :out std_logic;
    Ld                  :out std_logic
 );
end ccpd_cfg_tb;

architecture Behavioral of ccpd_cfg_tb is

component ccpd_cfg_core is
    generic(
        input_clk_fre  : INTEGER := 100_000_000; --input clock speed from user logic in Hz
        cfg_clk_freq   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
    Port (
        clk             :in std_logic;
        rst             :in std_logic;
        
        start_flg       :in std_logic;
        reg_limit       :in std_logic_vector(4 downto 0);
        shift_limit     :in std_logic_vector(4 downto 0);
        clock_enable    :in std_logic_vector(1 downto 0);
       
        ram_addr        :in std_logic_vector(3 downto 0);
        ram_wr_dat      :in std_logic_vector(31 downto 0);
        ram_rd_dat      :out std_logic_vector(31 downto 0);
        ram_wr_en       :in std_logic;
        ram_wr_clk      :in std_logic;
                      
        Sin             :out std_logic;
        CkC             :out std_logic;
        CkD             :out std_logic;
        Ld              :out std_logic
     );
end component;

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

signal ccpd_sin        :std_logic;
signal ccpd_ckc        :std_logic;
signal ccpd_ckd        :std_logic;
signal ccpd_ld         :std_logic;

signal ram_addr        :std_logic_vector(3 downto 0);
signal ram_wr_dat      :std_logic_vector(31 downto 0);
signal ram_rd_dat      :std_logic_vector(31 downto 0);
signal ram_wr_en       :std_logic;
signal ram_wr_clk      :std_logic;

attribute MARK_DEBUG : string;

attribute MARK_DEBUG of reg0,reg1,reg2,reg2 : signal is "TRUE";
attribute MARK_DEBUG of ram_addr,ram_wr_dat,ram_rd_dat,ram_wr_en : signal is "TRUE";
attribute MARK_DEBUG of ccpd_sin,ccpd_ckc,ccpd_ckd,ccpd_ld : signal is "TRUE";


begin

ccpd_cfg:ccpd_cfg_core
    generic map(
    input_clk_fre  => 100_000_000, --input clock speed from user logic in Hz
    cfg_clk_freq   =>  400_000  --frequency of the CkC and CkD in Hz
    )
    Port map(
    clk             => sysclk,
    rst             => rst,
    
    
    start_flg       => reg0(0),
    reg_limit       => reg1(4 downto 0),
    shift_limit     => reg2(4 downto 0),
    clock_enable    => reg3(1 downto 0),
    
    ram_addr        => ram_addr,
    ram_wr_dat      => ram_wr_dat,
    ram_rd_dat      => ram_rd_dat,
    ram_wr_en       => ram_wr_en,
    ram_wr_clk      => SYSCLK,
            
    Sin             => ccpd_sin,
    CkC             => ccpd_ckc,
    CkD             => ccpd_ckd,
    Ld              => ccpd_ld
    );

Sin    <= ccpd_sin;
CkC    <= ccpd_ckc;
CkD    <= ccpd_ckd;
Ld     <= ccpd_ld;
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
                                               
                        when x"14" => if (ipbus_wr = '1') then                                          
                                          ram_wr_dat <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= (others => '0');  
                                        end if; 
                                        
                        when x"18" => if (ipbus_wr = '1') then                                          
                                          ram_addr <= ipbus_data_in(3 downto 0);
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= (others => '0');  
                                        end if;                                         

                        when x"1C" =>  if (ipbus_rd = '1') then
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
