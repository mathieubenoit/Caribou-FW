----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin Liu hliu2@bnl.gov
-- 
-- Create Date: 08/17/2015 03:36:34 PM
-- Design Name: 
-- Module Name: fei4_data_extract - Behavioral
-- Project Name: CaRIBOU Firmware
-- Target Devices: None
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: None
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

entity fei4_data_extract is
    Port ( 
    RESET           : in STD_LOGIC;  
      
    FRAME_CLK       : in std_logic;  -- Frame clock, 16 MHz
    FE_FR_RD_EN     : in std_logic;  -- Read Front end shift register indicator
    FRAME_IS_SYNCED : in std_logic;  -- Frame is synced indicator 
    DATA_IN         : in std_logic_vector(7 downto 0); -- Deserilized data input
    
    IS_PIX_DAT      : out std_logic; -- indicate current data is pixel/SR data 
    -- Bit[15] of REG_ADDR_OUT is the address type 
    REG_ADDR_OUT    : out std_logic_vector(15 downto 0);
    REG_VALUE_OUT   : out std_logic_vector(15 downto 0);
    
    SER_DAT_OUT     : out std_logic_vector(15 downto 0);
    
    ERROR_FLG       : out std_logic;
    ERROR_COD       : out std_logic_vector(3 downto 0);
    STATE_OUT       : out std_logic_vector(3 downto 0)
    );
end fei4_data_extract;

architecture Behavioral of fei4_data_extract is

signal fclk           :std_logic;
signal reg_value      :std_logic_vector(15 downto 0);
signal reg_addr       :std_logic_vector(15 downto 0);
signal service_dat    :std_logic_vector(15 downto 0);

signal ar_cnt         :integer range 0 to 7 := 0; -- address record counter
signal vr_cnt         :integer range 0 to 7 := 0; -- value recorde counter
signal sr_cnt         :integer range 0 to 7 := 0; -- value recorde counter

type   state_type is (START, IDLE, SOF, EOF, AR, VR, DAT,SR, FINISH);
signal state          : state_type := START ;

signal is_pixel_data  :std_logic;  -- current data is pixel data

signal extrac_error   :std_logic;



attribute MARK_DEBUG : string;
attribute MARK_DEBUG of state,reg_value,reg_addr : signal is "TRUE";

begin

fclk <= FRAME_CLK;

-- Data extraction finite state machine 
data_ext_fsm:process(RESET, fclk) 
begin

if (RESET = '1') then 
   state <= START;
   reg_value <= (others => '0');
   reg_addr <= (others => '0');     
   ar_cnt <= 0;
   vr_cnt <= 0;  
   sr_cnt    <= 0;  
   STATE_OUT <= x"1";
   ERROR_FLG <= '0'; 
     
elsif rising_edge(fclk) then
   
   case(state) is
   
    
     when START =>
       STATE_OUT <= x"1";
       if FRAME_IS_SYNCED = '1' then
         state     <= IDLE;
         reg_value <= (others => '0');
         reg_addr  <= (others => '0');     
         ar_cnt    <= 0;
         vr_cnt    <= 0; 
         sr_cnt    <= 0; 
         is_pixel_data <= '0';       
       end if;
   
     when IDLE =>   
       STATE_OUT <= x"2";
       is_pixel_data <= '0';
       if FRAME_IS_SYNCED = '0' then -- lost synchronization, move to start state
         state <= START;
       elsif DATA_IN = x"FC" then    -- x"FC" indicates the start of an frame
         state <= SOF;
       end if;
     
     when SOF =>
       STATE_OUT <= x"3";      
       if DATA_IN = x"EA" then       -- x"EA" is the start of the address record
         if FE_FR_RD_EN = '1' then
           -- Write the contents from front end shift register to FIFO
           state <= DAT;
           is_pixel_data <= '1';
         else
           state <= AR;
           ar_cnt <= 0;         
         end if;     
       elsif DATA_IN = x"EC" then    -- x"EC" is the start of the value record
         state <= VR;
         vr_cnt <= 0;
      
       elsif DATA_IN = x"EF" then
         state <= SR;
         sr_cnt <= 0;
         
       elsif DATA_IN = x"E9" then    -- x"E9" is the start of the pixle data header
         state <= DAT;
         is_pixel_data <= '1';
                    
       else
         state <= start;
         ERROR_FLG <= '1';     
           
       end if;
     
     when AR =>
       STATE_OUT <= x"4";         
       if DATA_IN = x"EC" and ar_cnt = 2 then       -- x"EC" is the start of the value record
         state  <= VR;
         vr_cnt <= 0;
       elsif ar_cnt = 0 then        
         reg_addr(15 downto 8) <= DATA_IN;   -- ar_cnt = 0, read 8 MSB of the reg address
         ar_cnt <= ar_cnt + 1;
       elsif ar_cnt = 1 then  
         reg_addr(7 downto 0)  <= DATA_IN;   -- ar_cnt = 1, read 8 LSB of the reg address
         ar_cnt <= ar_cnt + 1;               
       else
         state <= idle;
         ERROR_FLG <= '1';                
       end if;
       
     when VR =>   
       STATE_OUT <= x"5";  
       if DATA_IN = x"BC" and vr_cnt = 0 then          
         state <= EOF;
         vr_cnt <= 0;
       elsif vr_cnt = 0 then         -- vr_cnt = 0, read 8 MSB of the reg value
         reg_value(15 downto 8)<= DATA_IN;
         vr_cnt <= vr_cnt + 1;
       elsif vr_cnt = 1 then         -- vr_cnt = 1, read 8 LSB of the reg value 
         reg_value(7 downto 0) <= DATA_IN;
         vr_cnt <= vr_cnt + 1; 
       else
         state <= idle;
         ERROR_FLG <= '1';        
       end if;
               
     when SR =>
       STATE_OUT <= x"6";  
       if DATA_IN = x"BC" and sr_cnt = 0 then          
         state <= EOF;
         sr_cnt <= 0;
       elsif vr_cnt = 0 then         -- vr_cnt = 0, read 8 MSB of the reg value
         service_dat(15 downto 8)<= DATA_IN;
         sr_cnt <= sr_cnt + 1;
       elsif vr_cnt = 1 then         -- vr_cnt = 1, read 8 LSB of the reg value 
         service_dat(7 downto 0) <= DATA_IN;
         sr_cnt <= sr_cnt + 1; 
       else
         state <= idle;
         ERROR_FLG <= '1';        
       end if;
       
      when DAT =>
         STATE_OUT <= x"7";  
         if DATA_IN = x"BC" then       -- de-assert the pixle data flg at EOF                   
           state <= EOF;
           is_pixel_data <= '0'; 
         else
           is_pixel_data <= '1';   
         end if;      
       
     when EOF => 
       STATE_OUT <= x"8";                      
       if DATA_IN = x"FC" then          -- if next frame is following, move to SOF
         state <= SOF;
       elsif DATA_IN = x"3C" then
         state <= IDLE;
       else
         ERROR_FLG <= '1';  
         state <= idle;
       end if;
     
     when FINISH =>
       STATE_OUT <= x"9";      
       if FRAME_IS_SYNCED = '0' then
         state <= START;
       end if;
       
     when others =>
          null;
     
   end case;
   
end if;

end process; 
 
REG_VALUE_OUT <= reg_value;
REG_ADDR_OUT  <= reg_addr;
IS_PIX_DAT    <= is_pixel_data;

end Behavioral;
