----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Hongbin
-- 
-- Create Date: 03/29/2014 10:40:03 AM
-- Design Name: 
-- Module Name: frequency_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_counter is
  Generic(
          SYS_CLOCK_PERIOD : integer range 4 to 250 := 10 
         );
    Port ( CLOCK_PROBE : in STD_LOGIC;
           SYSCLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           FREQUENCY : out STD_LOGIC_VECTOR ( 19 downto 0)
           );
end frequency_counter;

architecture Behavioral of frequency_counter is

constant WAIT_TIMEOUT_1ms     : integer := 1000000 / SYS_CLOCK_PERIOD;--  1 ms time-out
signal time_out_counter       : integer range 0 to WAIT_TIMEOUT_1ms := 0;
signal time_out_1ms           : std_logic := '0';--\Flags that the various time-out points

constant FREQUENCY_COUNTER_MAX: integer := 2**20-1;--20bit counter
signal frequency_counter      : integer range 0 to FREQUENCY_COUNTER_MAX :=0;

  
begin

  timeout_1ms:process(SYSCLK)
  begin
    if rising_edge(SYSCLK) then
        if time_out_counter = WAIT_TIMEOUT_1ms then
          time_out_1ms <= '1';                         -- 1ms timeout,then assert the time_out_1ms signal and
          time_out_counter <= 0 ;                      -- output the frequency_counter to FREQUENCY port.
          FREQUENCY <= STD_LOGIC_VECTOR(TO_UNSIGNED(frequency_counter,20));
        else
          time_out_counter <= time_out_counter + 1;
          time_out_1ms <= '0';
        end if;
    end if;
  end process;
  
  process(CLOCK_PROBE,time_out_1ms)
  begin
    if time_out_1ms = '1'  then      
        frequency_counter <= 0 ;
    else     
       if rising_edge(CLOCK_PROBE) then      
        frequency_counter <= frequency_counter + 1;
       end if;
 
    end if;
    
  end process;
  

end Behavioral;

----------------------------------Component Declaration Templates-----------------------
--component frequency_counter 
--  Generic(
--          SYS_CLOCK_PERIOD : integer range 4 to 250 := 10 
--         );
--    Port ( CLOCK_PROBE : in STD_LOGIC;
--           SYSCLK : in STD_LOGIC;
--           RESET : in STD_LOGIC;
--           FREQUENCY : out STD_LOGIC_VECTOR ( 19 downto 0)
--           );
--end component;

----------------------------------Component Instantiation Templates-----------------------
--gt0_qplloutclk_counter:frequency_counter 
--       generic map
--       (
--         SYS_CLOCK_PERIOD => 10 
--       )
--       port map 
--       ( 
--         CLOCK_PROBE => gt0_qplloutclk_out,
--         SYSCLK      => clk100,
--         RESET       => tied_to_ground_i,
--         FREQUENCY   => gt0_qplloutclk_freq
--        );   