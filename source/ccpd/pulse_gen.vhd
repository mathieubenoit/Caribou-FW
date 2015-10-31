----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2015 10:14:26 AM
-- Design Name: 
-- Module Name: pulse_gen_tb - Behavioral
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

entity pulse_gen is
  GENERIC (
  input_clk_freq : integer:= 100_000_000
  );   
  port ( 
  RST    : in std_logic;
  SYSCLK : in std_logic;
  
  INJ_FLG      :in std_logic;
  INJ_PLS_CNT  :in std_logic_vector(15 downto 0);
  INJ_HIGH_CNT :in std_logic_vector(31 downto 0);
  INJ_LOW_CNT  :in std_logic_vector(31 downto 0);
  INJ_OUT_EN   :in std_logic_vector(3  downto 0);
  TRI_DLY_CNT  :in std_logic_vector(4 downto 0);
  
  TRIGGER_OUT : out std_logic;
  
  --pulse output
  pulse_out1          : out std_logic; 
  pulse_out2          : out std_logic; 
  pulse_out3          : out std_logic; 
  pulse_out4          : out std_logic
  );        
end pulse_gen;

architecture Behavioral of pulse_gen is

signal pulse_out :STD_LOGIC;

begin

pulse_generator: entity work.pulse_gen_core
GENERIC MAP(
  input_clk => input_clk_freq
  ) 
PORT MAP(
  clk            => sysclk,
  reset          => rst,
  
  start_flg      => INJ_FLG,
  
  pulse_counter  => INJ_PLS_CNT,
  time_high_cnt  => INJ_HIGH_CNT,
  time_low_cnt   => INJ_LOW_CNT,
  trig_dly_cnt    => TRI_DLY_CNT,
    
  pulse_out      => pulse_out
);     

pulse_out1 <= pulse_out and INJ_OUT_EN(0);
pulse_out2 <= pulse_out and INJ_OUT_EN(1);
pulse_out3 <= pulse_out and INJ_OUT_EN(2);
pulse_out4 <= pulse_out and INJ_OUT_EN(3);

TRIGGER_OUT <= pulse_out;

end Behavioral;
