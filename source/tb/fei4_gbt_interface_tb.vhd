----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2015 09:17:49 AM
-- Design Name: 
-- Module Name: fei4_gbt_interface_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fei4_gbt_interface_tb is
end fei4_gbt_interface_tb;

architecture Behavioral of fei4_gbt_interface_tb is

signal clk40m :std_logic;
signal clk16m :std_logic;
signal global_reset :std_logic;

signal fei4_a1_data_out :std_logic_vector(7 downto 0);
signal fei4_a1_data_is_pix_dat :std_logic;
signal fei4_a2_data_out :std_logic_vector(7 downto 0);
signal fei4_a2_data_is_pix_dat :std_logic;

signal data_counter :integer range 0 to 255:= 0;
signal data_valid   :std_logic;
signal data_valid2  :std_logic;

signal gbt_fei4_tx_is_data :std_logic;
signal gbt_fei4_tx_data    :std_logic_vector(31 downto 0);

begin

clk40_gen:process
begin
        clk40m <= '0';
        wait for 12.5 ns;  
        clk40m <= '1';
        wait for 12.5 ns;  
end process;

clk16_gen:process
begin
        clk16m <= '0';
        wait for 62.5 ns;  
        clk16m <= '1';
        wait for 62.5 ns;  
end process;

global_reset <= '0', '1' after 50 ns, '0' after 100 ns;

data_gen:process(global_reset,clk16m)
begin
if global_reset = '1' then
    data_counter <= 0;
elsif rising_edge(clk16m) then
  if data_counter = 255 then
    data_counter <= 0;
  else
    data_counter <= data_counter + 1;
  end if;
  
  if data_counter >= 128 and data_counter <= 250 then
    data_valid <= '1';
  else
    data_valid <= '0';
  end if;

  if data_counter >= 130 and data_counter <= 252 then
    data_valid2 <= '1';
  else
    data_valid2 <= '0';
  end if;
  
end if;
end process;

fei4_a1_data_gen:process(global_reset,clk16m)
begin

if global_reset = '1' then
    fei4_a1_data_out <= (others => '0');
    fei4_a1_data_is_pix_dat <= '0';
    fei4_a2_data_out <= (others => '0');
    fei4_a2_data_is_pix_dat <= '0';
    
elsif rising_edge(clk16m) then
    if data_valid = '1' then
      fei4_a1_data_is_pix_dat <= '1';
      fei4_a1_data_out <= std_logic_vector(to_unsigned(data_counter, 8));
    else
      fei4_a1_data_out <= x"3C";
      fei4_a1_data_is_pix_dat <= '0';
    end if;

    if data_valid2 = '1' then
      fei4_a2_data_is_pix_dat <= '1';
      fei4_a2_data_out <= std_logic_vector(to_unsigned(data_counter, 8));
    else
      fei4_a2_data_out <= x"3C";
      fei4_a2_data_is_pix_dat <= '0';
    end if;
    
end if;
end process;
 
fei4_to_gbt: entity work.fei4_gbt_interface
Port map (
    RST               => global_reset,
    
    FEI4_DAT_CLK      => clk16m,
    FEI4_A1_RX_DAT_IN => fei4_a1_data_out,
    FEI4_A1_RX_IS_PIX => fei4_a1_data_is_pix_dat,
    FEI4_A2_RX_DAT_IN => fei4_a2_data_out,
    FEI4_A2_RX_IS_PIX => fei4_a2_data_is_pix_dat,
    --    FEI4_B1_RX_DAT_IN : in std_logic_vector(7 downto 0);
    --    FEI4_B1_RX_IS_PIX : in std_logic;
    --    FEI4_B2_RX_DAT_IN : in std_logic_vector(7 downto 0);
    --    FEI4_B2_RX_IS_PIX : in std_logic;

    
    GBT_TX_FRAME_CLK  => clk40m,
    GBT_FEI4_TX_DATA     => gbt_fei4_tx_data,
    GBT_FEI4_TX_IS_DATA  => gbt_fei4_tx_is_data
    
    --    GBT_TX_IS_DAT     : out std_logic;
    --    GBT_TX_DAT        : out std_logic_vector(83 downto 0)
);

end Behavioral;
