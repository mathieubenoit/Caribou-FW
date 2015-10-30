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

    reg1_IO             :inout std_logic_vector(31 downto 0);
    reg2_IO             :inout std_logic_vector(31 downto 0);
    reg3_IO             :inout std_logic_vector(31 downto 0);
    reg4_IO             :inout std_logic_vector(31 downto 0);
    reg5_IO             :inout std_logic_vector(31 downto 0);
    reg6_IO             :inout std_logic_vector(31 downto 0);
    reg7_IO             :inout std_logic_vector(31 downto 0);
    reg8_IO             :inout std_logic_vector(31 downto 0);
    reg9_IO             :inout std_logic_vector(31 downto 0);
    reg10_IO             :inout std_logic_vector(31 downto 0);
    reg11_IO             :inout std_logic_vector(31 downto 0);
    reg12_IO             :inout std_logic_vector(31 downto 0);
    reg13_IO             :inout std_logic_vector(31 downto 0);
    reg14_IO             :inout std_logic_vector(31 downto 0);
    reg15_IO             :inout std_logic_vector(31 downto 0);
    reg16_IO             :inout std_logic_vector(31 downto 0);
    reg17_IO             :inout std_logic_vector(31 downto 0);
    reg18_IO             :inout std_logic_vector(31 downto 0);
    reg19_IO             :inout std_logic_vector(31 downto 0);
    reg20_IO             :inout std_logic_vector(31 downto 0);
    reg21_IO             :inout std_logic_vector(31 downto 0);
    reg22_IO             :inout std_logic_vector(31 downto 0);
    reg23_IO             :inout std_logic_vector(31 downto 0);
    reg24_IO             :inout std_logic_vector(31 downto 0);
    reg25_IO             :inout std_logic_vector(31 downto 0);
    reg26_IO             :inout std_logic_vector(31 downto 0);
    reg27_IO             :inout std_logic_vector(31 downto 0);
    reg28_IO            :inout std_logic_vector(31 downto 0);
    reg29_IO             :inout std_logic_vector(31 downto 0);
    reg30_IO             :inout std_logic_vector(31 downto 0);
    reg31_IO             :inout std_logic_vector(31 downto 0);
    reg32_IO             :inout std_logic_vector(31 downto 0);
    reg33_IO             :inout std_logic_vector(31 downto 0);
    reg34_IO             :inout std_logic_vector(31 downto 0);
    reg35_IO             :inout std_logic_vector(31 downto 0);
    reg36_IO             :inout std_logic_vector(31 downto 0);
    reg37_IO             :inout std_logic_vector(31 downto 0);
    reg38_IO             :inout std_logic_vector(31 downto 0);
    reg39_IO             :inout std_logic_vector(31 downto 0);
    reg40_IO             :inout std_logic_vector(31 downto 0);
    reg41_IO             :inout std_logic_vector(31 downto 0);
    reg42_IO             :inout std_logic_vector(31 downto 0);
    reg43_IO             :inout std_logic_vector(31 downto 0);
    reg44_IO             :inout std_logic_vector(31 downto 0);
    reg45_IO             :inout std_logic_vector(31 downto 0);
    reg46_IO             :inout std_logic_vector(31 downto 0);
    reg47_IO             :inout std_logic_vector(31 downto 0);
    reg48_IO             :inout std_logic_vector(31 downto 0);
    reg49_IO             :inout std_logic_vector(31 downto 0)     
    );
end gbt_fpga_control_link;

architecture Behavioral of gbt_fpga_control_link is

signal reg0            :std_logic_vector(31 downto 0);
signal reg1            :std_logic_vector(31 downto 0); --:= x"a1b2c3d4";
signal reg2            :std_logic_vector(31 downto 0);
signal reg3            :std_logic_vector(31 downto 0);
signal reg4            :std_logic_vector(31 downto 0);
signal reg5            :std_logic_vector(31 downto 0);
signal reg6            :std_logic_vector(31 downto 0);
signal reg7            :std_logic_vector(31 downto 0);
signal reg8            :std_logic_vector(31 downto 0);
signal reg9            :std_logic_vector(31 downto 0);
signal reg10            :std_logic_vector(31 downto 0);
signal reg11            :std_logic_vector(31 downto 0);
signal reg12            :std_logic_vector(31 downto 0);
signal reg13            :std_logic_vector(31 downto 0);
signal reg14            :std_logic_vector(31 downto 0);
signal reg15            :std_logic_vector(31 downto 0);
signal reg16            :std_logic_vector(31 downto 0);
signal reg17            :std_logic_vector(31 downto 0);
signal reg18            :std_logic_vector(31 downto 0);
signal reg19            :std_logic_vector(31 downto 0);
signal reg20            :std_logic_vector(31 downto 0);
signal reg21            :std_logic_vector(31 downto 0);
signal reg22            :std_logic_vector(31 downto 0);
signal reg23            :std_logic_vector(31 downto 0);
signal reg24            :std_logic_vector(31 downto 0);
signal reg25            :std_logic_vector(31 downto 0);
signal reg26            :std_logic_vector(31 downto 0);
signal reg27            :std_logic_vector(31 downto 0);
signal reg28            :std_logic_vector(31 downto 0);
signal reg29            :std_logic_vector(31 downto 0);
signal reg30            :std_logic_vector(31 downto 0);
signal reg31            :std_logic_vector(31 downto 0);
signal reg32            :std_logic_vector(31 downto 0);
signal reg33            :std_logic_vector(31 downto 0);
signal reg34            :std_logic_vector(31 downto 0);
signal reg35            :std_logic_vector(31 downto 0);
signal reg36            :std_logic_vector(31 downto 0);
signal reg37            :std_logic_vector(31 downto 0);
signal reg38            :std_logic_vector(31 downto 0);
signal reg39            :std_logic_vector(31 downto 0);
signal reg40            :std_logic_vector(31 downto 0);
signal reg41            :std_logic_vector(31 downto 0);
signal reg42            :std_logic_vector(31 downto 0);
signal reg43            :std_logic_vector(31 downto 0);
signal reg44            :std_logic_vector(31 downto 0);
signal reg45            :std_logic_vector(31 downto 0);
signal reg46            :std_logic_vector(31 downto 0);
signal reg47            :std_logic_vector(31 downto 0);
signal reg48            :std_logic_vector(31 downto 0);
signal reg49            :std_logic_vector(31 downto 0);

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

fe_num_out <= x"8";

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
  case addr_in is 

  when x"0004" =>  
    if rw = '1' then 
       data_out       <= reg1;
    elsif rw = '0' then
       reg1          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0004";
  
  when x"0008" =>  
    if rw = '1' then 
       data_out       <= reg2;
    elsif rw = '0' then
       reg2          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0008";
  
  when x"000c" =>  
    if rw = '1' then 
       data_out       <= reg3;
    elsif rw = '0' then
       reg3          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"000c";
  
  when x"0010" =>  
    if rw = '1' then 
       data_out       <= reg4;
    elsif rw = '0' then
       reg4          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0010";
  
  when x"0014" =>  
    if rw = '1' then 
       data_out       <= reg5;
    elsif rw = '0' then
       reg5          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0014";
  
  when x"0018" =>  
    if rw = '1' then 
       data_out       <= reg6;
    elsif rw = '0' then
       reg6          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0018";
  
  when x"001c" =>  
    if rw = '1' then 
       data_out       <= reg7;
    elsif rw = '0' then
       reg7          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"001c";
  
  when x"0020" =>  
    if rw = '1' then 
       data_out       <= reg8;
    elsif rw = '0' then
       reg8          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0020";
  
  when x"0024" =>  
    if rw = '1' then 
       data_out       <= reg9;
    elsif rw = '0' then
       reg9          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0024";
  
  when x"0028" =>  
    if rw = '1' then 
       data_out       <= reg10;
    elsif rw = '0' then
       reg10          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0028";
  
  when x"002c" =>  
    if rw = '1' then 
       data_out       <= reg11;
    elsif rw = '0' then
       reg11          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"002c";
  
  when x"0030" =>  
    if rw = '1' then 
       data_out       <= reg12;
    elsif rw = '0' then
       reg12          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0030";
  
  when x"0034" =>  
    if rw = '1' then 
       data_out       <= reg13;
    elsif rw = '0' then
       reg13          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0034";
  
  when x"0038" =>  
    if rw = '1' then 
       data_out       <= reg14;
    elsif rw = '0' then
       reg14          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0038";
  
  when x"003c" =>  
    if rw = '1' then 
       data_out       <= reg15;
    elsif rw = '0' then
       reg15          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"003c";
  
  when x"0040" =>  
    if rw = '1' then 
       data_out       <= reg16;
    elsif rw = '0' then
       reg16          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0040";
  
  when x"0044" =>  
    if rw = '1' then 
       data_out       <= reg17;
    elsif rw = '0' then
       reg17          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0044";
  
  when x"0048" =>  
    if rw = '1' then 
       data_out       <= reg18;
    elsif rw = '0' then
       reg18          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0048";
  
  when x"004c" =>  
    if rw = '1' then 
       data_out       <= reg19;
    elsif rw = '0' then
       reg19          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"004c";
  
  when x"0050" =>  
    if rw = '1' then 
       data_out       <= reg20;
    elsif rw = '0' then
       reg20          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0050";
  
  when x"0054" =>  
    if rw = '1' then 
       data_out       <= reg21;
    elsif rw = '0' then
       reg21          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0054";
  
  when x"0058" =>  
    if rw = '1' then 
       data_out       <= reg22;
    elsif rw = '0' then
       reg22          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0058";
  
  when x"005c" =>  
    if rw = '1' then 
       data_out       <= reg23;
    elsif rw = '0' then
       reg23          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"005c";
  
  when x"0060" =>  
    if rw = '1' then 
       data_out       <= reg24;
    elsif rw = '0' then
       reg24          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0060";
  
  when x"0064" =>  
    if rw = '1' then 
       data_out       <= reg25;
    elsif rw = '0' then
       reg25          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0064";
  
  when x"0068" =>  
    if rw = '1' then 
       data_out       <= reg26;
    elsif rw = '0' then
       reg26          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0068";
  
  when x"006c" =>  
    if rw = '1' then 
       data_out       <= reg27;
    elsif rw = '0' then
       reg27          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"006c";
  
  when x"0070" =>  
    if rw = '1' then 
       data_out       <= reg28;
    elsif rw = '0' then
       reg28          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0070";
  
  when x"0074" =>  
    if rw = '1' then 
       data_out       <= reg29;
    elsif rw = '0' then
       reg29          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0074";
  
  when x"0078" =>  
    if rw = '1' then 
       data_out       <= reg30;
    elsif rw = '0' then
       reg30          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0078";
  
  when x"007c" =>  
    if rw = '1' then 
       data_out       <= reg31;
    elsif rw = '0' then
       reg31          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"007c";
  
  when x"0080" =>  
    if rw = '1' then 
       data_out       <= reg32;
    elsif rw = '0' then
       reg32          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0080";
  
  when x"0084" =>  
    if rw = '1' then 
       data_out       <= reg33;
    elsif rw = '0' then
       reg33          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0084";
  
  when x"0088" =>  
    if rw = '1' then 
       data_out       <= reg34;
    elsif rw = '0' then
       reg34          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0088";
  
  when x"008c" =>  
    if rw = '1' then 
       data_out       <= reg35;
    elsif rw = '0' then
       reg35          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"008c";
  
  when x"0090" =>  
    if rw = '1' then 
       data_out       <= reg36;
    elsif rw = '0' then
       reg36          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0090";
  
  when x"0094" =>  
    if rw = '1' then 
       data_out       <= reg37;
    elsif rw = '0' then
       reg37          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0094";
  
  when x"0098" =>  
    if rw = '1' then 
       data_out       <= reg38;
    elsif rw = '0' then
       reg38          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"0098";
  
  when x"009c" =>  
    if rw = '1' then 
       data_out       <= reg39;
    elsif rw = '0' then
       reg39          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"009c";
  
  when x"00a0" =>  
    if rw = '1' then 
       data_out       <= reg40;
    elsif rw = '0' then
       reg40          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a0";
  
  when x"00a4" =>  
    if rw = '1' then 
       data_out       <= reg41;
    elsif rw = '0' then
       reg41          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a4";
  
  when x"00a8" =>  
    if rw = '1' then 
       data_out       <= reg42;
    elsif rw = '0' then
       reg42          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00a8";
  
  when x"00ac" =>  
    if rw = '1' then 
       data_out       <= reg43;
    elsif rw = '0' then
       reg43          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00ac";
  
  when x"00b0" =>  
    if rw = '1' then 
       data_out       <= reg44;
    elsif rw = '0' then
       reg44          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00b0";
  
  when x"00b4" =>  
    if rw = '1' then 
       data_out       <= reg45;
    elsif rw = '0' then
       reg45          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00b4";
  
  when x"00b8" =>  
    if rw = '1' then 
       data_out       <= reg46;
    elsif rw = '0' then
       reg46          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00b8";
  
  when x"00bc" =>  
    if rw = '1' then 
       data_out       <= reg47;
    elsif rw = '0' then
       reg47          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00bc";
  
  when x"00c0" =>  
    if rw = '1' then 
       data_out       <= reg48;
    elsif rw = '0' then
       reg48          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00c0";
  
  when x"00c4" =>  
    if rw = '1' then 
       data_out       <= reg49;
    elsif rw = '0' then
       reg49          <= data_in;
       data_out       <= data_in;
    end if;
    data_valid_out <= '1';
    addr_out <= x"00c4";
  
      
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
