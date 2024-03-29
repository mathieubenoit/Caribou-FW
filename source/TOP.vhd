--Hongbin JUL2015
--ZC706
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity TOP is
  port(
    CLK200_IN_P                                 : IN   STD_LOGIC;
    CLK200_IN_N                                 : IN   STD_LOGIC;
    --10MHz reference clock for signal generator
    SIG_CLK                                     : OUT  STD_LOGIC;

    HPC_LVDS6_P                                 : OUT  STD_LOGIC;
    HPC_LVDS6_N                                 : OUT  STD_LOGIC;       
    HPC_LVDS12_P                                : OUT  STD_LOGIC;
    HPC_LVDS12_N                                : OUT  STD_LOGIC;

    LPC_LVDS1_P                                 : OUT  STD_LOGIC;
    LPC_LVDS1_N                                 : OUT  STD_LOGIC;       
    LPC_LVDS2_P                                 : OUT  STD_LOGIC;
    LPC_LVDS2_N                                 : OUT  STD_LOGIC;
    LPC_LVDS3_P                                 : OUT  STD_LOGIC;
    LPC_LVDS3_N                                 : OUT  STD_LOGIC;       
    LPC_LVDS4_P                                 : OUT  STD_LOGIC;
    LPC_LVDS4_N                                 : OUT  STD_LOGIC;
               
    LPC_LVDS6_P                                 : OUT  STD_LOGIC;
    LPC_LVDS6_N                                 : OUT  STD_LOGIC;       
    LPC_LVDS12_P                                : OUT  STD_LOGIC;
    LPC_LVDS12_N                                : OUT  STD_LOGIC;
    
    --ADC LVDS INPUT PAIR
    ADC_FCLKP                                    : IN STD_LOGIC;
    ADC_FCLKM                                    : IN STD_LOGIC;
    ADC_DCLKP                                    : IN STD_LOGIC;
    ADC_DCLKM                                    : IN STD_LOGIC;
    ADC_DOUTP1                                   : IN STD_LOGIC;
    ADC_DOUTM1                                   : IN STD_LOGIC;
    ADC_DOUTP2                                   : IN STD_LOGIC;
    ADC_DOUTM2                                   : IN STD_LOGIC;
    ADC_DOUTP3                                   : IN STD_LOGIC;
    ADC_DOUTM3                                   : IN STD_LOGIC;
    ADC_DOUTP4                                   : IN STD_LOGIC;
    ADC_DOUTM4                                   : IN STD_LOGIC;
    ADC_DOUTP5                                   : IN STD_LOGIC;
    ADC_DOUTM5                                   : IN STD_LOGIC;
    ADC_DOUTP6                                   : IN STD_LOGIC;
    ADC_DOUTM6                                   : IN STD_LOGIC;
    --PS7 IO
    --*PS7 FIXED IO	
    PS7_FIXED_IO_MIO                             : INOUT STD_LOGIC_VECTOR(53 DOWNTO 0);
    PS7_FIXED_IO_DDR_VRN                         : INOUT STD_LOGIC;
    PS7_FIXED_IO_DDR_VRP                         : INOUT STD_LOGIC;
    PS7_FIXED_IO_PS_SRSTB                        : INOUT STD_LOGIC;
    PS7_FIXED_IO_PS_CLK                          : INOUT STD_LOGIC;
    PS7_FIXED_IO_PS_PORB                         : INOUT STD_LOGIC;
    
    --PS7 DDR IO
    PS7_DDR_CAS_N                                : INOUT STD_LOGIC;
    PS7_DDR_CKE                                  : INOUT STD_LOGIC;
    PS7_DDR_CK_N                                 : INOUT STD_LOGIC;
    PS7_DDR_CK_P                                 : INOUT STD_LOGIC;
    PS7_DDR_CS_N                                 : INOUT STD_LOGIC;
    PS7_DDR_RESET_N                              : INOUT STD_LOGIC;
    PS7_DDR_ODT                                  : INOUT STD_LOGIC;
    PS7_DDR_RAS_N                                : INOUT STD_LOGIC;
    PS7_DDR_WE_N                                 : INOUT STD_LOGIC;
    PS7_DDR_BA                                   : INOUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    PS7_DDR_ADDR                                 : INOUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    PS7_DDR_DM                                   : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    PS7_DDR_DQ                                   : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    PS7_DDR_DQS_N                                : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    PS7_DDR_DQS_P                                : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    PS7_IIC_SDA                                  : INOUT STD_LOGIC;
    PS7_IIC_SCL                                  : INOUT STD_LOGIC;
    
    IIC2_SDA                                     : INOUT STD_LOGIC;
    IIC2_SCL                                     : INOUT STD_LOGIC;
    
    --FEI4 IOs
    FEI4_DOB_P                                   : IN STD_LOGIC;
    FEI4_DOB_N                                   : IN STD_LOGIC;
    FEI4_A1_CMD_OUT_P                            : OUT STD_LOGIC;
    FEI4_A1_CMD_OUT_N                            : OUT STD_LOGIC;
    FEI4_A1_HIT_OR_P                             : IN STD_LOGIC;
    FEI4_A1_HIT_OR_N                             : IN STD_LOGIC;
        
    FEI4_A2_CMD_OUT_P                            : OUT STD_LOGIC;
    FEI4_A2_CMD_OUT_N                            : OUT STD_LOGIC;
    
    FEI4_B1_CMD_OUT_P                            : OUT STD_LOGIC;
    FEI4_B1_CMD_OUT_N                            : OUT STD_LOGIC;
    
    FEI4_B2_CMD_OUT_P                            : OUT STD_LOGIC;
    FEI4_B2_CMD_OUT_N                            : OUT STD_LOGIC;    
--    GPIO_LED_C                                   : OUT STD_LOGIC;
--    GPIO_LED_R                                   : OUT STD_LOGIC;
--    GPIO_LED_0                                   : OUT STD_LOGIC;
    --40MHz Clock output for CaR Board
    CLK40_OUT_P                                 : out STD_LOGIC;
    CLK40_OUT_N                                 : out STD_LOGIC                                 

);
end TOP;

architecture Behavioral of TOP is
--signal declaration
signal tied_to_ground :std_logic;
signal tied_to_vcc    :std_logic;
signal global_reset   :std_logic;

--mmcm clocks 
signal clk200m :std_logic; --Idelay reference clock
signal clk160m :std_logic; --FEI4 data bit clock
signal clk100m :std_logic; --output clock of mmcm module
signal clk40m  :std_logic; --ADC clock
signal clk16m  :std_logic; --FEI4 data byte clock
signal mmcm_reset :std_logic;
signal mmcm_locked:std_logic;
   
---------------------------------Keep Attribute-------------------------------
--PS7 Signals
signal    ps7_aclk             :  std_logic;
--AXI4LITE@PS7
signal    ps7_m00_axi_araddr   :  std_logic_vector ( 31 downto 0 );
signal    ps7_m00_axi_arprot   :  std_logic_vector ( 2 downto 0 );
signal    ps7_m00_axi_arready  :  std_logic;
signal    ps7_m00_axi_arvalid  :  std_logic;
signal    ps7_m00_axi_awaddr   :  std_logic_vector ( 31 downto 0 );
signal    ps7_m00_axi_awprot   :  std_logic_vector ( 2 downto 0 );
signal    ps7_m00_axi_awready  :  std_logic;
signal    ps7_m00_axi_awvalid  :  std_logic;
signal    ps7_m00_axi_bready   :  std_logic;
signal    ps7_m00_axi_bresp    :  std_logic_vector ( 1 downto 0 );
signal    ps7_m00_axi_bvalid   :  std_logic;
signal    ps7_m00_axi_rdata    :  std_logic_vector ( 31 downto 0 );
signal    ps7_m00_axi_rready   :  std_logic;
signal    ps7_m00_axi_rresp    :  std_logic_vector ( 1 downto 0 );
signal    ps7_m00_axi_rvalid   :  std_logic;
signal    ps7_m00_axi_wdata    :  std_logic_vector ( 31 downto 0 );
signal    ps7_m00_axi_wready   :  std_logic;
signal    ps7_m00_axi_wstrb    :  std_logic_vector ( 3 downto 0 );
signal    ps7_m00_axi_wvalid   :  std_logic;
signal    ps7_axi_areset       :  std_logic;
--attribute MARK_DEBUG of ps7_m00_axi_araddr,ps7_m00_axi_arready,ps7_m00_axi_arvalid,ps7_m00_axi_awaddr,ps7_m00_axi_awready,ps7_m00_axi_awvalid,ps7_m00_axi_bready,ps7_m00_axi_bresp,ps7_m00_axi_bvalid,ps7_m00_axi_rdata,ps7_m00_axi_rready,ps7_m00_axi_rresp,ps7_m00_axi_rvalid,ps7_m00_axi_wdata,ps7_m00_axi_wready,ps7_m00_axi_wstrb,ps7_m00_axi_wvalid: signal is "TRUE";


signal	m_axi_hp0_awaddr_t  :  std_logic_vector ( 31 downto 0 );
signal	m_axi_hp0_awburst_t :  std_logic_vector ( 1 downto 0 );
signal	m_axi_hp0_awcache_t :  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp0_awlen_t   :  std_logic_vector ( 7 downto 0 );
signal	m_axi_hp0_awlock_t  :  std_logic;
signal	m_axi_hp0_awprot_t  :  std_logic_vector ( 2 downto 0 );
signal	m_axi_hp0_awqos_t   :  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp0_awready_t :  std_logic;
signal  m_axi_hp0_awregion_t:  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp0_awsize_t  :  std_logic_vector ( 2 downto 0 );
signal	m_axi_hp0_awvalid_t :  std_logic;
signal	m_axi_hp0_bready_t  :  std_logic;
signal	m_axi_hp0_bresp_t   :  std_logic_vector ( 1 downto 0 );
signal	m_axi_hp0_bvalid_t  :  std_logic;
signal	m_axi_hp0_wdata_t   :  std_logic_vector ( 63 downto 0 );
signal	m_axi_hp0_wlast_t   :  std_logic;
signal	m_axi_hp0_wready_t  :  std_logic;
signal	m_axi_hp0_wstrb_t   :  std_logic_vector ( 7 downto 0 );
signal	m_axi_hp0_wvalid_t  :  std_logic;

signal	m_axi_hp2_awaddr_t  :  std_logic_vector ( 31 downto 0 );
signal	m_axi_hp2_awburst_t :  std_logic_vector ( 1 downto 0 );
signal	m_axi_hp2_awcache_t :  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp2_awlen_t   :  std_logic_vector ( 7 downto 0 );
signal	m_axi_hp2_awlock_t  :  std_logic;
signal	m_axi_hp2_awprot_t  :  std_logic_vector ( 2 downto 0 );
signal	m_axi_hp2_awqos_t   :  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp2_awready_t :  std_logic;
signal  m_axi_hp2_awregion_t:  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp2_awsize_t  :  std_logic_vector ( 2 downto 0 );
signal	m_axi_hp2_awvalid_t :  std_logic;
signal	m_axi_hp2_bready_t  :  std_logic;
signal	m_axi_hp2_bresp_t   :  std_logic_vector ( 1 downto 0 );
signal	m_axi_hp2_bvalid_t  :  std_logic;
signal	m_axi_hp2_wdata_t   :  std_logic_vector ( 31 downto 0 );
signal	m_axi_hp2_wlast_t   :  std_logic;
signal	m_axi_hp2_wready_t  :  std_logic;
signal	m_axi_hp2_wstrb_t   :  std_logic_vector ( 3 downto 0 );
signal	m_axi_hp2_wvalid_t  :  std_logic;	
--PS2PL interface signals
signal  bus2ip_addr_t       :std_logic_vector(31 downto 0);
signal  bus2ip_rd_t         :std_logic;
signal  bus2ip_wr_t         :std_logic;
signal  bus2ip_data_t       :std_logic_vector(31 downto 0);
signal  ip2bus_data_t       :std_logic_vector(31 downto 0);
signal  rdack_t             :std_logic;
signal  wrack_t             :std_logic;
signal  ip2bus_error_t      :std_logic;
signal  bus2ip_be_t         :std_logic_vector(3 downto 0);
--attribute MARK_DEBUG of bus2ip_addr_t,bus2ip_data_t,ip2bus_data_t,bus2ip_rd_t,bus2ip_wr_t,rdack_t,wrack_t : signal is "TRUE";
    
signal hp_data_gen_softreset    :std_logic_vector(3 downto 0);
signal hp_data_gen_softtrig     :std_logic_vector(3 downto 0);
signal hp_data_gen_adcburstenb  :std_logic_vector(3 downto 0);
signal hp_fifo_rst              :std_logic_vector(3 downto 0);
signal hp_addr_rst              :std_logic_vector(3 downto 0);
signal hp_data_gen_testdata_en  :std_logic;
--attribute MARK_DEBUG of hp_data_gen_softreset,hp_data_gen_softtrig,hp_data_gen_adcburstenb,hp_fifo_rst,hp_addr_rst :signal is "true";

signal hp0_burst_fifo_wrdata_t   :std_logic_vector(127 downto 0);
signal hp0_burst_fifo_wren_t     :std_logic;
signal hp0_burst_fifo_wrcnt_t    :std_logic_vector(9 downto 0);
signal hp0_burst_addr_t          :std_logic_vector(31 downto 0);
signal hp0_data_gen_trig         :std_logic;
signal hp0_data_gen_adcburstlen  :std_logic_vector(31 downto 0);
signal hp0_data_gen_burst_active :std_logic;

signal hp2_burst_fifo_wrdata_t   :std_logic_vector(31 downto 0);
signal hp2_burst_fifo_wren_t     :std_logic;
signal hp2_burst_last_rd_t       :std_logic;
signal hp2_burst_fifo_rdcnt_t    :std_logic_vector(7 downto 0);  
--signal hp2_burst_fifo_wrcnt_t    :std_logic_vector(9 downto 0);
signal hp2_burst_addr_t          :std_logic_vector(31 downto 0);

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of hp2_burst_fifo_wrdata_t,hp2_burst_fifo_wren_t : signal is "TRUE";

--Bram controller signals
signal ps7_bram_porta_addr_t :  std_logic_vector ( 15 downto 0 );
signal ps7_bram_porta_clk_t  :  std_logic;
signal ps7_bram_porta_din_t  :  std_logic_vector ( 31 downto 0 );
signal ps7_bram_porta_dout_t :  std_logic_vector ( 31 downto 0 );
signal ps7_bram_porta_en_t   :  std_logic;
signal ps7_bram_porta_rst_t  :  std_logic;
signal ps7_bram_porta_we_t   :  std_logic_vector ( 3 downto 0 );

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of ps7_bram_porta_clk_t,ps7_bram_porta_addr_t,ps7_bram_porta_din_t,ps7_bram_porta_dout_t,ps7_bram_porta_en_t,ps7_bram_porta_we_t : signal is "TRUE";

signal basil_bus_clk : std_logic;
signal basil_bus_wr  : std_logic;
signal basil_bus_rd  : std_logic;
signal basil_bus_add : std_logic_vector(31 downto 0);
signal basil_bus_data : std_logic_vector(31 downto 0);
--ADC LVDS data signals
signal adc_lvds_fclk :std_logic;
signal adc_lvds_ch1_data  :std_logic_vector(15 downto 0);
signal adc_lvds_ch2_data  :std_logic_vector(15 downto 0);
signal adc_lvds_ch3_data  :std_logic_vector(15 downto 0);
signal adc_lvds_ch4_data  :std_logic_vector(15 downto 0);
signal adc_lvds_ch5_data  :std_logic_vector(15 downto 0);
signal adc_lvds_ch6_data  :std_logic_vector(15 downto 0);
signal adc_fclk_pos    :std_logic_vector(3 downto 0);
signal adc_dclk_freq_t :std_logic_vector(19 downto 0);
signal adc_fclk_freq_t :std_logic_vector(19 downto 0);

signal test_sig              :  std_logic;
signal i2c_scl               :  std_logic;
signal i2c_sda               :  std_logic;

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of i2c_scl,i2c_sda : signal is "TRUE";
--ps7_wrapper

signal fei4_cfg_flg          : std_logic;
signal fei4_cfg_reg          : std_logic_vector(31 downto 0);
signal fei4_wr_reg_dat       : std_logic_vector(15 downto 0);
signal fei4_data_pos_sel     : std_logic_vector(3 downto 0);
signal fei4_bit_slip         : std_logic;
signal fei4_cmd_out_ph_sel   : std_logic_vector(1 downto 0);
signal fei4_hit_or_un_sync           : std_logic;
signal fei4_hit_or_sync           : std_logic;

signal  fei4_data_out        : std_logic_vector(7 downto 0);
signal  fei4_data_fifo_wr_en : std_logic;


attribute MARK_DEBUG of fei4_hit_or_sync : signal is "TRUE";

signal fei4_a2_cfg_flg          : std_logic;
signal fei4_a2_cfg_reg          : std_logic_vector(31 downto 0);
signal fei4_a2_wr_reg_dat       : std_logic_vector(15 downto 0);
signal fei4_a2_bit_slip         : std_logic;

signal fei4_b1_cfg_flg          : std_logic;
signal fei4_b1_cfg_reg          : std_logic_vector(31 downto 0);
signal fei4_b1_wr_reg_dat       : std_logic_vector(15 downto 0);
signal fei4_b1_bit_slip         : std_logic;

signal fei4_b2_cfg_flg          : std_logic;
signal fei4_b2_cfg_reg          : std_logic_vector(31 downto 0);
signal fei4_b2_wr_reg_dat       : std_logic_vector(15 downto 0);
signal fei4_b2_bit_slip         : std_logic;

signal fei4_fr_ram_addr      : std_logic_vector(5 downto 0);
signal fei4_fr_ram_dat_in    : std_logic_vector(31 downto 0);
signal fei4_fr_ram_dat_out   : std_logic_vector(31 downto 0);

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of fei4_fr_ram_addr,fei4_fr_ram_dat_in,fei4_fr_ram_dat_out: signal is "TRUE";
signal fei4_fe_sr_rd_en      : std_logic;
signal fei4_frame_sync_en    : std_logic;
signal fei4_reg_addr_out     : std_logic_vector(15 downto 0);
signal fei4_reg_value_out    : std_logic_vector(15 downto 0);

signal fei4_idelay_cnt_out :std_logic_vector(4 downto 0);
signal fei4_idelay_ctrl_rdy:std_logic;
signal fei4_idelay_ld      :std_logic;
signal fei4_idelay_cnt_in  :std_logic_vector(4 downto 0);  

signal ccpd_inj_pulse_a1   :std_logic;
signal ccpd_inj_pulse_a2   :std_logic;
signal ccpd_inj_pulse_b1   :std_logic;
signal ccpd_inj_pulse_b2   :std_logic;

signal ccpd_sin            :std_logic;
signal ccpd_ld             :std_logic;
signal ccpd_ckc            :std_logic;
signal ccpd_ckd            :std_logic;

component iic_controller 
      generic (
        BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00100"
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
		
		--IIC IO
        SCL                 : inout std_logic;
        SDA                 : inout std_logic            					
  		);		  
end component;

COMPONENT ps7_wrapper 
  port (
    ACLK : out STD_LOGIC;
                 
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    	
	 P_ARESETN : out STD_LOGIC;
	
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC;
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    --S00_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;   
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC;
    --For FEI4 Data Readout
    S02_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_awlock : in STD_LOGIC;
    S02_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awready : out STD_LOGIC;
    --S02_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awvalid : in STD_LOGIC;
    S02_AXI_bready : in STD_LOGIC;
    S02_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_bvalid : out STD_LOGIC;
    S02_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_wlast : in STD_LOGIC;
    S02_AXI_wready : out STD_LOGIC;
    S02_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_wvalid : in STD_LOGIC;    											 
    iic_scl_io : inout STD_LOGIC;
    iic_sda_io : inout STD_LOGIC
  );
END COMPONENT;

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT blk_mem_gen_0
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF blk_mem_gen_0 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF blk_mem_gen_0 : COMPONENT IS "clka,ena,wea[0:0],addra[7:0],dina[15:0],douta[15:0]";

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
component axi_lite_ipif
  generic(

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
end component;

COMPONENT ads5292_lvds 
  Port ( 
    RESET   : in STD_LOGIC;
    SYSCLK  : in STD_LOGIC;
    CLK200  : in STD_LOGIC;
    CLK40   : in STD_LOGIC;

    FCLKP   : in STD_LOGIC;
    FCLKM   : in STD_LOGIC;
    DCLKP   : in STD_LOGIC;
    DCLKM   : in STD_LOGIC;
    
    DOUTP1  : in STD_LOGIC;
    DOUTM1  : in STD_LOGIC;
    DOUTP2  : in STD_LOGIC;
    DOUTM2  : in STD_LOGIC;
    DOUTP3  : in STD_LOGIC;
    DOUTM3  : in STD_LOGIC;
    DOUTP4  : in STD_LOGIC;
    DOUTM4  : in STD_LOGIC;
    DOUTP5  : in STD_LOGIC;
    DOUTM5  : in STD_LOGIC;
    DOUTP6  : in STD_LOGIC;
    DOUTM6  : in STD_LOGIC;
    
    CH1_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH2_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH3_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH4_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH5_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH6_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);   
       
    LVDS_FCLK     : out STD_LOGIC;   
                        
    FCLK_POS : in STD_LOGIC_VECTOR(3 downto 0);
    DCLKFREQ : out STD_LOGIC_VECTOR(19 downto 0);
    FCLKFREQ : out STD_LOGIC_VECTOR(19 downto 0)  
    );
END COMPONENT;

--MMCM clock generator
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component clk_wiz_0
port
 (-- Clock in ports
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
  -- Clock out ports
  clk200          : out    std_logic;
  clk100          : out    std_logic;
  clk40          : out    std_logic;
  clk160          : out    std_logic;
  clk16           : out   std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end component;

ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_0 : COMPONENT IS TRUE;
ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_0 : COMPONENT IS "clk_in1_p,clk_in1_n,clk200,clk100,clk40,reset,locked";

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

component iobus_interface 
 generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00000"
        );
  port( 
    RST : in std_logic;
    SYSCLK: in std_logic;
    
    Bus2IP_Addr         : in std_logic_vector(31 downto 0);
    Bus2IP_RD           : in std_logic;
    Bus2IP_WR           : in std_logic;
    Bus2IP_Data         : in std_logic_vector(31 downto 0);
    IP2Bus_Data         : out  std_logic_vector(31 downto 0);
    RDACK               : out std_logic;
    WRACK               : out std_logic;
    
    
    GLB_RST         :out std_logic;
   
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
    FEI4_IDELAY_CNT_IN   :out std_logic_vector(4 downto 0);
    
    ADC_DCLK_FREQ   :in  std_logic_vector(19 downto 0);
    ADC_FCLK_FREQ   :in  std_logic_vector(19 downto 0);
    ADC_FCLK_POS    :out std_logic_vector( 3 downto 0);	
    
    HP_GEN_RST      :out std_logic_vector(3 downto 0);
    HP_TRIGER       :out std_logic_vector(3 downto 0);
    HP_FIFO_RST     :out std_logic_vector(3 downto 0);
    HP_ADDR_RST     :out std_logic_vector(3 downto 0);
    HP_BURST_EN     :out std_logic_vector(3 downto 0);        
    HP_TEST_DATA_EN :out std_logic;
    HP2_FIFO_CNT    :in  std_logic_vector(7 downto 0);
    HP0_BURST_LEN   :out std_logic_vector(31 downto 0);
    HP0_BURST_ADDR  :in  std_logic_vector(31 downto 0); 
    HP2_BURST_ADDR  :in  std_logic_vector(31 downto 0);        
    HP2_BURST_LAST_RD :out std_logic

);		  
end component;


COMPONENT c_counter_binary_0
  PORT (
    CLK : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

--component installation end

component axi_mburst
  Generic(
  start_addr : std_logic_vector(27 downto 0) := X"000_0000";
  end_addr   : std_logic_vector(27 downto 0) := X"7FF_FFFF"
  );
  port(
    axi_clk 		: in std_logic;
    axi_reset 		: in std_logic;
    addr_rst        : in std_logic;
	 
    fifo_reset      : in std_logic;       
    fifo_wrclk      : in std_logic;
    fifo_data       : in std_logic_vector(127 downto 0);
    fifo_wren       : in std_logic;
    fifo_wrcnt      : out std_logic_vector(9 downto 0);  
    
    burst_addr      : out std_logic_vector(31 downto 0);     	 
	 
    axi_awready 	: in std_logic;
    axi_awaddr 	    : out std_logic_vector(31 downto 0);--32bit-->28bit: top.vhd assign high 4 bit
    axi_awvalid 	: out std_logic;	 
    axi_awlen 		: out std_logic_vector(7 downto 0);
    axi_awsize 	    : out std_logic_vector(2 downto 0);
    axi_awburst 	: out std_logic_vector(1 downto 0);
    axi_awcache 	: out std_logic_vector(3 downto 0);
    axi_awprot 	    : out std_logic_vector(2 downto 0);
 
    axi_wready 	    : in std_logic;
    axi_wdata 	    : out std_logic_vector(63 downto 0);
	axi_wvalid 	    : out std_logic;
    axi_wstrb 		: out std_logic_vector(7 downto 0);
    axi_wlast 		: out std_logic;

    axi_bvalid 	    : in std_logic; 
    axi_bresp 		: in std_logic_vector(1 downto 0);
    axi_bready 	    : out std_logic
	);
end component;


component axi_mburst1
  Generic(
  start_addr : std_logic_vector(27 downto 0) := X"800_0000";
  end_addr   : std_logic_vector(27 downto 0) := X"FFF_FFFF"
  );
  port(
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
end component;
 

component axi_data_gen  
  port(
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
end component; 

component FEI4B_CFG is
    Port ( 
    RST : in std_logic;
    
    CLK160 : in std_logic;
    CMD_OUT_PH_SEL : in std_logic_vector(1 downto 0);
    
    FR_CFG_CLK : in std_logic;    
    FR_RAM_ADDR : in std_logic_vector(5 downto 0);
    FR_RAM_DAT_IN : in std_logic_vector(31 downto 0);
    FR_RAM_DAT_OUT : out std_logic_vector(31 downto 0);
    
    CMD_CLK : in std_logic;
    CFG_FLG : in std_logic;
    CFG_REG : in std_logic_vector(31 downto 0);
    WR_REG_DAT : in std_logic_vector(15 downto 0);
    CMD_OUT_P : out std_logic;
    CMD_OUT_N : out std_logic  
    );    
end component;

component FEI4_RX is
    Port ( 
    RESET     : in STD_LOGIC;
    
    DATA_IN_P : in STD_LOGIC;
    DATA_IN_N : in STD_LOGIC;
    CLK160 : in STD_LOGIC;
    CLK16  : in std_logic;
    
    FRAME_SYNC_EN : in std_logic; 
    FE_SR_RD_EN : in std_logic;
    
    REG_ADDR_OUT : out std_logic_vector(15 downto 0);
    REG_VALUE_OUT : out std_logic_vector(15 downto 0);  

    DATA_OUT : out std_logic_vector(7 downto 0);
    FIFO_WR_EN : out std_logic;
  
    --Control ports
    IDELAY_REFCLK : in std_logic;
    IDELAY_CNT_OUT    : out std_logic_vector(4 downto 0);
    IDELAY_CTRL_RDY   : out std_logic;
    IDELAY_LD    : in  std_logic;
    IDELAY_CNT_IN     : in  std_logic_vector(4 downto 0)   
    );
end component;

COMPONENT pulse_gen is
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
  PULSE_OUT1          : out std_logic; 
  PULSE_OUT2          : out std_logic; 
  PULSE_OUT3          : out std_logic; 
  PULSE_OUT4          : out std_logic
  );        
END COMPONENT;

component ccpd_cfg_tb is
generic (
  BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00300"
  );
Port (
    sysclk             :in std_logic;
    rst             :in std_logic;

    --IP BUS
    Bus2IP_Addr         : in std_logic_vector(31 downto 0);
    Bus2IP_RD           : in std_logic;
    Bus2IP_WR           : in std_logic;
    Bus2IP_Data         : in std_logic_vector(31 downto 0);
    IP2Bus_Data         : out std_logic_vector(31 downto 0);
    RDACK               : out std_logic;
    WRACK               : out std_logic;    
           
    Sin             :out std_logic;
    CkC             :out std_logic;
    CkD             :out std_logic;
    Ld              :out std_logic
 );
end component;

begin

tied_to_ground <= '0';
tied_to_vcc <= '1';


--LVDS Input Buffer 
FEI4_HITOR_BUF :IBUFDS
generic map (
DIFF_TERM => TRUE, -- Differential Termination
IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "LVDS_25")
port map (
O => fei4_hit_or_un_sync, 
I  => FEI4_A1_HIT_OR_P, 
IB => FEI4_A1_HIT_OR_N 
);

process(clk160m)
begin
  if rising_edge(clk160m) then
    fei4_hit_or_sync <= fei4_hit_or_un_sync;
  end if;
end process;
----------------------MMCM MODULE-------------------------------------------
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
clk_gen: clk_wiz_0
   port map ( 

   -- Clock in ports
   clk_in1_p => CLK200_IN_P,
   clk_in1_n => CLK200_IN_N,
  -- Clock out ports  
   clk200 => clk200m,
   clk100 => clk100m,
   clk40 => clk40m,
   clk160 => clk160m,
   clk16 => clk16m,
  -- Status and control signals                
   reset => mmcm_reset,
   locked => mmcm_locked            
 );
 
mmcm_reset <= tied_to_ground;

--si5324_clk_buf: OBUFDS
--generic map (
--    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
--    SLEW => "SLOW"-- Specify the output slew rate
--    ) 
--  port map (
--    O  => CLK_SI5324_P, -- Diff_p output (connect directly to top-level port)
--    OB => CLK_SI5324_N, -- Diff_n output (connect directly to top-level port)
--    I =>  clk100m  -- Buffer input
--);

ads5292_a_input:ads5292_lvds 
  Port map ( 
   RESET   => global_reset,
   SYSCLK  =>   clk100m,
   CLK200  =>   clk200m,
   CLK40   =>   clk40m,
   FCLKP   =>   ADC_FCLKP,
   FCLKM   =>   ADC_FCLKM,
   DCLKP   =>   ADC_DCLKP,
   DCLKM   =>   ADC_DCLKM,
   DOUTP1  =>   ADC_DOUTP1,
   DOUTM1  =>   ADC_DOUTM1,
   DOUTP2  =>   ADC_DOUTP2,
   DOUTM2  =>   ADC_DOUTM2,
   DOUTP3  =>   ADC_DOUTP3,
   DOUTM3  =>   ADC_DOUTM3,
   DOUTP4  =>   ADC_DOUTP4,
   DOUTM4  =>   ADC_DOUTM4,
   DOUTP5  =>   ADC_DOUTP5,
   DOUTM5  =>   ADC_DOUTM5,
   DOUTP6  =>   ADC_DOUTP6,
   DOUTM6  =>   ADC_DOUTM6,
  
   CH1_DATA_OUT  =>  adc_lvds_ch1_data,
   CH2_DATA_OUT  =>  adc_lvds_ch2_data,
   CH3_DATA_OUT  =>  adc_lvds_ch3_data,
   CH4_DATA_OUT  =>  adc_lvds_ch4_data,
   CH5_DATA_OUT  =>  adc_lvds_ch5_data,
   CH6_DATA_OUT  =>  adc_lvds_ch6_data,
   LVDS_FCLK     =>  adc_lvds_fclk,
      
   FCLK_POS => adc_fclk_pos,
   DCLKFREQ => adc_dclk_freq_t,
   FCLKFREQ => adc_fclk_freq_t         
   );

--ads5292_b_input:ads5292_lvds 
--  Port map ( 
--   RESET   => global_reset,
--   SYSCLK  =>   clk100m,
--   CLK200  =>   clk200m,
--   CLK40   =>   clk40m,
--   FCLKP   =>   ADC_FCLKP,
--   FCLKM   =>   ADC_FCLKM,
--   DCLKP   =>   ADC_DCLKP,
--   DCLKM   =>   ADC_DCLKM,
--   DOUTP1  =>   ADC_DOUTP1,
--   DOUTM1  =>   ADC_DOUTM1,
--   DOUTP2  =>   ADC_DOUTP2,
--   DOUTM2  =>   ADC_DOUTM2,
--   DOUTP3  =>   ADC_DOUTP3,
--   DOUTM3  =>   ADC_DOUTM3,
--   DOUTP4  =>   ADC_DOUTP4,
--   DOUTM4  =>   ADC_DOUTM4,
--   DOUTP5  =>   ADC_DOUTP5,
--   DOUTM5  =>   ADC_DOUTM5,
--   DOUTP6  =>   ADC_DOUTP6,
--   DOUTM6  =>   ADC_DOUTM6,
  
--   CH1_DATA_OUT  =>  adc_lvds_ch1_data,
--   CH2_DATA_OUT  =>  adc_lvds_ch2_data,
--   CH3_DATA_OUT  =>  adc_lvds_ch3_data,
--   CH4_DATA_OUT  =>  adc_lvds_ch4_data,
--   CH5_DATA_OUT  =>  adc_lvds_ch5_data,
--   CH6_DATA_OUT  =>  adc_lvds_ch6_data,
--   LVDS_FCLK     =>  adc_lvds_fclk,
      
--   FCLK_POS => adc_fclk_pos,
--   DCLKFREQ => adc_dclk_freq_t,
--   FCLKFREQ => adc_fclk_freq_t         
--   );

--test_bram: blk_mem_gen_0
--  PORT MAP (
--    clka => ps7_bram_porta_clk_t,
--    ena => ps7_bram_porta_en_t,
--    wea => ps7_bram_porta_we_t(0),
--    addra => ps7_bram_porta_addr_t(7 downto 0),
--    dina => ps7_bram_porta_din_t(15 downto 0),
--    douta => ps7_bram_porta_dout_t(15 downto 0)
--  );
   
ps7_i:ps7_wrapper
  port map (
      ACLK => ps7_aclk,
      
      --DDR Port
      DDR_addr => PS7_DDR_ADDR,
      DDR_ba => PS7_DDR_BA,
      DDR_cas_n => PS7_DDR_CAS_N,
      DDR_ck_n => PS7_DDR_CK_N,
      DDR_ck_p => PS7_DDR_CK_P,
      DDR_cke => PS7_DDR_CKE,
      DDR_cs_n => PS7_DDR_CS_N,
      DDR_dm => PS7_DDR_DM,
      DDR_dq => PS7_DDR_DQ,
      DDR_dqs_n => PS7_DDR_DQS_N,
      DDR_dqs_p => PS7_DDR_DQS_P,
      DDR_odt => PS7_DDR_ODT,
      DDR_ras_n => PS7_DDR_RAS_N,
      DDR_reset_n => PS7_DDR_RESET_N,
      DDR_we_n => PS7_DDR_WE_N,
      --Fixed IO port
      FIXED_IO_ddr_vrn => PS7_FIXED_IO_DDR_VRN,
      FIXED_IO_ddr_vrp => PS7_FIXED_IO_DDR_VRP,
      FIXED_IO_mio => PS7_FIXED_IO_MIO,
      FIXED_IO_ps_clk => PS7_FIXED_IO_PS_CLK,
      FIXED_IO_ps_porb => PS7_FIXED_IO_PS_PORB,
      FIXED_IO_ps_srstb => PS7_FIXED_IO_PS_SRSTB,
      --AXI4 Lite Port
      M00_AXI_araddr   => ps7_m00_axi_araddr,
      M00_AXI_arprot   => ps7_m00_axi_arprot,
      M00_AXI_arready  => ps7_m00_axi_arready,
      M00_AXI_arvalid  => ps7_m00_axi_arvalid,
      M00_AXI_awaddr   => ps7_m00_axi_awaddr,
      M00_AXI_awprot   => ps7_m00_axi_awprot,
      M00_AXI_awready  => ps7_m00_axi_awready,
      M00_AXI_awvalid  => ps7_m00_axi_awvalid,
      M00_AXI_bready   => ps7_m00_axi_bready,
      M00_AXI_bresp    => ps7_m00_axi_bresp,
      M00_AXI_bvalid   => ps7_m00_axi_bvalid,
      M00_AXI_rdata    => ps7_m00_axi_rdata,
      M00_AXI_rready   => ps7_m00_axi_rready,
      M00_AXI_rresp    => ps7_m00_axi_rresp,
      M00_AXI_rvalid   => ps7_m00_axi_rvalid,
      M00_AXI_wdata    => ps7_m00_axi_wdata,
      M00_AXI_wready   => ps7_m00_axi_wready,
      M00_AXI_wstrb    => PS7_m00_axi_wstrb,
      M00_AXI_wvalid   => ps7_m00_axi_wvalid,
      
      P_ARESETN        => ps7_axi_areset,
            
      S00_AXI_awaddr  => m_axi_hp0_awaddr_t,
      S00_AXI_awburst => m_axi_hp0_awburst_t,
      S00_AXI_awcache => m_axi_hp0_awcache_t,
      S00_AXI_awlen   => m_axi_hp0_awlen_t,
      S00_AXI_awlock  => m_axi_hp0_awlock_t,
      S00_AXI_awprot  => m_axi_hp0_awprot_t,
      S00_AXI_awqos   => m_axi_hp0_awqos_t,
      S00_AXI_awready => m_axi_hp0_awready_t,
      S00_AXI_awsize  => m_axi_hp0_awsize_t,
      S00_AXI_awvalid => m_axi_hp0_awvalid_t,    
      S00_AXI_bready  => m_axi_hp0_bready_t,
      S00_AXI_bresp   => m_axi_hp0_bresp_t,
      S00_AXI_bvalid  => m_axi_hp0_bvalid_t,   
      S00_AXI_wdata   => m_axi_hp0_wdata_t,
      S00_AXI_wlast   => m_axi_hp0_wlast_t,
      S00_AXI_wready  => m_axi_hp0_wready_t,
      S00_AXI_wstrb   => m_axi_hp0_wstrb_t,
      S00_AXI_wvalid  => m_axi_hp0_wvalid_t,

      S02_AXI_awaddr  => m_axi_hp2_awaddr_t,
      S02_AXI_awburst => m_axi_hp2_awburst_t,
      S02_AXI_awcache => m_axi_hp2_awcache_t,
      S02_AXI_awlen   => m_axi_hp2_awlen_t,
      S02_AXI_awlock  => m_axi_hp2_awlock_t,
      S02_AXI_awprot  => m_axi_hp2_awprot_t,
      S02_AXI_awqos   => m_axi_hp2_awqos_t,
      S02_AXI_awready => m_axi_hp2_awready_t,
      S02_AXI_awsize  => m_axi_hp2_awsize_t,
      S02_AXI_awvalid => m_axi_hp2_awvalid_t,    
      S02_AXI_bready  => m_axi_hp2_bready_t,
      S02_AXI_bresp   => m_axi_hp2_bresp_t,
      S02_AXI_bvalid  => m_axi_hp2_bvalid_t,   
      S02_AXI_wdata   => m_axi_hp2_wdata_t,
      S02_AXI_wlast   => m_axi_hp2_wlast_t,
      S02_AXI_wready  => m_axi_hp2_wready_t,
      S02_AXI_wstrb   => m_axi_hp2_wstrb_t,
      S02_AXI_wvalid  => m_axi_hp2_wvalid_t,
              
      iic_scl_io   => PS7_IIC_SCL,
      iic_sda_io   => PS7_IIC_SDA
    );

hp0_data_gen_trig <= hp_data_gen_softtrig(0);
data_gen_hp0:axi_data_gen   
  port map(
     adc_clk             => adc_lvds_fclk, 
     reset               => hp_data_gen_softreset(0),   --iobus
                         
     trig                => hp0_data_gen_trig,    --iobus
     adcburst_enb        => hp_data_gen_adcburstenb(0), --iobus
     adcburst_len        => hp0_data_gen_adcburstlen, --iobus
     testdata_en         => hp_data_gen_testdata_en, --iobus     
 
     adc_ch0             => adc_lvds_ch1_data, 
     adc_ch1             => adc_lvds_ch2_data, 
     adc_ch2             => adc_lvds_ch3_data, 
     adc_ch3             => adc_lvds_ch4_data, 
     adc_ch4             => adc_lvds_ch5_data, 
     adc_ch5             => adc_lvds_ch6_data, 
     adc_ch6             => (others => '0'),  
     adc_ch7             => (others => '0'),    
     
     adcdata             => hp0_burst_fifo_wrdata_t, 
     adcdata_wren        => hp0_burst_fifo_wren_t, 
     adcburst_active     => hp0_data_gen_burst_active       --ila
  );     
       
axi_hp0_burst:axi_mburst
      Generic map
      (
      start_addr => X"000_0000",
      end_addr => X"3FF_FFFF"
      )
      port map(
        axi_clk       =>  ps7_aclk,
        axi_reset     =>  ps7_axi_areset,
        addr_rst      =>  hp_addr_rst(0),         
        fifo_reset    => hp_fifo_rst(0), 
        
        fifo_wrclk    => adc_lvds_fclk,
        fifo_data     => hp0_burst_fifo_wrdata_t,
        fifo_wren     => hp0_burst_fifo_wren_t,
        fifo_wrcnt    => hp0_burst_fifo_wrcnt_t, --iobus  
        burst_addr    => hp0_burst_addr_t,   
         
        axi_awready   => m_axi_hp0_awready_t,
        axi_awaddr    => m_axi_hp0_awaddr_t,
        axi_awvalid   => m_axi_hp0_awvalid_t,
        axi_awlen     => m_axi_hp0_awlen_t,
        axi_awsize    => m_axi_hp0_awsize_t,
        axi_awburst   => m_axi_hp0_awburst_t,
        axi_awcache   => m_axi_hp0_awcache_t,
        axi_awprot    => m_axi_hp0_awprot_t,
     
        axi_wready    => m_axi_hp0_wready_t,
        axi_wdata     => m_axi_hp0_wdata_t,
        axi_wvalid    => m_axi_hp0_wvalid_t,
        axi_wstrb     => m_axi_hp0_wstrb_t,
        axi_wlast     => m_axi_hp0_wlast_t,
    
        axi_bvalid    => m_axi_hp0_bvalid_t,
        axi_bresp     => m_axi_hp0_bresp_t,
        axi_bready    => m_axi_hp0_bready_t
  );

hp2_burst_fifo_wrdata_t(31 downto 8) <= (others => '0');
axi_hp2_burst:axi_mburst1
      Generic map
      (
      start_addr => X"000_0000",
      end_addr => X"FFF_FFFF"
      )
      port map(
        axi_clk       =>  ps7_aclk,
        axi_reset     =>  ps7_axi_areset,
        
        addr_rst      =>  hp_addr_rst(2),         
        fifo_reset    => hp_fifo_rst(2), 
        
        last_rd_tri  => hp2_burst_last_rd_t,

        fifo_wrclk    => clk16m,
        fifo_data     => hp2_burst_fifo_wrdata_t,
        fifo_wren     => hp2_burst_fifo_wren_t,
        fifo_rdcnt    => hp2_burst_fifo_rdcnt_t, --iobus  
        burst_addr    => hp2_burst_addr_t,   
         
        axi_awready   => m_axi_hp2_awready_t,
        axi_awaddr    => m_axi_hp2_awaddr_t,
        axi_awvalid   => m_axi_hp2_awvalid_t,
        axi_awlen     => m_axi_hp2_awlen_t,
        axi_awsize    => m_axi_hp2_awsize_t,
        axi_awburst   => m_axi_hp2_awburst_t,
        axi_awcache   => m_axi_hp2_awcache_t,
        axi_awprot    => m_axi_hp2_awprot_t,
     
        axi_wready    => m_axi_hp2_wready_t,
        axi_wdata     => m_axi_hp2_wdata_t,
        axi_wvalid    => m_axi_hp2_wvalid_t,
        axi_wstrb     => m_axi_hp2_wstrb_t,
        axi_wlast     => m_axi_hp2_wlast_t,
    
        axi_bvalid    => m_axi_hp2_bvalid_t,
        axi_bresp     => m_axi_hp2_bresp_t,
        axi_bready    => m_axi_hp2_bready_t
  );
  
ps_pl_interface:axi_lite_ipif
  generic map(
    C_IPIF_ABUS_WIDTH   => 32,
    C_IPIF_DBUS_WIDTH   => 32,
    C_S_AXI_MIN_SIZE    => X"000001FF",
    C_USE_WSTRB         => 0
    )
  port map(
    -- AXI signals
    S_AXI_ACLK          => ps7_aclk,
    S_AXI_ARESETN       => ps7_axi_areset,
    S_AXI_AWADDR        => ps7_m00_axi_awaddr,
                          
    S_AXI_AWVALID       => ps7_m00_axi_awvalid,
    S_AXI_AWREADY       => ps7_m00_axi_awready,
    S_AXI_WDATA         => ps7_m00_axi_wdata,
                          
    S_AXI_WSTRB         => PS7_m00_axi_wstrb,
                          
    S_AXI_WVALID        => ps7_m00_axi_wvalid,
    S_AXI_WREADY        => ps7_m00_axi_wready,
    S_AXI_BRESP         => ps7_m00_axi_bresp,
    S_AXI_BVALID        => ps7_m00_axi_bvalid,
    S_AXI_BREADY        => ps7_m00_axi_bready,
    S_AXI_ARADDR        => ps7_m00_axi_araddr,
                         
    S_AXI_ARVALID       => ps7_m00_axi_arvalid,
    S_AXI_ARREADY       => ps7_m00_axi_arready,
    S_AXI_RDATA         => ps7_m00_axi_rdata,
                         
    S_AXI_RRESP         => ps7_m00_axi_rresp,
    S_AXI_RVALID        => ps7_m00_axi_rvalid,
    S_AXI_RREADY        => ps7_m00_axi_rready,
    -- Controls to the IP/IPIF modules

    Bus2IP_Addr         => bus2ip_addr_t,
                          
    Bus2IP_RD           => bus2ip_rd_t,
    Bus2IP_WR           => bus2ip_wr_t,
    Bus2IP_BE           => bus2ip_be_t,
                          
    Bus2IP_Data         =>  bus2ip_data_t,
                         
    IP2Bus_Data         => ip2bus_data_t,
                          
    IP2Bus_WrAck        => wrack_t,
    IP2Bus_RdAck        => rdack_t,
    IP2Bus_Error        => '0'
    );

pl_iic:iic_controller
  generic map(
    BASE_ADDR => X"43c00100"
    )
  port map( 
    RST    => global_reset,
    SYSCLK => ps7_aclk,   
     
    Bus2IP_Addr    => bus2ip_addr_t,
    Bus2IP_RD      => bus2ip_rd_t,
    Bus2IP_WR      => bus2ip_wr_t,
    Bus2IP_Data    => bus2ip_data_t,
    IP2Bus_Data    => ip2bus_data_t,
    RDACK          => rdack_t,
    WRACK          => wrack_t,
    
    SCL            => IIC2_SCL,
    SDA            => IIC2_SDA
);

ccpd_inj_gen:pulse_gen
generic map (
  BASE_ADDR      => X"43c00200"
  )
  port map( 
  RST            => global_reset,
  SYSCLK         => ps7_aclk,
  
  --IP BUS
  Bus2IP_Addr    => bus2ip_addr_t,
  Bus2IP_RD      => bus2ip_rd_t,
  Bus2IP_WR      => bus2ip_wr_t,
  Bus2IP_Data    => bus2ip_data_t,
  IP2Bus_Data    => ip2bus_data_t,
  RDACK          => rdack_t,
  WRACK          => wrack_t,
  
  --pulse output
  PULSE_OUT1     => ccpd_inj_pulse_a1,
  PULSE_OUT2     => ccpd_inj_pulse_a2,
  PULSE_OUT3     => ccpd_inj_pulse_b1,
  PULSE_OUT4     => ccpd_inj_pulse_b2
  );  

ccpd_cfg:ccpd_cfg_tb
Generic map(
  BASE_ADDR => x"43c00300"
  )
Port map (
    sysclk             => ps7_aclk,
    rst             => global_reset,

    --IP BUS
    Bus2IP_Addr    => bus2ip_addr_t,
    Bus2IP_RD      => bus2ip_rd_t,
    Bus2IP_WR      => bus2ip_wr_t,
    Bus2IP_Data    => bus2ip_data_t,
    IP2Bus_Data    => ip2bus_data_t,
    RDACK          => rdack_t,
    WRACK          => wrack_t,  
           
    Sin            => ccpd_sin,
    CkC            => ccpd_ckc,
    CkD            => ccpd_ckd,
    Ld             => ccpd_ld
 );      
    
control_interface:iobus_interface 
   generic map (
     BASE_ADDR => X"43c00000"
        )
  port map( 
    RST    => tied_to_ground,
    SYSCLK => ps7_aclk,
    
    Bus2IP_Addr    => bus2ip_addr_t,
    Bus2IP_RD      => bus2ip_rd_t,
    Bus2IP_WR      => bus2ip_wr_t,
    Bus2IP_Data    => bus2ip_data_t,
    IP2Bus_Data    => ip2bus_data_t,
    RDACK          => rdack_t,
    WRACK          => wrack_t,
        
    GLB_RST        => global_reset,
   
    FEI4_CFG_FLG    => fei4_cfg_flg,
    FEI4_CFG_REG    => fei4_cfg_reg,
    FEI4_WR_REG_DAT => fei4_wr_reg_dat,
    FEI4_FR_RAM_ADDR    => fei4_fr_ram_addr,
    FEI4_FR_RAM_DAT_IN  => fei4_fr_ram_dat_in,
    FEI4_FR_RAM_DAT_OUT => fei4_fr_ram_dat_out,
    FEI4_DAT_POS_SEL => fei4_data_pos_sel,
    FEI4_FRAME_SYNC_EN   => fei4_frame_sync_en,
    FEI4_FE_SR_RD_EN => fei4_fe_sr_rd_en,
    FEI4_REG_ADDR_OUT  => fei4_reg_addr_out,
    FEI4_REG_VALUE_OUT => fei4_reg_value_out,
    FEI4_IDELAY_CNT_OUT   => fei4_idelay_cnt_out,
    FEI4_IDELAY_CTRL_RDY  => fei4_idelay_ctrl_rdy,
    FEI4_IDELAY_LD   => fei4_idelay_ld,
    FEI4_IDELAY_CNT_IN    => fei4_idelay_cnt_in,
  
    ADC_DCLK_FREQ    => adc_dclk_freq_t,
    ADC_FCLK_FREQ    => adc_fclk_freq_t,    
    ADC_FCLK_POS     => adc_fclk_pos,  

    HP_GEN_RST     => hp_data_gen_softreset,
    HP_TRIGER      => hp_data_gen_softtrig,
    HP_FIFO_RST    => hp_fifo_rst,
    HP_ADDR_RST    => hp_addr_rst,
    HP_BURST_EN    => hp_data_gen_adcburstenb,
    HP_TEST_DATA_EN => hp_data_gen_testdata_en,
    HP2_FIFO_CNT     => hp2_burst_fifo_rdcnt_t,
    HP2_BURST_LAST_RD => hp2_burst_last_rd_t,
    HP0_BURST_LEN   => hp0_data_gen_adcburstlen,
    HP0_BURST_ADDR  => hp0_burst_addr_t,
    HP2_BURST_ADDR  => hp2_burst_addr_t
    );	  
 
fei4_a1_cfg:FEI4B_CFG
      Port map(
          
      RST      => global_reset,
      
      CLK160    => clk160m,
      CMD_OUT_PH_SEL => fei4_data_pos_sel(1 downto 0),
           
      CMD_CLK   => clk40m,
      FR_CFG_CLK      => ps7_aclk,
      FR_RAM_ADDR     => fei4_fr_ram_addr,
      FR_RAM_DAT_IN   => fei4_fr_ram_dat_in,
      FR_RAM_DAT_OUT  => fei4_fr_ram_dat_out,
      
      CFG_FLG => fei4_cfg_flg,    
      CFG_REG => fei4_cfg_reg,
      WR_REG_DAT => fei4_wr_reg_dat,
     
      CMD_OUT_P => FEI4_A1_CMD_OUT_P,
      CMD_OUT_N => FEI4_A1_CMD_OUT_N
      );

--fei4_a2_cfg:FEI4B_CFG
--      Port map(
          
--      RST      => global_reset,
--      CMD_CLK   => clk40m,
            
--      CFG_FLG => fei4_cfg_flg_a2,    
--      CFG_REG => fei4_cfg_reg_a2,
--      WR_REG_DAT => fei4_wr_reg_dat_a2,
     
--      CMD_OUT_P => FEI4_A2_CMD_OUT_P,
--      CMD_OUT_N => FEI4_A2_CMD_OUT_N
--      );

--fei4_b1_cfg:FEI4B_CFG
--      Port map(
          
--      RST      => global_reset,
--      CMD_CLK   => clk40m,
            
--      CFG_FLG => fei4_cfg_flg_b1,    
--      CFG_REG => fei4_cfg_reg_b1,
--      WR_REG_DAT => fei4_wr_reg_dat_b1,
     
--      CMD_OUT_P => FEI4_B1_CMD_OUT_P,
--      CMD_OUT_N => FEI4_B1_CMD_OUT_N   
--      );

--fei4_b2_cfg:FEI4B_CFG
--      Port map(
          
--      RST      => global_reset,
--      CMD_CLK   => clk40m,
            
--      CFG_FLG => fei4_cfg_flg_b2,    
--      CFG_REG => fei4_cfg_reg_b2,
--      WR_REG_DAT => fei4_wr_reg_dat_b2,
     
--      CMD_OUT_P => FEI4_B2_CMD_OUT_P,
--      CMD_OUT_N => FEI4_B2_CMD_OUT_N  
--      ); 
    
fei4_rx_1:FEI4_RX 
    Port MAP(
       RESET => global_reset,
       
       DATA_IN_P => FEI4_DOB_P,
       DATA_IN_N => FEI4_DOB_N,
       CLK160 => clk160m,
       CLK16 => clk16m,
       
       FRAME_SYNC_EN   => fei4_frame_sync_en,
       FE_SR_RD_EN => fei4_fe_sr_rd_en,
       
       REG_ADDR_OUT    => fei4_reg_addr_out,
       REG_VALUE_OUT   => fei4_reg_value_out,

       DATA_OUT        => hp2_burst_fifo_wrdata_t(7 downto 0),
       FIFO_WR_EN      => hp2_burst_fifo_wren_t,
            
       IDELAY_REFCLK => clk200m,
       IDELAY_CNT_OUT   => fei4_idelay_cnt_out,
       IDELAY_CTRL_RDY  => fei4_idelay_ctrl_rdy,
       IDELAY_LD   => fei4_idelay_ld,
       IDELAY_CNT_IN    => fei4_idelay_cnt_in
    );
  

REFCLK_OUT_BUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => CLK40_OUT_P, -- Diff_p output (connect directly to top-level port)
    OB => CLK40_OUT_N, -- Diff_n output (connect directly to top-level port)
    I =>  clk40m  -- Buffer input
    );
       
CCPD_INJ_A1_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => HPC_LVDS6_P, -- Diff_p output (connect directly to top-level port)
    OB => HPC_LVDS6_N, -- Diff_n output (connect directly to top-level port)
    I =>  ccpd_inj_pulse_a1  -- Buffer input
    );

CCPD_INJ_A2_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
  ) 
  port map(
    O  => HPC_LVDS12_P, -- Diff_p output (connect directly to top-level port)
    OB => HPC_LVDS12_N, -- Diff_n output (connect directly to top-level port)
    I =>  ccpd_inj_pulse_a2  -- Buffer input
  );

CCPD_LD_B1_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => LPC_LVDS1_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS1_N, -- Diff_n output (connect directly to top-level port)
    I  => ccpd_ld      -- Buffer input
    );
CCPD_SIN_B1_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => LPC_LVDS2_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS2_N, -- Diff_n output (connect directly to top-level port)
    I  => ccpd_sin     -- Buffer input
    );

CCPD_CKD_B1_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => LPC_LVDS3_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS3_N, -- Diff_n output (connect directly to top-level port)
    I  => ccpd_ckd     -- Buffer input
    );
CCPD_CKC_B1_OBUF:OBUFDS
  generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
    ) 
  port map(
    O  => LPC_LVDS4_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS4_N, -- Diff_n output (connect directly to top-level port)
    I  => ccpd_ckc  -- Buffer input
    );
         
CCPD_INJ_B1_OBUF:OBUFDS
generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
) 
port map(
    O  => LPC_LVDS6_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS6_N, -- Diff_n output (connect directly to top-level port)
    I =>  ccpd_inj_pulse_b1  -- Buffer input
);
       
CCPD_INJ_B2_OBUF:OBUFDS
generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "SLOW"-- Specify the output slew rate
) 
port map(
    O  => LPC_LVDS12_P, -- Diff_p output (connect directly to top-level port)
    OB => LPC_LVDS12_N, -- Diff_n output (connect directly to top-level port)
    I =>  ccpd_inj_pulse_b2  -- Buffer input
);
          
                               
end Behavioral;
