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
    RST               : in std_logic;
    
    FEI4_DAT_CLK      : in std_logic;
    FEI4_A1_RX_DAT_IN : in std_logic_vector(7 downto 0);
    FEI4_A1_RX_IS_PIX : in std_logic;
    FEI4_A2_RX_DAT_IN : in std_logic_vector(7 downto 0);
    FEI4_A2_RX_IS_PIX : in std_logic;
--    FEI4_B1_RX_DAT_IN : in std_logic_vector(7 downto 0);
--    FEI4_B1_RX_IS_PIX : in std_logic;
--    FEI4_B2_RX_DAT_IN : in std_logic_vector(7 downto 0);
--    FEI4_B2_RX_IS_PIX : in std_logic;
    
    GBT_WR_WORD_CLK   : in  std_logic
--    GBT_TX_IS_DAT     : out std_logic;
--    GBT_TX_DAT        : out std_logic_vector(83 downto 0)
    );
end fei4_gbt_interface;

architecture Behavioral of fei4_gbt_interface is

signal fei4_a1_data_2_gbt :std_logic_vector(3 downto 0);
signal fei4_a1_data_valid :std_logic;

signal fei4_a2_data_2_gbt :std_logic_vector(3 downto 0);
signal fei4_a2_data_valid :std_logic;

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
    
    RD_CLK      => GBT_WR_WORD_CLK,
    IS_DAT_OUT  => fei4_a1_data_valid,
    DAT_OUT     => fei4_a1_data_2_gbt
    );

fei4_a2_fifo:entity work.fei4_fifo_wrapper
    Port map( 
    RST         => RST,
    
    WR_CLK      => FEI4_DAT_CLK,
    DATA_IN     => FEI4_A2_RX_DAT_IN,
    IS_DAT_IN   => FEI4_A2_RX_IS_PIX,
    
    RD_CLK      => GBT_WR_WORD_CLK,
    IS_DAT_OUT  => fei4_a2_data_valid,
    DAT_OUT     => fei4_a2_data_2_gbt
    );
         
end Behavioral;
