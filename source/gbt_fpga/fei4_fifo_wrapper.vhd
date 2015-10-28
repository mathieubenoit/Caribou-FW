----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin Liu hliu2@bnl.gov
-- 
-- Create Date: 10/19/2015 05:37:04 PM
-- Design Name: 
-- Module Name: fei4_fifo_wrapper - Behavioral
-- Project Name: CaRIBOU Firmware
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fei4_fifo_wrapper is
    Port ( 
    RST         : in std_logic;
    
    WR_CLK      : in std_logic;
    DATA_IN     : in std_logic_vector(7 downto 0);
    IS_DAT_IN   : in std_logic;
    
    RD_CLK      : in  std_logic;
    IS_DAT_OUT  : out std_logic;
    DAT_OUT     : out std_logic_vector(3 downto 0)   
    );
end fei4_fifo_wrapper;

architecture Behavioral of fei4_fifo_wrapper is

COMPONENT fei4_data_fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    rd_data_count : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END COMPONENT; 


signal fei4_fifo_out     :std_logic_vector(3 downto 0);
signal fei4_fifo_empty   :std_logic;
signal fei4_fifo_full    :std_logic;
signal fei4_fifo_rd_en   :std_logic;
signal fei4_fifo_rd_cnt  :std_logic_vector(6 downto 0);

signal is_dat_in_flg     :std_logic;
signal is_dat_in_flg_pre :std_logic;
signal is_dat_in_flg_pre1 :std_logic;

signal fifo_data_valid   :std_logic;
TYPE machine IS(idle, read); --needed states
signal state :machine;

begin

fei4_a1_fifo:fei4_data_fifo
PORT MAP (
    rst             => RST,
    wr_clk          => WR_CLK,
    rd_clk          => RD_CLK,
    din             => DATA_IN,
    wr_en           => IS_DAT_IN,
    rd_en           => fei4_fifo_rd_en,
    dout            => DAT_OUT,
    full            => fei4_fifo_full,
    empty           => fei4_fifo_empty,
    rd_data_count   => fei4_fifo_rd_cnt
);

is_dat_in_flg <= IS_DAT_IN;
fei4_a1_fifo_rd_ctr:process(RST, RD_CLK)
begin

  if RST = '1' then
    fei4_fifo_rd_en <= '0';
    is_dat_in_flg_pre <= '0';
    is_dat_in_flg_pre1 <= '0';
    fifo_data_valid <= '0';
    
  elsif rising_edge(RD_CLK) then
  
  is_dat_in_flg_pre <= is_dat_in_flg;
  is_dat_in_flg_pre1 <= is_dat_in_flg_pre;
  
    case state is
    
    when idle =>
      if fei4_fifo_rd_cnt >= "0100000" or (is_dat_in_flg_pre1 = '1' and is_dat_in_flg_pre = '0')then
        state <= read;
        fei4_fifo_rd_en <= '1';     
      end if;
      
    when read =>
      if fei4_fifo_empty = '1' then
        fei4_fifo_rd_en <= '0';
        fifo_data_valid <= '0';
        state <= idle;
      else
        fifo_data_valid <= '1';
      end if;
      
    end case;
    
  end if;
  
end process;

IS_DAT_OUT <= fifo_data_valid;

end Behavioral;
