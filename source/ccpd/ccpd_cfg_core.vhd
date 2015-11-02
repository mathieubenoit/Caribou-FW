----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin Liu
-- 
-- Create Date: 10/05/2015 03:47:59 PM
-- Design Name: CaRIBOU
-- Module Name: ccpd_cfg_core - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ccpd_cfg_core is
    generic(
    input_clk_fre  : INTEGER := 100_000_000; --input clock speed from user logic in Hz
    cfg_clk_freq   : INTEGER := 50_000_000);   --speed the i2c bus (scl) will run at in Hz
    Port (
    clk             :in std_logic;
    rst             :in std_logic;
    
    start_flg       :in std_logic;
    reg_limit       :in std_logic_vector(4 downto 0);
    shift_limit     :in std_logic_vector(4 downto 0);
    clock_enable    :in std_logic_vector(1 downto 0);
        
    ram_addr        :in std_logic_vector(3 downto 0);
    ram_wr_dat      :in std_logic_vector(31 downto 0);
    ram_rd_dat      :out std_logic_vector(31 downto 0);
    ram_wr_en       :in std_logic;
    ram_wr_clk      :in std_logic;
            
    Sin             :out std_logic;
    CkC             :out std_logic;
    CkD             :out std_logic;
    Ld              :out std_logic
     );
end ccpd_cfg_core;

architecture Behavioral of ccpd_cfg_core is

constant divider  :  integer := (input_clk_fre/cfg_clk_freq)/2;
type ram_type is array(0 to 15) of std_logic_vector(31 downto 0);
signal DAT_RAM :ram_type := --(others => (others => '0'));
(
X"a1234565",X"a789abc6",X"adef0135",X"a3456785",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"00000000",X"00000000",
X"00000000",X"00000000",X"0fedcba9",X"87654321");


signal start_flg_prev :std_logic;
signal shift_cnt :integer range 0 to 31 := 0;
signal reg_cnt   :integer range 0 to 31 := 0;
signal shift_out_reg :std_logic_vector(31 downto 0);

signal reg_cnt_limit :integer range 0 to 31 := 0;
signal shift_cnt_limit:integer range 0 to 31 := 0;

TYPE machine IS(idle, start, shift1, shift2, load, finish); --needed states
signal state :machine;

signal cfg_clk :std_logic;
signal cfg_clk_prev :std_logic;

signal cfg_clk_en :std_logic;

signal sin_i :std_logic;
signal ckc_i :std_logic;
signal ckd_i :std_logic;
signal ld_i  :std_logic;

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of state : signal is "TRUE";

begin

data_ram:process(ram_wr_clk)
begin
  if rising_edge(ram_wr_clk) then
    if ram_wr_en = '1' then
      DAT_RAM(conv_integer(ram_addr)) <= ram_wr_dat;
    end if;
    ram_rd_dat <= DAT_RAM(conv_integer(ram_addr));
  end if;
end process;
  --generate the timing for the bus clock (scl_clk) and the data clock (data_clk)
cfg_clk_gen:process(clk, rst)
  variable count  :  integer range 0 to divider*2;  --timing for clock generation
begin
  if(rst = '1') then                --reset asserted
    count := 0;
    cfg_clk <= '0';
  elsif rising_edge(clk) then
    cfg_clk_prev <= cfg_clk;            --store previous value of data clock
    if(count = divider*2-1) then        --end of timing cycle
      count := 0;                       --reset timer
    else                                
      count := count + 1;               --continue clock generation timing
    end if;
    
    case count is
      when 0 TO divider-1 =>            --first 1/2 cycle of clocking
        cfg_clk <= '0';
      when divider TO divider*2-1 =>    --second 1/2 cycle of clocking
        cfg_clk <= '1';       
      when others =>                    
        null;
    end case;
  end if;
end process;

shift_fsm:process(clk, rst)
begin
  if rst = '1' then
    shift_cnt <= 0;
    shift_cnt <= 0;
    reg_cnt <= 0;
    shift_out_reg <= (others => '0');
    sin_i <= '0';
    ld_i  <= '0';
    cfg_clk_en <= '0';
    
  elsif rising_edge(clk) then
  if cfg_clk = '1' and cfg_clk_prev = '0' then
      start_flg_prev <= start_flg;
      case state is     
      when idle =>
        ld_i <= '0';
        if start_flg_prev = '0' and start_flg = '1' then
          state <= start;
          shift_cnt_limit <= conv_integer(shift_limit);
          reg_cnt_limit <= conv_integer(reg_limit);         
        end if;
        
      when start =>
        cfg_clk_en <= '1';
        if reg_cnt_limit = 0 then
            shift_out_reg <= DAT_RAM(0);
            sin_i <= DAT_RAM(0)(0);
            state <= shift2;
        else
            shift_out_reg <= DAT_RAM(0);
            sin_i <= DAT_RAM(0)(0);
            state <= shift1;
        end if;
      
      when shift1 =>

      if shift_cnt = 31 then
        if reg_cnt = reg_cnt_limit - 1 then
          if shift_cnt_limit = 0 then
            state <= load;
            sin_i <= '0';
            cfg_clk_en <= '0';
          else
            state <= shift2;
            shift_cnt <= 0;
            sin_i <= DAT_RAM(reg_cnt_limit)(0);
            shift_out_reg <= DAT_RAM(reg_cnt_limit);
          end if; 
        else 
          reg_cnt <= reg_cnt + 1;
          sin_i <= DAT_RAM(reg_cnt+1)(0);
          shift_cnt <= 0;
          shift_out_reg <= DAT_RAM(reg_cnt+1);
        end if;
      else
        sin_i <= shift_out_reg(shift_cnt+1);
        shift_cnt <= shift_cnt +1;
      end if;      
      
      when shift2 =>
        if shift_cnt = shift_cnt_limit - 1 then
           state <= load;
           sin_i <= '0';
           cfg_clk_en <= '0';
        else
           shift_cnt <= shift_cnt +1;
           sin_i <= shift_out_reg(shift_cnt+1);
        end if;
      
      when load =>
        ld_i    <= '1';
        state <= finish;
        
      when finish =>
        ld_i    <= '0';
        state <= idle;
            
      when others =>  
       null;
      
      end case;
  end if;
  end if;
end process;

ckc_i <= not cfg_clk_prev when (cfg_clk_en = '1' and clock_enable(0) = '1') else '0';
ckd_i <= not cfg_clk_prev when (cfg_clk_en = '1' and clock_enable(1) = '1') else '0';

Sin <= sin_i;
CkC <= ckc_i;
CkD <= ckd_i;
Ld  <= ld_i;
--process(clk, rst)
--begin
--    if rst = '1' then
--        CkC <= '0';
--        CkD <= '0';
--    elsif rising_edge(clk) then
--        CkC <= ckc_i;
--        CkD <= ckd_i;
--    end if;
--end process;

end Behavioral;
