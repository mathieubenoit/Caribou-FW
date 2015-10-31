----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2015 02:23:19 PM
-- Design Name: 
-- Module Name: gbt_fpga_control_link - Behavioral
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

entity gbt_fpga_control_link is
    Port (
    RST              :in std_logic;
    
    GBT_RX_FRAME_CLK :in std_logic;
    GBT_RX_IS_DATA   :in std_logic;
    GBT_RX_DATA      :in std_logic_vector(83 downto 0);  
    
    DATA_VALID_O     :out std_logic;
    REG_ADDRESS_O    :out std_logic_vector(14 downto 0);
    REG_VALUE_O      :out std_logic_vector(31 downto 0);
    FE_NUMBER_O      :out std_logic_vector(3  downto 0);

    -- Control signals
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
    
    CCPD_CFG_FLG         :out std_logic;
    CCPD_CFG_REG_LIMIT   :out std_logic_vector(4 downto 0);
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
end gbt_fpga_control_link;

architecture Behavioral of gbt_fpga_control_link is


--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of reg0,reg1: signal is "TRUE";

signal addr_in         :std_logic_vector(15 downto 0);
signal data_in         :std_logic_vector(31 downto 0);
signal rw              :std_logic;
signal data_valid_in   :std_logic;
signal fe_num_in       :std_logic_vector(3  downto 0);

signal addr_out        :std_logic_vector(15 downto 0);
signal data_out        :std_logic_vector(31 downto 0);
signal data_valid_out  :std_logic;
signal fe_num_out      :std_logic_vector(3  downto 0);

signal test_reg1           :std_logic_vector(31  downto 0);
signal test_reg2           :std_logic_vector(31  downto 0);
signal test_reg3           :std_logic_vector(31  downto 0);
signal test_reg4           :std_logic_vector(31  downto 0);

begin

data_valid_in              <= GBT_RX_IS_DATA;
rw                         <= GBT_RX_DATA(47);
addr_in(15)                <= '0';
addr_in(14 downto 0)       <= GBT_RX_DATA(46 downto 32);
data_in                    <= GBT_RX_DATA(31 downto 0);
fe_num_in                  <= GBT_RX_DATA(83 downto 80);

fe_num_out <= x"8";

process(GBT_RX_FRAME_CLK, RST)
begin
if RST = '1' then
  addr_out       <= (others => '0');
  data_out       <= (others => '0');
  data_valid_out <= '0';
  fe_num_out     <= (others => '0');
elsif rising_edge(GBT_RX_FRAME_CLK) then
  if data_valid_in = '1' then
  case addr_in is 

  when x"0004" =>  
    if rw = '0' then
       RST_CTRL          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0004";
  
  when x"0008" =>  
    if rw = '1' then 
       data_out(19 downto 0)       <= ADC_DCLK_FREQ;
       data_out(31 downto 20)<= (others => '0'); 
    end if;
    data_valid_out <= '1';
    addr_out <= x"0008";
  
  when x"000c" =>  
    if rw = '1' then 
       data_out(19 downto 0)       <= ADC_DCLK_FREQ;
       data_out(31 downto 20)<= (others => '0'); 
    end if;
    data_valid_out <= '1';
    addr_out <= x"000c";
  
  when x"0010" =>  
    if rw = '0' then
       ADC_FCLK_POS   <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0010";
  
  when x"0014" =>  
    if rw = '0' then
       FEI4_CFG_FLG          <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0014";
  
  when x"0018" =>  
    if rw = '0' then
       FEI4_CFG_REG          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0018";
  
--  when x"001c" =>  
--    if rw = '0' then
--       reg7          <= data_in;
--       data_out       <= data_in;
--    end if;
--    data_valid_out <= '1';
--    addr_out <= x"001c";
  
  when x"0020" =>  
    if rw = '0' then
       FEI4_WR_REG_DAT          <= data_in(15 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0020";
  
  when x"0024" =>  
    if rw = '0' then
       FEI4_CMD_PH_SEL          <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0024";
  
  when x"0028" =>  
    if rw = '0' then
       FEI4_FR_RAM_ADDR          <= data_in(5 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0028";
  
  when x"002c" =>  
    if rw = '1' then 
       data_out       <= FEI4_FR_RAM_DAT_OUT;
    elsif rw = '0' then
       FEI4_FR_RAM_DAT_IN          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"002c";
  
  when x"0030" =>  
    if rw = '0' then
       FEI4_FRAME_SYNC_EN          <= data_in(1 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0030";
  
  when x"0034" =>  
    if rw = '0' then
       FEI4_FE_SR_RD_EN          <= data_in(1 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0034";
  
  when x"0038" =>  
    if rw = '1' then 
       data_out       <= FEI4_REG_ADDR_OUT;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0038";
  
  when x"003c" =>  
    if rw = '1' then 
       data_out       <= FEI4_REG_VALUE_OUT;
    end if;
    data_valid_out <= '1';
    addr_out <= x"003c";
  
  when x"0040" =>  
    if rw = '1' then 
       data_out(31 downto 16)<= (others => '0');
       data_out(15)          <= FEI4_IDELAY_CTRL_RDY(1);
       data_out(14 downto 13)<= (others => '0');
       data_out(12 downto 8) <= FEI4_IDELAY_CNT_OUT(9 downto 5); 
       data_out(7)           <= FEI4_IDELAY_CTRL_RDY(0);
       data_out(6 downto 5)  <= (others => '0');
       data_out(4 downto 0)  <= FEI4_IDELAY_CNT_OUT(4 downto 0); 
    end if;
    data_valid_out <= '1';
    addr_out <= x"0040";
  
  when x"0044" =>  
    if rw = '0' then
       FEI4_IDELAY_CNT_IN          <= data_in(9 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0044";
  
  when x"0048" =>  
    if rw = '0' then
       FEI4_IDELAY_LD          <= data_in(1 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0048";
  
  when x"004c" =>  
    if rw = '0' then
       FEI4_CAL_CNT_DELAY          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"004c";
  
--  when x"0050" =>  
--    if rw = '1' then 
--       data_out       <= reg20;
--    elsif rw = '0' then
--       reg20          <= data_in;
--       data_out       <= data_in;
--    end if;
--    data_valid_out <= '1';
--    addr_out <= x"0050";
  
--  when x"0054" =>  
--    if rw = '1' then 
--       data_out       <= reg21;
--    elsif rw = '0' then
--       reg21          <= data_in;
--       data_out       <= data_in;
--    end if;
--    data_valid_out <= '1';
--    addr_out <= x"0054";
  
--  when x"0058" =>  
--    if rw = '1' then 
--       data_out       <= reg22;
--    elsif rw = '0' then
--       reg22          <= data_in;
--       data_out       <= data_in;
--    end if;
--    data_valid_out <= '1';
--    addr_out <= x"0058";
  
  when x"005c" =>  
    if rw = '0' then
       HP_GEN_RST          <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"005c";
  
  when x"0060" =>  
    if rw = '0' then
       HP_TRIGER       <= data_in(3 downto 0); 
       HP_FIFO_RST     <= data_in(7 downto 4);
       HP_ADDR_RST     <= data_in(11 downto 8);    
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0060";
  
  when x"0064" =>  
    if rw = '0' then
       HP_BURST_EN          <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0064";
  
  when x"0068" =>  
    if rw = '0' then
       HP_TEST_DATA_EN          <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0068";
  
  when x"006c" =>  
    if rw = '0' then
       HP0_BURST_LEN          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"006c";
  
  when x"0070" =>  
    if rw = '1' then 
       data_out       <= HP0_BURST_ADDR;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0070";
  
  when x"0074" =>  
    if rw = '1' then 
       data_out       <= HP2_BURST_ADDR;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0074";
  
  when x"0078" =>  
    if rw = '1' then 
       data_out(7 downto 0)       <= HP2_FIFO_CNT;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0078";
  
  when x"007c" =>  
    if rw = '0' then
       HP2_BURST_LAST_RD          <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"007c";
    
  when x"0080" =>  
    if rw = '0' then
       PL_IIC_CMD_FLG          <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0080";
  
  when x"0084" =>  
    if rw = '0' then
       PL_IIC_CTRL_IN          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0084";
  
  when x"0088" =>  
    if rw = '0' then
       PL_IIC_WR_BUF          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0088";
  
  when x"008c" =>  
    if rw = '1' then 
       data_out    <= PL_IIC_RD_BUF;
    end if;
    data_valid_out <= '1';
    addr_out <= x"008c";
   
  when x"0090" =>  
    if rw = '0' then
       CCPD_CFG_FLG   <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0090";
  
  when x"0094" =>  
    if rw = '0' then
       CCPD_CFG_REG_LIMIT    <= data_in(4 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0094";
  
  when x"0098" =>  
    if rw = '0' then
       CCPD_CFG_SHIFT_LIMIT   <= data_in(4 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0098";
    
  when x"009c" =>  
    if rw = '0' then
       CCPD_CFG_CLK_EN        <= data_in(1 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"009c";
  
  when x"00a0" =>  
    if rw = '0' then
       CCPD_CFG_RAM_WR_EN     <= data_in(0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a0";

  when x"00a4" =>  
    if rw = '0' then
       CCPD_RAM_WR_DAT        <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a0";
    
  
  when x"00a8" =>  
    if rw = '0' then
       CCPD_CFG_RAM_ADDR      <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a8";
  
  when x"00ac" =>  
    if rw = '1' then
       data_out       <= CCPD_CFG_RAM_RD_DAT;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00ac";
 
  when x"00b0" =>  
   if rw = '0' then
      CCPD_CFG_OUTPUT_EN       <= data_in(1 downto 0);
   end if;
   data_valid_out <= '1';
   addr_out <= x"00b0";
   
  when x"00b4" =>  
    if rw = '0' then
       CCPD_INJ_FLG     <= data_in(0);
       data_out         <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00b8";
  
  when x"00b8" =>  
    if rw = '0' then
       CCPD_INJ_PLS_CNT    <= data_in(15 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00b8";
  
  when x"00bc" =>  
    if rw = '0' then
       CCPD_INJ_HIGH_CNT    <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00bc";
  
  when x"00c0" =>  
    if rw = '0' then
       CCPD_INJ_LOW_CNT     <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00c0";
  
  when x"00c4" =>  
    if rw = '0' then
       CCPD_INJ_OUT_EN      <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00c4";

  when x"00c8" =>  
    if rw = '0' then
       CCPD_TRI_DLY_CNT      <= data_in(3 downto 0);
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00c8";
      
--  when x"00c0" =>  
--    if rw = '1' then 
--       data_out       <= reg48;
--    elsif rw = '0' then
--       reg48          <= data_in;
--       data_out       <= data_in;
--    end if;
--    data_valid_out <= '1';
--    addr_out <= x"00c0";
  
  when x"00f0" =>  
    if rw = '1' then 
       data_out       <= test_reg1;
    elsif rw = '0' then
       test_reg1          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00f0";

  when x"00f4" =>  
    if rw = '1' then 
       data_out       <= test_reg2;
    elsif rw = '0' then
       test_reg2          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00f4";

  when x"00f8" =>  
    if rw = '1' then 
       data_out       <= test_reg3;
    elsif rw = '0' then
       test_reg3          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00f8";

  when x"00fc" =>  
    if rw = '1' then 
       data_out       <= test_reg4;
    elsif rw = '0' then
       test_reg4          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00fc";
   
  when others =>
     data_valid_out   <= '0';
     data_out         <= (others => '0');
     addr_out         <= (others => '0');
     
   end case;  
 else
   data_valid_out <= '0';
 end if;
end if;
end process;      

DATA_VALID_O     <= data_valid_out;
REG_ADDRESS_O    <= addr_out(14 downto 0);
REG_VALUE_O      <= data_out;
FE_NUMBER_O      <= fe_num_out;
              
end Behavioral;
