
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
     
entity iobus_interface is
      generic (
        BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00000"
              );
        port ( 
	    RST    : in std_logic;
		SYSCLK : in std_logic;
		
		Bus2IP_Addr         : in std_logic_vector(31 downto 0);
		Bus2IP_RD           : in std_logic;
		Bus2IP_WR           : in std_logic;
		Bus2IP_Data        : in std_logic_vector(31 downto 0);
		IP2Bus_Data         : out std_logic_vector(31 downto 0);
		RDACK               : out std_logic;
		WRACK               : out std_logic;	
        
        GLB_RST        :out std_logic;
        
		HP_GEN_RST     :out std_logic_vector(3 downto 0);
		HP_TRIGER      :out std_logic_vector(3 downto 0);
        HP_FIFO_RST    :out std_logic_vector(3 downto 0);
        HP_ADDR_RST    :out std_logic_vector(3 downto 0);
		HP_BURST_EN    :out std_logic_vector(3 downto 0);		
		HP_TEST_DATA_EN:out std_logic;
		HP2_FIFO_CNT    :in  std_logic_vector(7 downto 0);
		HP0_BURST_LEN   :out std_logic_vector(31 downto 0);
		HP0_BURST_ADDR  :in  std_logic_vector(31 downto 0); 
		HP2_BURST_ADDR  :in  std_logic_vector(31 downto 0);		
		HP2_BURST_LAST_RD :out std_logic;
				
		ADC_DCLK_FREQ   :in  std_logic_vector(19 downto 0);
        ADC_FCLK_FREQ   :in  std_logic_vector(19 downto 0);
        ADC_FCLK_POS    :out std_logic_vector( 3 downto 0);	
                
        FEI4_CFG_FLG    :out std_logic;
        FEI4_CFG_REG    :out std_logic_vector(31 downto 0);
        FEI4_WR_REG_DAT :out std_logic_vector(15 downto 0);
        FEI4_FR_RAM_ADDR : out std_logic_vector(5 downto 0);
        FEI4_FR_RAM_DAT_IN : out std_logic_vector(31 downto 0);
        FEI4_FR_RAM_DAT_OUT : in std_logic_vector(31 downto 0);   
        FEI4_DAT_POS_SEL :out std_logic_vector(3 downto 0);
        FEI4_FRAME_SYNC_EN   :out std_logic;
        FEI4_FE_SR_RD_EN   :out std_logic;
        FEI4_REG_ADDR_OUT : in std_logic_vector(15 downto 0);
        FEI4_REG_VALUE_OUT : in std_logic_vector(15 downto 0);  
        
        FEI4_IDELAY_CNT_OUT  :in  std_logic_vector(4 downto 0);
        FEI4_IDELAY_CTRL_RDY :in  std_logic;
        FEI4_IDELAY_LD  :out std_logic;
        FEI4_IDELAY_CNT_IN   :out std_logic_vector(4 downto 0)
        					
  		);		  
end iobus_interface;
  

architecture Behavioral of iobus_interface is

constant CTRLBASEADDR				: std_logic_vector(15 downto 0) := x"43c0";
signal wr :std_logic;
signal rd :std_logic;
signal addr :std_logic_vector(31 downto 0);
signal rdack_i :std_logic;
signal wrack_i :std_logic;
signal ip2bus_data_i :std_logic_vector(31 downto 0);


begin

wr <= Bus2IP_WR;
rd <= Bus2IP_RD;
addr <= Bus2IP_Addr;


process(SYSCLK)
begin
if rising_edge(SYSCLK) then
    if  (addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
    IP2Bus_Data <= ip2bus_data_i;
    else
    IP2Bus_Data <= (others => 'Z');
    end if;
end if;
end process;
    
process(SYSCLK,RST)
begin
		if (RST = '1') then
        rdack_i <= '0';
        wrack_i <= '0'; 
		else
			if rising_edge(SYSCLK) then
				if  (addr(31 downto 8) = BASE_ADDR(31 downto 8)) then
					case addr(15 downto 0) is
						--ADC DCLK frequency readout
                        when x"0004" =>   if (wr = '1') then GLB_RST <= Bus2IP_Data(0); 
                                          end if;
 -------ADC                                        						
                        when x"0008" =>   if (rd = '1') then 
                                                ip2bus_data_i(19 downto 0) <= ADC_DCLK_FREQ;
                                                ip2bus_data_i(31 downto 20)<= (others => '0');
                                          else  ip2bus_data_i  <= (others => '0');
                                          end if;
                    
                        --ADC FCLK frequency readout
                        when x"000C" =>   if (rd = '1') then ip2bus_data_i(19 downto 0) <= ADC_FCLK_FREQ;
                                                             ip2bus_data_i(31 downto 20)<= (others => '0');                    
                                          else               ip2bus_data_i              <= (others => '0');
                                          end if;           
                                                     					                       
						--LVDS Frame sample position setting
                        when x"0010" =>   if (wr = '1' ) then ADC_FCLK_POS  <= Bus2IP_Data(3 downto 0); 
                                          end if;
--------FEI4 CFG                                        
                        -- FEI4 CONFIGURE BLOCK
                        when x"0014" =>   if (wr = '1') then FEI4_CFG_FLG <= Bus2IP_Data(0);
                                          end if;
                                         
                        when x"0018" =>   if (wr = '1') then  FEI4_CFG_REG <= Bus2IP_Data; 
                                          end if;
                                        
                        when x"0020" =>   if (wr = '1') then  FEI4_WR_REG_DAT <= Bus2IP_Data(15 downto 0); 
                                                        end if;
--------FEI4 RX                                                        
                        when x"0024" =>   if (wr = '1') then  FEI4_DAT_POS_SEL <= Bus2IP_Data(3 downto 0); 
                                                        end if;   
                                                        
                        when x"0028" =>   if (wr = '1') then  FEI4_FRAME_SYNC_EN <= Bus2IP_Data(0); 
                                                        end if;       

                        when x"002C" =>   if (rd = '1' ) then 
                                              ip2bus_data_i(31 downto 8)<= (others => '0');
                                              ip2bus_data_i(7)          <= FEI4_IDELAY_CTRL_RDY;
                                              ip2bus_data_i(6 downto 5) <= (others => '0');
                                              ip2bus_data_i(4 downto 0) <= FEI4_IDELAY_CNT_OUT; 
                                          else                
                                              ip2bus_data_i             <= (others => '0');
                                          end if;
                          
                        --FEI4 DATA DELAY tap value load
                        when x"0030" =>   if (wr = '1' ) then FEI4_IDELAY_CNT_IN  <= Bus2IP_Data(4 downto 0); 
                                          end if;
                        
                        --FEI4 DATA DELAY load
                        when x"0034" =>   if (wr = '1' ) then FEI4_IDELAY_LD  <= Bus2IP_Data(0); 
                                          end if;                
------FEI4 CFG RAM                                        
                        when x"0038" =>   if(wr = '1') then FEI4_FR_RAM_ADDR <= Bus2IP_Data(5 downto 0);
                                          end if;
                        
                        when x"003c" =>   if(wr = '1') then FEI4_FR_RAM_DAT_IN <= Bus2IP_Data;
                                          elsif (rd = '1') then ip2bus_data_i <= FEI4_FR_RAM_DAT_OUT;
                                          end if;
------FEI4 RX                                          
                        when x"0040" =>   if(rd = '1') then ip2bus_data_i(15 downto 0) <= FEI4_REG_ADDR_OUT;
                                                            ip2bus_data_i(31 downto 16)<= (others => '0');
                                          end if;                                      

                        when x"0044" =>   if(rd = '1') then ip2bus_data_i(15 downto 0) <= FEI4_REG_VALUE_OUT;
                                                            ip2bus_data_i(31 downto 16)<= (others => '0');
                                          end if;   
------AXI HP                                                                               
                        when x"005C" =>   if (wr = '1')  then  HP_GEN_RST      <= Bus2IP_Data(3 downto 0); 
                                          end if; 
                                                                                                                               
                        when x"0060" =>   if (wr = '1')  then  
                                              HP_TRIGER       <= Bus2IP_Data(3 downto 0); 
                                              HP_FIFO_RST     <= Bus2IP_Data(7 downto 4);
                                              HP_ADDR_RST      <= Bus2IP_Data(11 downto 8); 
                                          end if; 
                                         
                        when x"0064" =>   if (wr = '1')  then  HP_BURST_EN <= Bus2IP_Data(3 downto 0); 
                                          end if; 
                                                                                                
                        when x"0068" =>   if (wr = '1')  then  HP_TEST_DATA_EN <= Bus2IP_Data(0); 
                                          end if;                                                        
                                         
                        when x"006C" =>   if (wr = '1')  then  HP0_BURST_LEN <= Bus2IP_Data; 
                                          end if;            
                                                      
                        when x"0070" =>   if (rd = '1') then ip2bus_data_i(31 downto 0) <= HP0_BURST_ADDR;
                                          else ip2bus_data_i <= (others => '0');
                                          end if;   

                        when x"0074" =>   if (rd = '1') then ip2bus_data_i(31 downto 0) <= HP2_BURST_ADDR;
                                          else ip2bus_data_i <= (others => '0');
                                          end if;   
                        
                        when x"0078" =>   if (rd = '1') then ip2bus_data_i(7 downto 0) <= HP2_FIFO_CNT;
                                                             ip2bus_data_i(31 downto 8) <= (others => '0');
                                          else ip2bus_data_i <= (others => '0');
                                          end if;   
                                          
                        when x"007c" =>   if (wr = '1') then HP2_BURST_LAST_RD <= Bus2IP_Data(0);                                         
                                          end if;   
                       
                        when x"0080" =>   if (wr = '1') then  FEI4_FE_SR_RD_EN <= Bus2IP_Data(0); 
                                                  end if;    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            											
						when others =>
										  ip2bus_data_i(19 downto 0) <= (others => '0');
				   end case;
				   
				   --read acknowlege generation
				   if(rd = '1') then 
				     rdack_i <= '1'; 
				   else 
				     rdack_i <= '0';
				   end if;
				   
                   --write acknowlege generation
				   if(wr = '1') then 
				     wrack_i <= '1'; 
				   else 
				     wrack_i <= '0'; 
				   end if;	
				   		   				   
				end if;
			end if;
		end if;
end process;					

--delay rdack and wrack for one clock
process(SYSCLK)
begin
    if rising_edge(SYSCLK) then
      if  (addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
        RDACK <= rdack_i;
        WRACK <= wrack_i;
      else
        RDACK <= 'Z';
        WRACK <= 'Z';
      end if;
    end if;
end process;



end Behavioral;
