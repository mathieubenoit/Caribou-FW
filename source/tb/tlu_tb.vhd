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

entity tlu_tb is
end tlu_tb;

architecture Behavioral of tlu_tb is

signal sysclk               :std_logic;
signal clk160m              :std_logic;
signal clk40m               :std_logic;

signal rst                  :std_logic;
signal tlu_master_output_en :std_logic;

signal tlu_tri_clk          :std_logic;
signal tlu_busy             :std_logic;
signal tlu_reset            :std_logic;
signal tlu_trigger          :std_logic;

signal fei4_cmd_out         :std_logic;

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
tlu_master_output_en <= '0', '1' after 50 us;

tlu_master:entity work.tlu_master_core
Generic map(
    sys_clk_freq => 100_000_000, --input clock speed from user logic in Hz
    trig_rate    => 500_000
) 
Port map(
    RST           => rst,
    SYSCLK        => sysclk,
    
    OUT_EN        => tlu_master_output_en,
    
    -- TLU signals
    TRIGGER_CLK_I => tlu_tri_clk,
    BUSY_I        => tlu_busy,
    RESET_O       => tlu_reset,
    TRIGGER_O     => tlu_trigger
);

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
    
    CAL_CNT_DELAY   => (others => '0'),
    
    CFG_FLG         => '0',    
    CFG_REG         => (others => '0'),
    WR_REG_DAT      => (others => '0'),
                
    CMD_OUT         => fei4_cmd_out,
    
    EXT_TRI         => tlu_trigger,
    BUSY            => tlu_busy  
);



end Behavioral;
