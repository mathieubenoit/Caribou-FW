----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin                
-- 
-- Create Date: 10/21/2015 02:13:43 PM
-- Design Name: 
-- Module Name: tlu_master - Behavioral
-- Project Name: CaRIBOU firmware
-- Target Devices: 
-- Tool Versions: 
-- Description: Simulate a simple TLU device to send out trigger to the DUTs
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tlu_master_core is
    Generic(
    sys_clk_freq : INTEGER := 100_000_000; --input clock speed from user logic in Hz
    trig_rate    : INTEGER := 100_000
    );   
    Port (
    RST           :in std_logic;
    SYSCLK        :in std_logic;
    
    OUT_EN        :in std_logic;
    
    -- TLU signals
    TRIGGER_CLK_I :in std_logic;
    BUSY_I        :in std_logic;
    RESET_O       :out std_logic;
    TRIGGER_O     :out std_logic
    );
end tlu_master_core;

architecture Behavioral of tlu_master_core is

constant divider    :  integer := (sys_clk_freq/trig_rate)/2;

signal tri_clk      :std_logic;
signal tri_clk_prev :std_logic;

signal trigger_i    :std_logic;
signal busy_pre     :std_logic;

signal wait_cnt     :integer:= 0;

TYPE machine IS(idle, trigger); --needed states
signal state :machine;

begin

tri_clk_gen:process(SYSCLK, RST)
  variable count  :  integer range 0 to divider*2;  --timing for clock generation
begin
  if(RST = '1') then                --reset asserted
    count := 0;
    tri_clk <= '0';   
  elsif rising_edge(SYSCLK) then
    tri_clk_prev <= tri_clk;            --store previous value of data clock
    if(count = divider*2-1) then        --end of timing cycle
      count := 0;                       --reset timer
    else                                
      count := count + 1;               --continue clock generation timing
    end if;
    
    case count is
      when 0 TO divider-1 =>            --first 1/2 cycle of clocking
        tri_clk <= '0';
      when divider TO divider*2-1 =>    --second 1/2 cycle of clocking
        tri_clk <= '1';       
      when others =>                    
        null;
    end case;
  end if;
end process;

trigger_fsm:process(SYSCLK, RST)
begin
if RST = '1' then
  trigger_i <= '0';
  wait_cnt <= 0;
  busy_pre <= '0';
elsif rising_edge(SYSCLK) then

  busy_pre <= BUSY_I;
  case state is
   
  when idle =>
    wait_cnt <= 0;
    trigger_i <= '0';
    if tri_clk = '1' and tri_clk_prev = '0' and OUT_EN = '1' then
      state <= trigger;
      trigger_i <= '1';
    end if;
    
  when trigger =>
    if BUSY_I = '1' and busy_pre = '0' then
      state <= idle;
      wait_cnt <= 0;
    -- If can't receive response from DUT, de-assert the trigger
    elsif wait_cnt = divider then 
      state <= idle;     
    else
      wait_cnt <= wait_cnt + 1;
    end if;   
  end case;
  
end if;
end process;

TRIGGER_O <= trigger_i;
    
end Behavioral;
