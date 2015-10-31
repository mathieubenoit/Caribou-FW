
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
     
entity iobus_interface is
generic (
    BASE_ADDR           :std_logic_vector(31 downto 0) := x"43c00000"
      );
port ( 
    RST                 :in std_logic;
    SYSCLK              :in std_logic;
    
    Bus2IP_Addr         :in std_logic_vector(31 downto 0);
    Bus2IP_RD           :in std_logic;
    Bus2IP_WR           :in std_logic;
    Bus2IP_Data         :in std_logic_vector(31 downto 0);
    IP2Bus_Data         :out std_logic_vector(31 downto 0);
    RDACK               :out std_logic;
    WRACK               :out std_logic;	
    
    RST_CTRL            :out std_logic_vector(31 downto 0);
    
    HP_GEN_RST          :out std_logic_vector(3 downto 0);
    HP_TRIGER           :out std_logic_vector(3 downto 0);
    HP_FIFO_RST         :out std_logic_vector(3 downto 0);
    HP_ADDR_RST         :out std_logic_vector(3 downto 0);
    HP_BURST_EN         :out std_logic_vector(3 downto 0);		
    HP_TEST_DATA_EN     :out std_logic;
    HP2_FIFO_CNT        :in  std_logic_vector(7 downto 0);
    HP0_BURST_LEN       :out std_logic_vector(31 downto 0);
    HP0_BURST_ADDR      :in  std_logic_vector(31 downto 0); 
    HP2_BURST_ADDR      :in  std_logic_vector(31 downto 0);		
    HP2_BURST_LAST_RD   :out std_logic;
            
    ADC_DCLK_FREQ       :in  std_logic_vector(19 downto 0);
    ADC_FCLK_FREQ       :in  std_logic_vector(19 downto 0);
    ADC_FCLK_POS        :out std_logic_vector( 3 downto 0);	
 
    PL_IIC_CMD_FLG      :out std_logic;
    PL_IIC_CTRL_IN      :out std_logic_vector(31 downto 0);
    PL_IIC_WR_BUF       :out std_logic_vector(31 downto 0);
    PL_IIC_RD_BUF       :in std_logic_vector(31 downto 0);   
    --FEI4 configure module control signals        
    FEI4_CFG_FLG        :out std_logic;
    FEI4_CFG_REG        :out std_logic_vector(31 downto 0);
    FEI4_WR_REG_DAT     :out std_logic_vector(15 downto 0);
    FEI4_FR_RAM_ADDR    :out std_logic_vector(5 downto 0);
    FEI4_FR_RAM_DAT_IN  :out std_logic_vector(31 downto 0);
    FEI4_FR_RAM_DAT_OUT :in  std_logic_vector(31 downto 0);      
    FEI4_CMD_PH_SEL     :out std_logic_vector(3 downto 0);
    FEI4_CAL_CNT_DELAY  :out std_logic_vector(31 downto 0);      
    
    --FEI4 RX module control signals        
    FEI4_FRAME_SYNC_EN  :out std_logic_vector(1 downto 0);
    FEI4_FE_SR_RD_EN    :out std_logic_vector(1 downto 0);
    FEI4_REG_ADDR_OUT   :in std_logic_vector(31 downto 0);
    FEI4_REG_VALUE_OUT  :in std_logic_vector(31 downto 0); 
    --FEI4 IDELAY control signals     
    FEI4_IDELAY_CNT_OUT :in  std_logic_vector(9 downto 0);
    FEI4_IDELAY_CTRL_RDY:in  std_logic_vector(1 downto 0);
    FEI4_IDELAY_LD      :out std_logic_vector(1 downto 0);
    FEI4_IDELAY_CNT_IN  :out std_logic_vector(9 downto 0);
    
    CCPD_CFG_FLG        :out std_logic;
    CCPD_CFG_REG_LIMIT  :out std_logic_vector(4 downto 0);
    CCPD_CFG_SHIFT_LIMIT :out std_logic_vector(4 downto 0);
    CCPD_CFG_CLK_EN      :out std_logic_vector(1 downto 0);
    CCPD_CFG_RAM_WR_EN   :out std_logic;
    CCPD_RAM_WR_DAT      :out std_logic_vector(31 downto 0);
    CCPD_CFG_RAM_ADDR    :out std_logic_vector(3 downto 0);
    CCPD_CFG_RAM_RD_DAT  :in std_logic_vector(31 downto 0);
    CCPD_CFG_OUTPUT_EN   :out std_logic_vector(1 downto 0);

    CCPD_INJ_FLG         :out std_logic;
    CCPD_INJ_PLS_CNT     :out std_logic_vector(15 downto 0);
    CCPD_INJ_HIGH_CNT    :out std_logic_vector(31 downto 0);
    CCPD_INJ_LOW_CNT     :out std_logic_vector(31 downto 0);
    CCPD_INJ_OUT_EN      :out std_logic_vector(3  downto 0);
    CCPD_TRI_DLY_CNT     :out std_logic_vector(4  downto 0)    					
);		  
end iobus_interface;
  
architecture Behavioral of iobus_interface is

constant CTRLBASEADDR	 : std_logic_vector(15 downto 0) := x"43c0";
signal wr                :std_logic;
signal rd                :std_logic;
signal addr              :std_logic_vector(31 downto 0);
signal rdack_i           :std_logic;
signal wrack_i           :std_logic;
signal ip2bus_data_i     :std_logic_vector(31 downto 0);
                  
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
				if  (addr(31 downto 16) = BASE_ADDR(31 downto 16)) then
					case addr(15 downto 0) is

                        when x"0004" =>   if (wr = '1') then RST_CTRL <= Bus2IP_Data; 
                                          end if;
                                          
                        --ADC FCLK frequency readout                                       						
                        when x"0008" =>   if (rd = '1') then 
                                                ip2bus_data_i(19 downto 0) <= ADC_DCLK_FREQ;
                                                ip2bus_data_i(31 downto 20)<= (others => '0');
                                          else  ip2bus_data_i  <= (others => '0');
                                          end if;  
                        when x"000C" =>   if (rd = '1') then ip2bus_data_i(19 downto 0) <= ADC_FCLK_FREQ;
                                                             ip2bus_data_i(31 downto 20)<= (others => '0');                    
                                          else               ip2bus_data_i              <= (others => '0');
                                          end if;                                                                					                       
						--ADC LVDS Frame sample position setting
                        when x"0010" =>   if (wr = '1' ) then ADC_FCLK_POS  <= Bus2IP_Data(3 downto 0); 
                                          end if;
                                     
                        -- FEI4 configuration module control signals
                        when x"0014" =>   if (wr = '1') then FEI4_CFG_FLG <= Bus2IP_Data(0);
                                          end if;                                        
                        when x"0018" =>   if (wr = '1') then  FEI4_CFG_REG <= Bus2IP_Data; 
                                          end if;                                       
                        when x"0020" =>   if (wr = '1') then  FEI4_WR_REG_DAT <= Bus2IP_Data(15 downto 0); 
                                                        end if;
                        when x"0024" =>   if (wr = '1') then  FEI4_CMD_PH_SEL <= Bus2IP_Data(3 downto 0); 
                                                        end if;                                                          
                        --FEI4 CFG RAM                                        
                        when x"0028" =>   if(wr = '1') then FEI4_FR_RAM_ADDR <= Bus2IP_Data(5 downto 0);
                                          end if;                        
                        when x"002c" =>   if(wr = '1') then FEI4_FR_RAM_DAT_IN <= Bus2IP_Data;
                                          elsif (rd = '1') then ip2bus_data_i <= FEI4_FR_RAM_DAT_OUT;
                                          end if;                                                        
                        
                        -- FEI4 RX module control signals                                 
                        when x"0030" =>   if(wr = '1') then  FEI4_FRAME_SYNC_EN <= Bus2IP_Data(1 downto 0); 
                                          end if;           
                        when x"0034" =>   if (wr = '1') then  FEI4_FE_SR_RD_EN <= Bus2IP_Data(1 downto 0); 
                                      end if;                                 
                        when x"0038" =>   if(rd = '1') then ip2bus_data_i <= FEI4_REG_ADDR_OUT;
                                          end if;                                      

                        when x"003C" =>   if(rd = '1') then ip2bus_data_i <= FEI4_REG_VALUE_OUT;
                                          end if;                                                                
                        -- FEI4 Data input delay control signals
                        when x"0040" =>   if (rd = '1' ) then 
                                              ip2bus_data_i(31 downto 16)<= (others => '0');
                                              ip2bus_data_i(15)          <= FEI4_IDELAY_CTRL_RDY(1);
                                              ip2bus_data_i(14 downto 13)<= (others => '0');
                                              ip2bus_data_i(12 downto 8) <= FEI4_IDELAY_CNT_OUT(9 downto 5); 
                                              ip2bus_data_i(7)           <= FEI4_IDELAY_CTRL_RDY(0);
                                              ip2bus_data_i(6 downto 5)  <= (others => '0');
                                              ip2bus_data_i(4 downto 0)  <= FEI4_IDELAY_CNT_OUT(4 downto 0); 
                                          else                
                                              ip2bus_data_i             <= (others => '0');
                                          end if;
                        when x"0044" =>   if (wr = '1' ) then FEI4_IDELAY_CNT_IN  <= Bus2IP_Data(9 downto 0); 
                                          end if;
                                          
                        when x"0048" =>   if (wr = '1' ) then FEI4_IDELAY_LD  <= Bus2IP_Data(1 downto 0); 
                                          end if;   
                                             
                        when x"004C" =>   if (wr = '1' ) then FEI4_CAL_CNT_DELAY  <= Bus2IP_Data(31 downto 0); 
                                           end if;    
                                          
                                                                                                                                                                                 
                        ------AXI HP                                                                               
                        when x"005C" =>   if (wr = '1')  then  HP_GEN_RST      <= Bus2IP_Data(3 downto 0); 
                                          end if; 
                                                                                                                               
                        when x"0060" =>   if (wr = '1')  then  
                                              HP_TRIGER       <= Bus2IP_Data(3 downto 0); 
                                              HP_FIFO_RST     <= Bus2IP_Data(7 downto 4);
                                              HP_ADDR_RST     <= Bus2IP_Data(11 downto 8); 
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

                        when x"0080" =>   if (wr = '1') then   PL_IIC_CMD_FLG  <= Bus2IP_Data(0);           
                        end if;

                      
                        when x"0084" =>   if (wr = '1') then  PL_IIC_CTRL_IN  <= Bus2IP_Data;
                        end if;

                      
                        when x"0088" =>   if (wr = '1') then  PL_IIC_WR_BUF  <=  Bus2IP_Data;
                        end if;

                      
                        when x"008c" =>    if (rd = '1')then  ip2bus_data_i  <=  PL_IIC_RD_BUF;
                        end if;


                        when x"0090" =>   if (wr = '1') then CCPD_CFG_FLG <= Bus2IP_Data(0);
                        end if; 
                        
                        when x"0094" =>   if (wr = '1') then CCPD_CFG_REG_LIMIT <= Bus2IP_Data(4 downto 0);
                        end if;   
                                         
                        when x"0098" =>   if (wr = '1') then CCPD_CFG_SHIFT_LIMIT <= Bus2IP_Data(4 downto 0);
                        end if;     
                                                                                                    						
                        when x"009C" =>   if (wr = '1') then CCPD_CFG_CLK_EN <= Bus2IP_Data(1 downto 0);
                        end if;  
                                        
                        when x"00a0" =>   if (wr = '1') then CCPD_CFG_RAM_WR_EN <= Bus2IP_Data(0);
                        end if;   
                                               
                        when x"00a4" =>   if (wr = '1') then CCPD_RAM_WR_DAT <= Bus2IP_Data;
                        end if; 
                                        
                        when x"00a8" =>   if (wr = '1') then CCPD_CFG_RAM_ADDR <= Bus2IP_Data(3 downto 0); 
                        end if;                                         

                        when x"00ac" =>   if (rd = '1') then ip2bus_data_i <= CCPD_CFG_RAM_RD_DAT;                                         
                        end if; 

                        when x"00b0" =>   if (wr = '1') then CCPD_CFG_OUTPUT_EN <= Bus2IP_Data(1 downto 0);                                         
                        end if; 
                                                
                        when x"00b4" =>   if (wr = '1') then CCPD_INJ_FLG <= Bus2IP_Data(0);                                         
                        end if;                         

                        when x"00b8" =>   if (wr = '1') then CCPD_INJ_PLS_CNT <= Bus2IP_Data(15 downto 0);                                         
                        end if;   

                        when x"00bc" =>   if (wr = '1') then CCPD_INJ_HIGH_CNT <= Bus2IP_Data;                                         
                        end if;  

                        when x"00c0" =>   if (wr = '1') then CCPD_INJ_LOW_CNT <= Bus2IP_Data;                                         
                        end if;  

                        when x"00c4" =>   if (wr = '1') then CCPD_INJ_OUT_EN <= Bus2IP_Data(3 downto 0);                                                           
                        end if; 
                        
                        when x"00c8" =>   if (wr = '1') then CCPD_TRI_DLY_CNT <= Bus2IP_Data(4 downto 0);                                                           
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
