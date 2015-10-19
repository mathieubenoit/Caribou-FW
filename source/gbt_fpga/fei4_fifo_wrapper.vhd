----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 05:37:04 PM
-- Design Name: 
-- Module Name: fei4_fifo_wrapper - Behavioral
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

entity fei4_fifo_wrapper is
    Port ( 
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
    din : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    rd_data_count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT; 

signal fei4_fifo_in      :std_logic_vector(9 downto 0);
signal fei4_fifo_out     :std_logic_vector(4 downto 0);
signal fei4_fifo_empty   :std_logic;
signal fei4_fifo_full    :std_logic;
signal fei4_fifo_rd_en   :std_logic;
signal fei4_fifo_rd_cnt  :std_logic;

TYPE machine IS(idle, read); --needed states
signal state :machine;

begin

fei4_fifo_in(9)         <= FEI4_RX_IS_PIX;
fei4_fifo_in(8 downto 5)<= FEI4_RX_DAT_IN(7 downto 4);
fei4_fifo_in(4)         <= FEI4_RX_IS_PIX;
fei4_fifo_in(3 downto 0)<= FEI4_RX_DAT_IN(3 downto 0);

fei4_a1_fifo:fei4_data_fifo
PORT MAP (
    rst             => RST,
    wr_clk          => FEI4_DAT_CLK,
    rd_clk          => GBT_WR_WORD_CLK,
    din             => fei4_a1_fifo_in,
    wr_en           => FEI4_A1_RX_IS_PIX,
    rd_en           => fei4_data_fifo_a1_rd_en,
    dout            => fei4_a1_fifo_out,
    full            => full,
    empty           => fei4_a1_fifo_empty,
    rd_data_count   => fei4_a1_fifo_rd_cnt
);

fei4_a1_fifo_rd_ctr:process(RST, GBT_WR_WORD_CLK)
begin
  if RST = '1' then
    fei4_fifo_rd_cnt <= '0';
  elsif rising_edge(GBT_WR_WORD_CLK) then
    case state is
    when idle =>
      if fei4_fifo_rd_cnt >= X"8" then
        state <= read;
        fei4_data_fifo_rd_en <= '1';
      end if;
    when read =>
      if fei4_fifo_empty = '1' then
        fei4_data_fifo_rd_en <= '0';
        state <= idle;
      end if;
    end case;
  end if;
end process;

end Behavioral;
