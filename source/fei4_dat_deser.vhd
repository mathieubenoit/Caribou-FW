----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2015 02:26:56 PM
-- Design Name: 
-- Module Name: fei4_dat_deser - Behavioral
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

entity FEI4_DATA_DESER is
    Port ( 
    RESET     : in STD_LOGIC;
    
    DATA_IN : in std_logic;
    BIT_CLK : in STD_LOGIC;
    FRAME_CLK : in std_logic;
    
    FRAME_SYNC_EN : in std_logic;   
    FRAME_IS_SYNCED : out std_logic;
    DATA_OUT : out std_logic_vector(7 downto 0);
    DATA_ISK : out std_logic;
    DATA_IDLE: out std_logic;
    DATA_SOF : out std_logic;
    DATA_EOF : out std_logic    
    );
end FEI4_DATA_DESER;

architecture Behavioral of FEI4_DATA_DESER is

component dec_8b10b is	
    port(
		RESET : in std_logic ;	-- Global asynchronous reset (AH) 
		RBYTECLK : in std_logic ;	-- Master synchronous receive byte clock
		AI, BI, CI, DI, EI, II : in std_logic ;
		FI, GI, HI, JI : in std_logic ; -- Encoded input (LS..MS)		
		KO : out std_logic ;	-- Control (K) character indicator (AH)
		HO, GO, FO, EO, DO, CO, BO, AO : out std_logic 	-- Decoded out (MS..LS)
	    );
end component;

--FEI4 DATA CLOCK AND FRAM CLOCK
signal data_clk:std_logic;
signal data_fclk :std_logic;

signal fei4_data_shift : std_logic_vector(9 downto 0);
signal fei4_data_shift_sel :std_logic;
signal fei4_data_byte_shift :std_logic_vector(9 downto 0);
--Data before decode
signal fei4_data_byte :std_logic_vector(9 downto 0);
--SOF,EOF,IDLE 
signal byte_sof : std_logic;
signal byte_eof : std_logic;
signal byte_idle : std_logic;
signal byte_idle_s :std_logic;
--RAW DATA IDLE STATUS
signal idle : std_logic;

--Decoded data
signal fei4_data : std_logic_vector(7 downto 0);
--RX DATA is K Code
signal fei4_data_isk :std_logic;
--RX DATA Frame is synced
signal fram_is_synced :std_logic;

signal data_pos_sel_cnt :integer range 0 to 15:= 0;
signal delay_cnt :integer range 0 to 15:= 0;

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of byte_idle_s,fei4_data,fei4_data_isk,fei4_data_byte,byte_sof,byte_eof,byte_idle,idle,fram_is_synced,data_pos_sel_cnt : signal is "TRUE";

constant GND :std_logic:='0';
constant VCC :std_logic:='1';

type state_type is (START, FRAM_SYNC, DELAY, FINISH);
signal rx_state : state_type := START ;


begin
         
data_clk <= BIT_CLK;
data_fclk <= FRAME_CLK;


--RX DATA shift and raw data idle status detect
raw_data_shift:process(data_clk)
begin 
  if rising_edge(data_clk) then 
    fei4_data_shift <= fei4_data_shift(8 downto 0) & DATA_IN;   
    fei4_data_shift_sel <= fei4_data_shift(data_pos_sel_cnt);
    fei4_data_byte_shift <= fei4_data_byte_shift(8 downto 0) & fei4_data_shift_sel;
    if fei4_data_shift = "0011111001" or fei4_data_shift = "1100000110" then
      idle <= '1';
    else
      idle <= '0';
    end if;        
  end if;
end process;

-- IDLE, START OF FRAME, END OF FRAME DETECTION
comma_det:process(data_fclk)
begin
    if rising_edge(data_fclk) then   
      fei4_data_byte <= fei4_data_byte_shift;
      byte_idle_s <= byte_idle;
      if fei4_data_byte = "0011111001" or fei4_data_byte = "1100000110" then
         byte_idle <= '1';
      else 
         byte_idle <= '0';
      end if;
      if fei4_data_byte = "0011111000" or fei4_data_byte = "1100000111" then
         byte_sof <= '1';
       else 
         byte_sof <= '0';
      end if;
      if fei4_data_byte = "0011111010" or fei4_data_byte = "1100000101" then
         byte_eof <= '1';
      else 
         byte_eof <= '0';
      end if;
    end if;
end process;

--RX DATA SYNC
--Start after the rising edge of FRAM_DET_EN
--Can only work at FEI4 IDLE status 
data_sync:process(RESET, data_fclk)
begin
  if(RESET = '1') then
  
    rx_state <= START;
    fram_is_synced <= '0';
    data_pos_sel_cnt <= 0;
    delay_cnt<= 0;
    
  elsif rising_edge(data_fclk) then
  
    case rx_state is 
    
    when START =>
      delay_cnt <= 0;
      data_pos_sel_cnt <= 0;
      if FRAME_SYNC_EN = '1' then 
        rx_state <= FRAM_SYNC;
      end if;  
           
    WHEN FRAM_SYNC =>
      if byte_idle = '1' and byte_idle_s = '1' then
         fram_is_synced <= '1';
         rx_state <= FINISH;
      else
         data_pos_sel_cnt <= data_pos_sel_cnt + 1; 
         rx_state <= DELAY;
      end if;
    
    WHEN DELAY =>
      if delay_cnt = 15 then
        rx_state <= FRAM_SYNC;
        delay_cnt <= 0;
      else
        delay_cnt <= delay_cnt +1;
      end if;
      
    when FINISH =>
      if FRAME_SYNC_EN = '0' then 
            rx_state <= START;
      end if;
    
     end case;
  end if;
end process;

--8B/10B Decode
data_decode:dec_8b10b	
    port map
    (
		RESET => RESET,
		RBYTECLK => data_fclk,
		AI => fei4_data_byte(9),
		BI => fei4_data_byte(8),
		CI => fei4_data_byte(7), 
		DI => fei4_data_byte(6), 
		EI => fei4_data_byte(5), 
		II => fei4_data_byte(4),
		FI => fei4_data_byte(3), 
		GI => fei4_data_byte(2), 
		HI => fei4_data_byte(1), 
		JI => fei4_data_byte(0), 
		KO => fei4_data_isk,
		HO => fei4_data(7),
		GO => fei4_data(6), 
		FO => fei4_data(5), 
		EO => fei4_data(4), 
		DO => fei4_data(3), 
		CO => fei4_data(2), 
		BO => fei4_data(1), 
		AO => fei4_data(0)
);

data_out_sync:process(data_fclk)
begin
if rising_edge(data_fclk) then

  DATA_OUT <= fei4_data;
  DATA_ISK <= fei4_data_isk;
end if;
end process;

FRAME_IS_SYNCED <= fram_is_synced;
DATA_IDLE <= byte_idle;
DATA_SOF  <= byte_sof;
DATA_EOF  <= byte_eof;
    		
end Behavioral;