----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2015 09:51:26 PM
-- Design Name: 
-- Module Name: gbt_fpga_ctrl_link_tb - Behavioral
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

entity gbt_fpga_ctrl_link_tb is
end gbt_fpga_ctrl_link_tb;

architecture Behavioral of gbt_fpga_ctrl_link_tb is

signal clk40m :std_logic;
signal rst    :std_logic;

signal gbt_rx_data    :std_logic_vector(47 downto 0);
signal gbt_rx_is_data :std_logic;

signal data_valid_o   :std_logic;
signal reg_addr_o     :std_logic_vector(14 downto 0);
signal reg_data_o     :std_logic_vector(31 downto 0);

begin

clk40_gen:process
   begin
        clk40m <= '1';
        wait for 12.5 ns;  
        clk40m <= '0';
        wait for 12.5 ns;  
end process;


rst <= '0', '1' after 50 ns, '0' after 100 ns;

gbt_rx_data <= x"000000000000", x"c00411223344" after 1000 ns, x"400811222644" after 1025 ns;
gbt_rx_is_data <= '0', '1' after 1000 ns, '0' after 1025 ns;

gbt_slow_ctrl:entity work.gbt_fpga_control_link
Port map (
RST              => rst, 

GBT_RX_FRAME_CLK => clk40m,
GBT_RX_IS_DATA   => gbt_rx_is_data,
GBT_RX_DATA      => gbt_rx_data,

DATA_VALID_O     => data_valid_o,
REG_ADDRESS_O    => reg_addr_o,
REG_VALUE_O      => reg_data_o
);

end Behavioral;
