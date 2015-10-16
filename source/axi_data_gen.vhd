-------------------------------------------------------------------------------
-- Title         : AXI Data Generator
-------------------------------------------------------------------------------
-- File          : axi_data_gen.vhd
-- Author        : Joseph Mead  mead@bnl.gov
-- Created       : 01/11/2013
-------------------------------------------------------------------------------
-- Description:
-- Provides logic to send adc or test data to FIFO interface.
-- A testdata_en input permits test counters to be sent for verification 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Modification history:
-- 01/11/2013: created.
-- 09/30/2014  Modified by Hongbin.
-- 10/16/2014  Change testdata generator
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity axi_data_gen is
  
  port (
    adc_clk          	: in  std_logic;
    reset      			: in  std_logic; 
                          
    trig		 		: in  std_logic; --Burst trigger
	adcburst_enb		: in  std_logic; --Burst enable
	adcburst_len		: in  std_logic_vector(31 downto 0); --Burst lenth
	testdata_en  		: in  std_logic; --Testdata enble	 
	 
	adc_ch0				: in  std_logic_vector(15 downto 0);
	adc_ch1				: in  std_logic_vector(15 downto 0);
	adc_ch2				: in  std_logic_vector(15 downto 0);
	adc_ch3				: in  std_logic_vector(15 downto 0);
	adc_ch4				: in  std_logic_vector(15 downto 0);
	adc_ch5				: in  std_logic_vector(15 downto 0);
	adc_ch6				: in  std_logic_vector(15 downto 0);
	adc_ch7				: in  std_logic_vector(15 downto 0);	
	 
	adcdata		 		: out std_logic_vector(127 downto 0);
    adcdata_wren	 	: out std_logic; --Write fifo enable
	adcburst_active  	: out std_logic  --Status signal, not used in mburst module.   
  );    

end axi_data_gen;

architecture rtl of axi_data_gen is



type     adc_state_type is (IDLE, ACTIVE);                    
signal   adc_state      : adc_state_type;


signal adclen				: std_logic_vector(31 downto 0);
signal testdata0			: std_logic_vector(15 downto 0); 
signal testdata1			: std_logic_vector(15 downto 0);
signal testdata2			: std_logic_vector(15 downto 0);
signal testdata3			: std_logic_vector(15 downto 0);
signal testdata4			: std_logic_vector(15 downto 0); 
signal testdata5			: std_logic_vector(15 downto 0);
signal testdata6			: std_logic_vector(15 downto 0);
signal testdata7			: std_logic_vector(15 downto 0); 

signal adcdata_wren_i		: std_logic;   

signal adc_strobe_lat		: std_logic;
signal adc_strobe_clr		: std_logic;
 
signal adc_ch0_i            : std_logic_vector(15 downto 0);
signal adc_ch1_i            : std_logic_vector(15 downto 0);
signal adc_ch2_i            : std_logic_vector(15 downto 0);
signal adc_ch3_i            : std_logic_vector(15 downto 0);
signal adc_ch4_i            : std_logic_vector(15 downto 0);
signal adc_ch5_i            : std_logic_vector(15 downto 0);
signal adc_ch6_i            : std_logic_vector(15 downto 0);
signal adc_ch7_i            : std_logic_vector(15 downto 0);      
  
 
  
begin  

--------------------------------------Timing----------------------------------------

--                                            ______________________________________
--  adc_strobe_clr __________________________|
--                                    _____________
--  adc_burst_enb  __________________|             |________________________________
--                                        __________________________________________
--  trigger        ______________________|
--                                        _______
--  adc_strobe_lat   ____________________|       |__________________________________

------------------------------------------------------------------------------------

adc_ch0_i <= adc_ch0;
adc_ch1_i <= adc_ch1;
adc_ch2_i <= adc_ch2;
adc_ch3_i <= adc_ch3;
adc_ch4_i <= adc_ch4;
adc_ch5_i <= adc_ch5;
adc_ch6_i <= adc_ch6;
adc_ch7_i <= adc_ch7;


 adcburst_active <= adc_strobe_clr;

  --latch store_data trigger
  process (trig, adc_strobe_clr, reset)
   begin
      if (reset = '1') OR (adc_strobe_clr = '1') then
	     adc_strobe_lat <= '0';
      elsif rising_edge(trig) then
	      if (adcburst_enb = '1') then
		      adc_strobe_lat <= '1';
			end if;
		end if;
   end process;
   
   
  --write burst_len adc samples to npi
  process (adc_clk, reset)
  begin  
    if (reset = '1') then 	
        testdata0 <= x"0000"; 
        testdata1 <= x"0001"; 
        testdata2 <= x"0002"; 
        testdata3 <= x"0003"; 
		testdata4 <= x"0004"; 
        testdata5 <= x"0005"; 
        testdata6 <= x"0006"; 
        testdata7 <= x"0007"; 

		adc_state <= IDLE;
		adclen <= (others => '0');
		adcdata_wren_i <= '0';
		adc_strobe_clr <= '0';
	  
		  

    elsif rising_edge(adc_clk) then  
      case adc_state is
        when IDLE =>  
            if (adc_strobe_lat = '1') then --adc_strobe_lat is just a trigger fo state transfer from IDLE to ACTIVE
				adc_strobe_clr <= '1';     --Trigger is finished, then the strobe_lat is deassert.
				adcdata_wren_i <= '1';
				testdata0 <= x"0000"; 
				testdata1 <= x"0001"; 
				testdata2 <= x"0002"; 
				testdata3 <= x"0003"; 	
				testdata4 <= x"0004"; 
				testdata5 <= x"0005"; 
				testdata6 <= x"0006"; 
				testdata7 <= x"0007"; 	
				
				adclen <= adcburst_len;				
                adc_state <= ACTIVE; 
            end if;

        when ACTIVE =>  
			if (adclen = x"00000001") then
				adc_state <= idle;				
				adc_strobe_clr <= '0';  --Deassert strobe_clr, and waiting for the next trriger then to deassert the strobe_lat signal.
			    adcdata_wren_i <= '0';
			else
			    adclen <= adclen - 1;
			    testdata0 <= testdata0 + 8;
			    testdata1 <= testdata1 + 8;
			    testdata2 <= testdata2 + 8;
			    testdata3 <= testdata3 + 8;	
			    testdata4 <= testdata4 + 8;
			    testdata5 <= testdata5 + 8;
			    testdata6 <= testdata6 + 8;
			    testdata7 <= testdata7 + 8;					
			end if;	
				
	
        when others =>
            adc_state <= IDLE;
      end case;
    end if;
  end process;

-----------------------------------------------------------------
-- ADC Data
----------------------------------------------------------------- 
--real or test data selection and endian conversion
  process (adc_clk)
    begin
      if rising_edge(adc_clk) then  
		   adcdata_wren	<= adcdata_wren_i; --adcdata_wren_i is controled by data generation process...
		                                   --Fifo write enable
			if (testdata_en = '1') then
				adcdata(15 downto 0)   	<= testdata4(15 downto 0); 
				adcdata(31 downto 16) 	<= testdata5(15 downto 0);
				adcdata(47 downto 32) 	<= testdata6(15 downto 0);
				adcdata(63 downto 48) 	<= testdata7(15 downto 0);
				adcdata(79 downto 64)  	<= testdata0(15 downto 0); 
				adcdata(95 downto 80) 	<= testdata1(15 downto 0);
				adcdata(111 downto 96) 	<= testdata2(15 downto 0);
				adcdata(127 downto 112)	<= testdata3(15 downto 0);
					
			else
				adcdata(15 downto 0)   	<= adc_ch4_i(15 downto 0);
				adcdata(31 downto 16) 	<= adc_ch5_i(15 downto 0);
				adcdata(47 downto 32) 	<= adc_ch6_i(15 downto 0); 
				adcdata(63 downto 48) 	<= adc_ch7_i(15 downto 0);
				adcdata(79 downto 64)  	<= adc_ch0_i(15 downto 0);
				adcdata(95 downto 80) 	<= adc_ch1_i(15 downto 0);
				adcdata(111 downto 96) 	<= adc_ch2_i(15 downto 0); 
				adcdata(127 downto 112)	<= adc_ch3_i(15 downto 0);
					
			end if;
		end if;
  end process;


  
end rtl;
