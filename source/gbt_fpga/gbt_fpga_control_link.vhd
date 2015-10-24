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
    FE_NUMBER_O      :out std_logic_vector(3  downto 0)    
    );
end gbt_fpga_control_link;

architecture Behavioral of gbt_fpga_control_link is

signal reg0            :std_logic_vector(31 downto 0);
signal reg1            :std_logic_vector(31 downto 0); --:= x"a1b2c3d4";
signal reg2            :std_logic_vector(31 downto 0);
signal reg3            :std_logic_vector(31 downto 0);

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of reg0,reg1: signal is "TRUE";

signal addr_in         :std_logic_vector(15 downto 0);
signal data_in         :std_logic_vector(31 downto 0);
signal rw              :std_logic;
signal data_valid_in   :std_logic;
signal fe_num_in       :std_logic_vector(3  downto 0);

signal addr_out        :std_logic_vector(15 downto 0);
signal data_out        :std_logic_vector(31 downto 0);
signal data_valid_out  :std_logic;
signal fe_num_out      :std_logic_vector(3  downto 0);

begin

data_valid_in              <= GBT_RX_IS_DATA;
rw                         <= GBT_RX_DATA(47);
addr_in(15)                <= '0';
addr_in(14 downto 0)       <= GBT_RX_DATA(46 downto 32);
data_in                    <= GBT_RX_DATA(31 downto 0);
fe_num_in                  <= GBT_RX_DATA(83 downto 80);

process(GBT_RX_FRAME_CLK, RST)
begin
if RST = '1' then
  reg0           <= (others => '0');
  reg1           <= (others => '0');
  reg2           <= (others => '0');
  reg3           <= (others => '0');
  addr_out       <= (others => '0');
  data_out       <= (others => '0');
  data_valid_out <= '0';
  fe_num_out     <= (others => '0');
elsif rising_edge(GBT_RX_FRAME_CLK) then
  if data_valid_in = '1' then
  fe_num_out <= fe_num_in;
  case addr_in is 
  when x"4000" =>
    if rw = '1' then 
       data_out       <= reg0;
    elsif rw = '0' then
       reg0           <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"4000";
  
  when x"4004" =>  
    if rw = '1' then 
       data_out       <= reg1;
    elsif rw = '0' then
       reg1           <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"4004";

  when x"4008" =>  
    if rw = '1' then 
       data_out       <= reg1;
    elsif rw = '0' then
       reg1           <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"4008";
      
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
