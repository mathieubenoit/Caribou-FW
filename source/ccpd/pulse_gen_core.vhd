----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin
-- 
-- Create Date: 10/04/2015 05:07:38 PM
-- Design Name: CaRIBOU 
-- Module Name: pule_gen - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Minimum Width of high/low status is 2 system clock cycle.
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_gen_core is
GENERIC(
  input_clk : INTEGER := 100_000_000 --input clock speed from user logic in Hz
  );   
PORT(
  clk           : IN     STD_LOGIC;                    --system clock
  reset         : IN     STD_LOGIC;
  
  start_flg     : IN     STD_LOGIC;
  
  pulse_counter : IN     STD_LOGIC_VECTOR(15 DOWNTO 0);
  time_high_cnt : IN     STD_LOGIC_VECTOR(31 DOWNTO 0);
  time_low_cnt  : IN     STD_LOGIC_VECTOR(31 DOWNTO 0);
  trig_dly_cnt  : IN     STD_LOGIC_VECTOR(4  DOWNTO 0);
    
  pulse_out     : OUT    STD_LOGIC;
  trigger_out   : OUT    STD_LOGIC
);     
end pulse_gen_core;

architecture Behavioral of pulse_gen_core is

signal start_flg_prev    :std_logic;
signal delay_cnt         :integer := 0;
signal cnt               :integer := 0;
signal const_high        :integer := 0;
signal const_low         :integer := 0;
signal pulse_cnt         :integer := 0;
signal tri_dly_cnt       :integer := 0;
signal pulse_out_i       :std_logic;
signal trigger_cnt       :integer := 0;
signal trigger_out_i     :std_logic;

TYPE machine IS(idle, ready, high, low, delay, finish); --needed states
SIGNAL state : machine;                        --state machine
SIGNAL next_state : machine;

begin


process(clk,reset)
begin
if reset = '1' then
    pulse_out_i <= '0';
    state <= idle;
    start_flg_prev <= '0';
    delay_cnt <= 0;
    cnt <= 0;
    trigger_cnt <= 0;
    trigger_out_i <= '0';
    
elsif rising_edge(clk) then

    start_flg_prev <= start_flg; 
      
    case state is
    
    when idle =>  
        trigger_out_i <= '0';
        pulse_out_i <= '0'; 
        if start_flg_prev = '0' and start_flg = '1' then
            state <= ready;
            const_high <= conv_integer(time_high_cnt(31 downto 0));
            const_low  <= conv_integer(time_low_cnt(31 downto 0));
            pulse_cnt  <= conv_integer(pulse_counter(15 downto 0));
            tri_dly_cnt <= conv_integer(trig_dly_cnt(4 downto 0));
            cnt <= 0;
            delay_cnt <= 0;
            trigger_cnt <= 0;
        end if;
        
    when ready =>
        if pulse_cnt = 0 then
          state <= finish;
        else
          state <= high;
        end if;
        
    when high =>
        pulse_out_i <= '1';
        delay_cnt <= const_high;
        state <= delay;
        next_state <= low;
    
    when low =>
        pulse_out_i <= '0';
        delay_cnt <= const_low;
        state <= delay;
        next_state <= high;
    
    when delay =>
        if cnt = tri_dly_cnt and next_state = high then
          trigger_out_i <= '1';
          cnt <= cnt +1;
        elsif cnt = tri_dly_cnt + 10 and next_state = high then
          trigger_out_i <= '0';
          cnt <= cnt +1;          
        elsif cnt = delay_cnt then
          cnt <= 0;
          if pulse_cnt = 0 then 
            pulse_out_i <= '0';         
            state <= finish;
          else 
            if next_state = high then
                pulse_cnt <= pulse_cnt - 1; 
            end if;
            state <= next_state;
          end if;
        else
          cnt <= cnt +1;
        end if;

    when finish =>
       pulse_out_i <= '0';
       state <= idle;
                              
    end case;
    
end if;
end process;

pulse_out <= pulse_out_i;
trigger_out <= trigger_out_i;

end Behavioral;
