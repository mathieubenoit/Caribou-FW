----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin Liu hliu2@bnl.gov
-- 
-- Create Date: 10/19/2015 04:17:31 PM
-- Design Name: 
-- Module Name: fei4_gbt_interface - Behavioral
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

entity fei4_gbt_interface is
    Port (
    RST                     : in std_logic;
    
    FEI4_DAT_CLK            : in std_logic;
    FEI4_A1_RX_DAT_IN       : in std_logic_vector(7 downto 0);
    FEI4_A1_RX_IS_PIX       : in std_logic;
    FEI4_A2_RX_DAT_IN       : in std_logic_vector(7 downto 0);
    FEI4_A2_RX_IS_PIX       : in std_logic;
--    FEI4_B1_RX_DAT_IN : in std_logic_vector(7 downto 0);
--    FEI4_B1_RX_IS_PIX : in std_logic;
--    FEI4_B2_RX_DAT_IN : in std_logic_vector(7 downto 0);
--    FEI4_B2_RX_IS_PIX : in std_logic;
    
    GBT_TX_FRAME_CLK        : in  std_logic;
    GBT_FEI4_TX_DATA        : out std_logic_vector(31 downto 0);
    GBT_FEI4_TX_IS_DATA     : out std_logic
--    GBT_TX_DAT        : out std_logic_vector(83 downto 0)
    );
end fei4_gbt_interface;

architecture Behavioral of fei4_gbt_interface is

signal fei4_data_valid    :std_logic;

signal fei4_a1_data_2_gbt  :std_logic_vector(3 downto 0);
signal fei4_a1_data_valid  :std_logic;
signal fei4_a1_device_num  :std_logic_vector(1 downto 0) :=b"01";
signal fei4_a1_reserve_bit :std_logic := '0';

signal fei4_a2_data_2_gbt :std_logic_vector(3 downto 0);
signal fei4_a2_data_valid :std_logic;
signal fei4_a2_device_num :std_logic_vector(1 downto 0) := "10";

signal fei4_a1_gbt_tx_data :std_logic_vector(7 downto 0);
signal fei4_a2_gbt_tx_data :std_logic_vector(7 downto 0);

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of fei4_a1_data_2_gbt,fei4_a1_data_valid: signal is "TRUE";
attribute MARK_DEBUG of fei4_a2_data_2_gbt,fei4_a2_data_valid: signal is "TRUE";

begin

fei4_a1_fifo:entity work.fei4_fifo_wrapper
    Port map( 
    RST         => RST,
    
    WR_CLK      => FEI4_DAT_CLK,
    DATA_IN     => FEI4_A1_RX_DAT_IN,
    IS_DAT_IN   => FEI4_A1_RX_IS_PIX,
    
    RD_CLK      => GBT_TX_FRAME_CLK,
    IS_DAT_OUT  => fei4_a1_data_valid,
    DAT_OUT     => fei4_a1_data_2_gbt
    );


fei4_a2_fifo:entity work.fei4_fifo_wrapper
    Port map( 
    RST         => RST,
    
    WR_CLK      => FEI4_DAT_CLK,
    DATA_IN     => FEI4_A2_RX_DAT_IN,
    IS_DAT_IN   => FEI4_A2_RX_IS_PIX,
    
    RD_CLK      => GBT_TX_FRAME_CLK,
    IS_DAT_OUT  => fei4_a2_data_valid,
    DAT_OUT     => fei4_a2_data_2_gbt
    );


process(RST, GBT_TX_FRAME_CLK)
begin

  if RST = '1' then
    fei4_data_valid <= '0';
    fei4_a1_gbt_tx_data(7) <= '0';
    fei4_a1_gbt_tx_data(3 downto 0) <= (others => '0');
    fei4_a2_gbt_tx_data(7) <= '0';
    fei4_a2_gbt_tx_data(3 downto 0) <= (others => '0');   
  elsif rising_edge(GBT_TX_FRAME_CLK) then
    fei4_data_valid <= fei4_a1_data_valid or fei4_a2_data_valid;
    fei4_a1_gbt_tx_data(7)          <= fei4_a1_data_valid;
    fei4_a1_gbt_tx_data(3 downto 0) <= fei4_a1_data_2_gbt;
    fei4_a2_gbt_tx_data(7)          <= fei4_a2_data_valid;
    fei4_a2_gbt_tx_data(3 downto 0) <= fei4_a2_data_2_gbt;
  end if;
  
end process;

fei4_a1_gbt_tx_data(6 downto 4) <= "001";
fei4_a2_gbt_tx_data(6 downto 4) <= "010";

GBT_FEI4_TX_DATA(7 downto 0)    <= fei4_a1_gbt_tx_data;
GBT_FEI4_TX_DATA(15 downto 8)   <= fei4_a2_gbt_tx_data;
GBT_FEI4_TX_DATA(31 downto 16)  <= (others => '0');
GBT_FEI4_TX_IS_DATA             <= fei4_data_valid;
       
end Behavioral;
