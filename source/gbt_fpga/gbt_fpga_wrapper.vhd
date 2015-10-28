----------------------------------------------------------------------------------
-- company: 
-- engineer: 
-- 
-- create date:    16:30:05 07/28/2015 
-- design name: 
-- module name:    top - behavioral 
-- project name: 
-- target devices: 
-- tool versions: 
-- description: 
--
-- dependencies: 
--
-- revision: 
-- revision 0.01 - file created      -Kai Chen
-- revision 0.02 - Migarate to ZC706 -Hongbin Liu
-- additional comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- xilinx devices library:
library unisim;
use unisim.vcomponents.all;

-- custom libraries and packages:
use work.vendor_specific_gbt_bank_package.all;

entity gbt_fpga_wrapper is
 port (                 
    CPU_RESET                                      : in  std_logic;     
    
--    USER_CLOCK_P                                   : in  std_logic;
--    USER_CLOCK_N                                   : in  std_logic;   
    SYSCLK                               : in  std_logic;
    
    SMA_MGT_REFCLK_P                               : in  std_logic;
    SMA_MGT_REFCLK_N                               : in  std_logic; 
    
    SFP_TX_P                                       : out std_logic;
    SFP_TX_N                                       : out std_logic;
    SFP_RX_P                                       : in  std_logic;
    SFP_RX_N                                       : in  std_logic;                  
    SFP_TX_DISABLE                                 : out std_logic;

    -- TX data:
    -----------     
    TX_IS_DATA_I                                   : in  std_logic;
    TX_DATA_I                                      : in  std_logic_vector(83 downto 0); 
    TX_EXTRA_DATA_WIDEBUS_I                        : in  std_logic_vector(31 downto 0);     
    TX_EXTRA_DATA_GBT8B10B_I                       : in  std_logic_vector( 3 downto 0);

    -- TX data:
    -----------     
    RX_IS_DATA_O                                   : out  std_logic;
    RX_DATA_O                                      : out  std_logic_vector(83 downto 0); 
    RX_EXTRA_DATA_WIDEBUS_O                        : out  std_logic_vector(31 downto 0);     
    RX_EXTRA_DATA_GBT8B10B_O                       : out  std_logic_vector( 3 downto 0);
        
    TX_FRAME_CLK_O                                 : out std_logic;
    RX_FRAME_CLK_O                                 : out std_logic;
          
    GPIO_LED_LEFT                                  : out std_logic;
    GPIO_LED_CENTER                                : out std_logic;
    GPIO_LED_RIGHT                                 : out std_logic;
    GPIO_LED_0                                     : out std_logic
);  
end gbt_fpga_wrapper;

architecture behavioral of gbt_fpga_wrapper is


COMPONENT ila_0
  PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(83 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe3 : IN STD_LOGIC
  );
END COMPONENT;

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;


--================================ signal declarations ================================--       
attribute MARK_DEBUG : string;    
--===============--     
-- general reset --     
--===============--     
signal reset_from_genrst                          : std_logic;    

--===============--
-- clocks scheme -- 
--===============--   
-- fabric clock:
---------------- 
signal fabricclk_from_userclockibufgds            : std_logic;     
-- mgt(gtx) reference clock:     
----------------------------     
signal mgtrefclk_from_smamgtrefclkibufdsgtxe2     : std_logic;   
--=========================--
-- gbt bank example design --
--=========================--
-- control:
-----------
signal generalreset_from_user                     : std_logic;      
signal manualresettx_from_user                    : std_logic; 
signal manualresetrx_from_user                    : std_logic; 
signal clkmuxsel_from_user                        : std_logic;       
signal testpattersel_from_user                    : std_logic_vector(1 downto 0); 
signal loopback_from_user                         : std_logic_vector(2 downto 0); 
signal resetdataerrorseenflag_from_user           : std_logic; 
signal resetgbtrxreadylostflag_from_user          : std_logic; 
signal txisdatasel_from_user                      : std_logic;   --debug    

--attribute MARK_DEBUG of generalreset_from_user,clkmuxsel_from_user, testpattersel_from_user : signal is "TRUE";   
--attribute MARK_DEBUG of loopback_from_user,resetdataerrorseenflag_from_user, resetgbtrxreadylostflag_from_user : signal is "TRUE"; 
--attribute MARK_DEBUG of txisdatasel_from_user,manualresettx_from_user, manualresetrx_from_user : signal is "TRUE";  
--------------------------------------------------      
signal latoptgbtbanktx_from_gbtexmpldsgn          : std_logic;
signal latoptgbtbankrx_from_gbtexmpldsgn          : std_logic;
signal txframeclkplllocked_from_gbtexmpldsgn      : std_logic;
signal mgtready_from_gbtexmpldsgn                 : std_logic; 
signal rxbitslipnbr_from_gbtexmpldsgn             : std_logic_vector(gbtrx_bitslip_nbr_msb downto 0);
signal rxwordclkready_from_gbtexmpldsgn           : std_logic; 
signal rxframeclkready_from_gbtexmpldsgn          : std_logic; 
signal gbtrxready_from_gbtexmpldsgn               : std_logic;    
signal rxisdata_from_gbtexmpldsgn                 : std_logic;    --debug    
signal gbtrxreadylostflag_from_gbtexmpldsgn       : std_logic; 
signal rxdataerrorseen_from_gbtexmpldsgn          : std_logic; 
signal rxextrdatawidebuserseen_from_gbtexmpldsgn  : std_logic; 
signal rxextrdatagbt8b10berseen_from_gbtexmpldsgn : std_logic;

--attribute MARK_DEBUG of rxisdata_from_gbtexmpldsgn,txframeclkplllocked_from_gbtexmpldsgn,latoptgbtbanktx_from_gbtexmpldsgn : signal is "TRUE";  
--attribute MARK_DEBUG of mgtready_from_gbtexmpldsgn,rxwordclkready_from_gbtexmpldsgn,rxbitslipnbr_from_gbtexmpldsgn : signal is "TRUE"; 
--attribute MARK_DEBUG of rxframeclkready_from_gbtexmpldsgn, gbtrxready_from_gbtexmpldsgn, gbtrxreadylostflag_from_gbtexmpldsgn : signal is "TRUE";  
--attribute MARK_DEBUG of rxdataerrorseen_from_gbtexmpldsgn, rxextrdatawidebuserseen_from_gbtexmpldsgn  : signal is "TRUE";  
--attribute MARK_DEBUG of rxextrdatagbt8b10berseen_from_gbtexmpldsgn,latoptgbtbankrx_from_gbtexmpldsgn  : signal is "TRUE";  

-- data:
--------
signal txdata_from_gbtexmpldsgn                   : std_logic_vector(83 downto 0);
signal rxdata_from_gbtexmpldsgn                   : std_logic_vector(83 downto 0);
--attribute MARK_DEBUG of txdata_from_gbtexmpldsgn,rxdata_from_gbtexmpldsgn : signal is "TRUE";
--------------------------------------------------      
signal txextradatawidebus_from_gbtexmpldsgn       : std_logic_vector(31 downto 0);
signal rxextradatawidebus_from_gbtexmpldsgn       : std_logic_vector(31 downto 0);
--attribute MARK_DEBUG of txextradatawidebus_from_gbtexmpldsgn,rxextradatawidebus_from_gbtexmpldsgn : signal is "TRUE";
--------------------------------------------------
signal txextradatagbt8b10b_from_gbtexmpldsgn      : std_logic_vector( 3 downto 0);
signal rxextradatagbt8b10b_from_gbtexmpldsgn      : std_logic_vector( 3 downto 0); 
--attribute MARK_DEBUG of txextradatagbt8b10b_from_gbtexmpldsgn,rxextradatagbt8b10b_from_gbtexmpldsgn : signal is "TRUE";

--===========--
-- VIO --
--===========--
--------------------------------------------------
signal sync_from_vio                              : std_logic_vector(11 downto 0);
signal async_to_vio                               : std_logic_vector(17 downto 0);

--=====================--
-- latency measurement --
--=====================--
signal txframeclk_from_gbtexmpldsgn               : std_logic;
signal txwordclk_from_gbtexmpldsgn                : std_logic;
signal rxframeclk_from_gbtexmpldsgn               : std_logic;
signal rxwordclk_from_gbtexmpldsgn                : std_logic;
--------------------------------------------------                                    
signal txmatchflag_from_gbtexmpldsgn              : std_logic;
signal rxmatchflag_from_gbtexmpldsgn              : std_logic;

--=====================================================================================--   

signal    data                : std_logic_vector(15 downto 0);
 
signal    gbtx_rw_finish,error_rx705,error_rx,error_rst :    std_logic;  
signal    kc705rx_buf                             : std_logic_vector(31 downto 0);
signal    control0,control1,control3,control4     : std_logic_vector(35 downto 0);

begin
   --====================================cern gbt fpga logic =====================================--
   
   --=============--
   -- sfp control -- 
   --=============-- 
   sfp_tx_disable                                    <= '0';   
   
   --===============--
   -- general reset -- 
   --===============--
 genrst: entity work.gen_reset
    generic map (
       clk_freq                                    => 100e6
    )
    port map (     
       clk_i                                       => sysclk,
       reset1_b_i                                  => not cpu_reset, 
       reset2_b_i                                  => not generalreset_from_user,
       reset_o                                     => reset_from_genrst 
    ); 

   --===============--
   -- clocks scheme -- 
   --===============--   

--   -- fabric clock:
--   ----------------
--   -- comment: user_clock frequency: 156mhz 
--   userclockibufgds: ibufgds
--      generic map (
--         ibuf_low_pwr                                => false,      
--         iostandard                                  => "lvds_25")
--      port map (     
--         o                                           => fabricclk_from_userclockibufgds,   
--         i                                           => user_clock_p,  
--         ib                                          => user_clock_n 
--      );
   
   -- mgt(gtx) reference clock:
   ----------------------------
   -- comment: * the mgt reference clock must be provided by an external clock generator.
   --
   --          * the mgt reference clock frequency must be 120mhz for the latency-optimized gbt bank. 
   smamgtrefclkibufdsgtxe2:ibufds_gte2
      port map (
         o                                           => mgtrefclk_from_smamgtrefclkibufdsgtxe2,
         odiv2                                       => open,
         ceb                                         => '0',
         i                                           => sma_mgt_refclk_p,
         ib                                          => sma_mgt_refclk_n
      );
      
   --=========================--
   -- gbt bank example design --
   --=========================--
   process(error_rst,rxframeclk_from_gbtexmpldsgn)
   begin
    if error_rst='1' then
     error_rx705 <='0';
    elsif rxframeclk_from_gbtexmpldsgn'event and rxframeclk_from_gbtexmpldsgn='1' then
     kc705rx_buf <= rxdata_from_gbtexmpldsgn(31 downto 0);
     if kc705rx_buf = (not rxdata_from_gbtexmpldsgn(31 downto 0)) then
      error_rx705 <= error_rx705;
     else
      error_rx705<='1';
     end if;
   end if;
   end process;

   gbtexmpldsgn: entity work.gbt_fpga_core
      generic map (
      gbtbank_reset_clk_freq                      => 156e6
      )      
      port map (
  
--      tdi  => open,
--      tck  => open,
--      tms  => open,
--      tdo  => open, 
 
      -- resets scheme:      
      general_reset_i                             => reset_from_genrst,                   
      --------------------------------------------
      manual_reset_tx_i                           => manualresettx_from_user,
      manual_reset_rx_i                           => manualresetrx_from_user,
      -- clocks scheme:                           
      fabric_clk_i                                => fabricclk_from_userclockibufgds,
      mgt_refclk_i                                => mgtrefclk_from_smamgtrefclkibufdsgtxe2,             
      -- serial lanes:                            
      mgt_tx_p                                    => sfp_tx_p,                
      mgt_tx_n                                    => sfp_tx_n,                
      mgt_rx_p                                    => sfp_rx_p,                 
      mgt_rx_n                                    => sfp_rx_n,
      -- general control:                       
      loopback_i                                  => loopback_from_user,  
      tx_isdata_sel_i                             => TX_IS_DATA_I,                 
      --------------------------------------------      
      latopt_gbtbank_tx_o                         => latoptgbtbanktx_from_gbtexmpldsgn,             
      latopt_gbtbank_rx_o                         => latoptgbtbankrx_from_gbtexmpldsgn,             
      tx_frameclk_pll_locked_o                    => txframeclkplllocked_from_gbtexmpldsgn,
      mgt_ready_o                                 => mgtready_from_gbtexmpldsgn,             
      rx_bitslip_number_o                         => rxbitslipnbr_from_gbtexmpldsgn,            
      rx_wordclk_ready_o                          => rxwordclkready_from_gbtexmpldsgn,           
      rx_frameclk_ready_o                         => rxframeclkready_from_gbtexmpldsgn,            
      gbt_rx_ready_o                              => gbtrxready_from_gbtexmpldsgn,
      rx_isdata_flag_o                            => rxisdata_from_gbtexmpldsgn,            
      -- gbt bank data:                           
      tx_data_i                                   => TX_DATA_I,            
      tx_extra_data_widebus_i                     => TX_EXTRA_DATA_WIDEBUS_I,
      tx_extra_data_gbt8b10b_i                    => TX_EXTRA_DATA_GBT8B10B_I,
      --------------------------------------------      
      rx_data_o                                   => rxdata_from_gbtexmpldsgn,           
      rx_extra_data_widebus_o                     => rxextradatawidebus_from_gbtexmpldsgn,
      rx_extra_data_gbt8b10b_o                    => rxextradatagbt8b10b_from_gbtexmpldsgn,
      -- test control:                    
      test_pattern_sel_i                          => testpattersel_from_user,        
      --------------------------------------------                          
      reset_gbtrxready_lost_flag_i                => resetgbtrxreadylostflag_from_user,     
      reset_data_errorseen_flag_i                 => resetdataerrorseenflag_from_user,     
      gbtrxready_lost_flag_o                      => gbtrxreadylostflag_from_gbtexmpldsgn,       
      rxdata_errorseen_flag_o                     => rxdataerrorseen_from_gbtexmpldsgn,      
      rxextradata_widebus_errorseen_flag_o        => rxextrdatawidebuserseen_from_gbtexmpldsgn,
      rxextradata_gbt8b10b_errorseen_flag_o       => rxextrdatagbt8b10berseen_from_gbtexmpldsgn,
      -- latency measurement:                     
      tx_frameclk_o                               => txframeclk_from_gbtexmpldsgn,        
      tx_wordclk_o                                => txwordclk_from_gbtexmpldsgn,          
      rx_frameclk_o                               => rxframeclk_from_gbtexmpldsgn,         
      rx_wordclk_o                                => rxwordclk_from_gbtexmpldsgn,          
      --------------------------------------------                     
      tx_matchflag_o                              => txmatchflag_from_gbtexmpldsgn,          
      rx_matchflag_o                              => rxmatchflag_from_gbtexmpldsgn          
      );                                        
   

   --==============--   
   -- test control --   
   --==============--

   -- signals mapping:
   -------------------
    generalreset_from_user                            <= sync_from_vio( 0);          
    clkmuxsel_from_user                               <= sync_from_vio( 1);
    testpattersel_from_user                           <= sync_from_vio( 3 downto  2); 
    loopback_from_user                                <= sync_from_vio( 6 downto  4);
    resetdataerrorseenflag_from_user                  <= sync_from_vio( 7);
    resetgbtrxreadylostflag_from_user                 <= sync_from_vio( 8);
    txisdatasel_from_user                             <= sync_from_vio( 9);
    manualresettx_from_user                           <= sync_from_vio(10);
    manualresetrx_from_user                           <= sync_from_vio(11);
    --------------------------------------------------      
    async_to_vio( 0)                                  <= rxisdata_from_gbtexmpldsgn;
    async_to_vio( 1)                                  <= txframeclkplllocked_from_gbtexmpldsgn;
    async_to_vio( 2)                                  <= latoptgbtbanktx_from_gbtexmpldsgn;
    async_to_vio( 3)                                  <= mgtready_from_gbtexmpldsgn;
    async_to_vio( 4)                                  <= rxwordclkready_from_gbtexmpldsgn;    
    async_to_vio(10 downto 5)                         <= rxbitslipnbr_from_gbtexmpldsgn; 
    async_to_vio(11)                                  <= rxframeclkready_from_gbtexmpldsgn;   
    async_to_vio(12)                                  <= gbtrxready_from_gbtexmpldsgn;          
    async_to_vio(13)                                  <= gbtrxreadylostflag_from_gbtexmpldsgn;  
    async_to_vio(14)                                  <= rxdataerrorseen_from_gbtexmpldsgn;   
    async_to_vio(15)                                  <= rxextrdatawidebuserseen_from_gbtexmpldsgn;
    async_to_vio(16)                                  <= rxextrdatagbt8b10berseen_from_gbtexmpldsgn;
    async_to_vio(17)                                  <= latoptgbtbankrx_from_gbtexmpldsgn;

   -- chipscope:
   -------------   
   -- comment: * chipscope is used to control the example design as well as for transmitted and received data analysis.
   --
   --          * note!! tx and rx data do not share the same ila module (txila and rxila respectively) 
   --            because when receiving rx data from another board with a different reference clock, the 
   --            tx_frameclk/tx_wordclk domains are asynchronous with respect to the rx_frameclk/rx_wordclk domains.        
   --
   --          * after fpga configuration using chipscope, open the project "kc705_gbt_example_design.cpj" 
   --            that can be found in:
   --            "..\example_designs\xilix_k7v7\kc705\chipscope_project\".  
         
vio: vio_0
  PORT MAP (
    clk => txframeclk_from_gbtexmpldsgn,
    probe_in0 => async_to_vio,
    probe_out0 => sync_from_vio
  );

--tx_ila: ila_0
--PORT MAP (
--    clk => txframeclk_from_gbtexmpldsgn,
--    probe0 => txdata_from_gbtexmpldsgn,
--    probe1 => txextradatawidebus_from_gbtexmpldsgn,    
--    probe2 => txextradatagbt8b10b_from_gbtexmpldsgn,
--    probe3 => txisdatasel_from_user
--);
     
--rx_ila: ila_0
--  PORT MAP (
--    clk => rxframeclk_from_gbtexmpldsgn,
--    probe1 => rxextradatawidebus_from_gbtexmpldsgn,
--    probe0 => rxdata_from_gbtexmpldsgn,
--    probe2 => rxextradatagbt8b10b_from_gbtexmpldsgn,
--    probe3 => rxisdata_from_gbtexmpldsgn
--  );
   
   -- on-board leds:                   
   -----------------    
   GPIO_LED_LEFT                                   <= latoptgbtbanktx_from_gbtexmpldsgn and latoptgbtbankrx_from_gbtexmpldsgn;          
   GPIO_LED_CENTER                                 <= txframeclkplllocked_from_gbtexmpldsgn;
   GPIO_LED_RIGHT                                  <= mgtready_from_gbtexmpldsgn;
   GPIO_LED_0                                      <= gbtrxready_from_gbtexmpldsgn;
--   gpio_led_4_ls                                 <= gbtrxreadylostflag_from_gbtexmpldsgn;
--   gpio_led_5_ls                                 <= rxdataerrorseen_from_gbtexmpldsgn;
--   gpio_led_6_ls                                 <= rxextrdatawidebuserseen_from_gbtexmpldsgn;
  -- gpio_led_7_ls                                 <= rxextrdatagbt8b10berseen_from_gbtexmpldsgn;
   TX_FRAME_CLK_O <= txframeclk_from_gbtexmpldsgn;
   RX_FRAME_CLK_O <= rxframeclk_from_gbtexmpldsgn;
   RX_IS_DATA_O   <= rxisdata_from_gbtexmpldsgn;
   RX_DATA_O      <= rxdata_from_gbtexmpldsgn;
   
end behavioral;