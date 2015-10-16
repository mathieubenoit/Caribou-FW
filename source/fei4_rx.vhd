----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin
-- 
-- Create Date: 08/11/2015 04:30:58 PM
-- Design Name: FEI4 RX firmware
-- Module Name: fei4_rx - Behavioral
-- Project Name: CaRIBOu Test Firmware 
-- Target Devices: XC7Z045
-- Tool Versions: Vivado 2014.2
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
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FEI4_RX is
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
end FEI4_RX;

architecture Behavioral of FEI4_RX is

component idelay is
    Port ( 
    RESET  :        in std_logic;
    DATA_IN:        in std_logic;
    DATA_OUT:       out std_logic;
    
    CLK    : in std_logic;
    REFCLK : in std_logic;
    CNT_OUT    : out std_logic_vector(4 downto 0);
    CTRL_RDY   : out std_logic;
    LD    : in  std_logic;
    CNT_IN     : in  std_logic_vector(4 downto 0)
    );
end component;

component FEI4_DATA_DESER is
    Port ( 
    RESET     : in STD_LOGIC;
    
    DATA_IN : in std_logic;
    BIT_CLK : in STD_LOGIC;
    FRAME_CLK : in std_logic;
    
    FRAME_SYNC_EN : in std_logic;   
    FRAME_IS_SYNCED : out std_logic;
    DATA_OUT : out std_logic_vector(7 downto 0);
    DATA_ISK : out std_logic;
    DATA_IDLE: out std_logic;
    DATA_SOF : out std_logic;
    DATA_EOF : out std_logic    
    );
end component;

component fei4_data_extract is
    Port ( 
    RESET     : in STD_LOGIC;  
      
    FRAME_CLK       : in std_logic;  
    FE_SR_RD_EN     : in std_logic; 
    FRAME_IS_SYNCED : in std_logic;   
    
    DATA_IN         : in std_logic_vector(7 downto 0);
    FIFO_WR_EN      : out std_logic;
    
    REG_ADDR_OUT : out std_logic_vector(15 downto 0);
    REG_VALUE_OUT : out std_logic_vector(15 downto 0)
    );
end component;

signal data_clcok :std_logic;
signal data_fclock :std_logic;

signal data_in_buf :std_logic;
signal data_delayed:std_logic;

signal fei4_frame_is_synced  : std_logic;   
signal fei4_rx_data_out      : std_logic_vector(7 downto 0);
signal fei4_rx_data_isk      : std_logic;
signal fei4_rx_data_idle     : std_logic;
signal fei4_rx_data_sof      : std_logic;
signal fei4_rx_data_eof      : std_logic;
signal fei4_data_wr_fifo_en  : std_logic;

attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of fei4_frame_is_synced,fei4_rx_data_out,fei4_rx_data_isk,fei4_rx_data_idle,fei4_rx_data_sof,fei4_rx_data_eof : signal is "TRUE";
attribute MARK_DEBUG of fei4_rx_data_out,fei4_data_wr_fifo_en: signal is "TRUE";

begin
data_clcok <= CLK160;
data_fclock <= CLK16;

--LVDS Input Buffer 
FEI4_DOB_BUF :IBUFDS
generic map (
DIFF_TERM => TRUE, -- Differential Termination
IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "LVDS_25")
port map (
O => data_in_buf, 
I  => DATA_IN_P, 
IB => DATA_IN_N 
);

--RX DATA IO DELAY
data_delay:idelay
Port map( 
    RESET   => RESET,
    DATA_IN => data_in_buf,
    DATA_OUT => data_delayed,

    CLK    => data_clcok,
    REFCLK => IDELAY_REFCLK,
    CNT_OUT    => IDELAY_CNT_OUT,
    CTRL_RDY  => IDELAY_CTRL_RDY,
    LD    => IDELAY_LD,
    CNT_IN    => IDELAY_CNT_IN
);         

data_deser:FEI4_DATA_DESER
    Port map ( 
    RESET     => RESET,
    
    DATA_IN   => data_delayed,
    BIT_CLK   => data_clcok,
    FRAME_CLK => data_fclock,
    
    FRAME_SYNC_EN    => FRAME_SYNC_EN,
    FRAME_IS_SYNCED  => fei4_frame_is_synced,
    DATA_OUT         => fei4_rx_data_out,
    DATA_ISK         => fei4_rx_data_isk,
    DATA_IDLE        => fei4_rx_data_idle,
    DATA_SOF         => fei4_rx_data_sof,
    DATA_EOF         => fei4_rx_data_eof
    );

data_extract:fei4_data_extract
    Port map ( 
    RESET           => RESET,
      
    FRAME_CLK       => data_fclock,
    FE_SR_RD_EN     => FE_SR_RD_EN,
    FRAME_IS_SYNCED => fei4_frame_is_synced,   
     
    DATA_IN   => fei4_rx_data_out,
    FIFO_WR_EN => fei4_data_wr_fifo_en,
    
    REG_ADDR_OUT   => REG_ADDR_OUT,
    REG_VALUE_OUT  => REG_VALUE_OUT
    );

-- Delay FEI4 data for one clock to align with the FIFO write data enable
fei4_data_delay:process(data_fclock)
begin
  if rising_edge(data_fclock) then
    DATA_OUT <= fei4_rx_data_out;
  end if;
end process;
  
FIFO_WR_EN <= fei4_data_wr_fifo_en;
  		
end Behavioral;
