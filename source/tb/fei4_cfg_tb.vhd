----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2015 02:26:47 PM
-- Design Name: 
-- Module Name: tlu_tb - Behavioral
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

entity fei4_cfg_tb is
end fei4_cfg_tb;

architecture Behavioral of fei4_cfg_tb is

signal sysclk               :std_logic;
signal clk160m              :std_logic;
signal clk40m               :std_logic;

signal rst                  :std_logic;

signal fei4_cmd_out         :std_logic;

signal cmd_flg              :std_logic;
signal cfg_reg              :std_logic_vector(31 downto 0);
signal cal_cnt_delay        :std_logic_vector(31 downto 0);

begin

clk160_gen:process
   begin
        clk160m <= '0';
        wait for 3.125 ns;  
        clk160m <= '1';
        wait for 3.125 ns;  
end process;

clk100_gen:process
   begin
        sysclk <= '0';
        wait for 5 ns;  
        sysclk <= '1';
        wait for 5 ns;  
end process;

clk40_gen:process
   begin
        clk40m <= '0';
        wait for 12.5 ns;  
        clk40m <= '1';
        wait for 12.5 ns;  
end process;


rst <= '0', '1' after 50 ns, '0' after 100 ns;
cmd_flg <= '0', '1' after 50 us, '0' after 100 us;
-- delay = 43
cfg_reg(30 downto 23) <= x"2B";
-- CAL fied 1 and 2
cfg_reg(22 downto 18) <= "10110";
cfg_reg(17 downto 14) <= "0100";

cal_cnt_delay(31 downto 16) <= x"A028"; --4100
cal_cnt_delay(15 downto 0) <= x"000f";


fei4_a1_cfg:entity work.FEI4B_CFG
Port map(     
    RST             => rst,
    
    CLK160          => clk160m,
    CMD_OUT_PH_SEL  =>   "00",
    
    CMD_CLK         => clk40m,
    FR_CFG_CLK      => sysclk,
    FR_RAM_ADDR     => (others => '0'),
    FR_RAM_DAT_IN   => (others => '0'),
    FR_RAM_DAT_OUT  => open,
    
    CAL_CNT_DELAY   => cal_cnt_delay,
    
    CFG_FLG         => cmd_flg,    
    CFG_REG         => cfg_reg,
    WR_REG_DAT      => (others => '0'),
                
    CMD_OUT         => fei4_cmd_out,
    
    EXT_TRI         => '0',
    BUSY            => open  
);



end Behavioral;
