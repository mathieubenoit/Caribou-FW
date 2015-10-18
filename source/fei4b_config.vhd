----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2015 10:30:31 AM
-- Design Name: 
-- Module Name: fei4b_config - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fei4b_cfg is
    Port ( 
    RST : in std_logic;
    
    CLK160 : in std_logic;
    CMD_OUT_PH_SEL : in std_logic_vector(1 downto 0);
    --FR_RAM_ADDR, Bit5 is write enable, bit[4:0] is address;
    FR_CFG_CLK : in std_logic;
    FR_RAM_ADDR : in std_logic_vector(5 downto 0);
    FR_RAM_DAT_IN : in std_logic_vector(31 downto 0);
    FR_RAM_DAT_OUT : out std_logic_vector(31 downto 0);

    CMD_CLK : in std_logic;
    
    CFG_FLG : in std_logic;
    CFG_REG : in std_logic_vector(31 downto 0);
    WR_REG_DAT : in std_logic_vector(15 downto 0);
    
    CMD_OUT_P : out std_logic;
    CMD_OUT_N : out std_logic  
    );    
end fei4b_cfg;
architecture Behavioral of fei4b_cfg is

signal cmd_clk_r :std_logic;
signal shift_out_reg : std_logic_vector(22 downto 0);
signal shift_out_fr_reg : std_logic_vector(31 downto 0);
signal cmd_field_1 : std_logic_vector(4 downto 0);
signal cmd_field_2 : std_logic_vector(3 downto 0);
signal cmd_field_3 : std_logic_vector(3 downto 0);
signal cmd_field_4 : std_logic_vector(3 downto 0);
signal cmd_field_5 : std_logic_vector(5 downto 0);
signal reg_dat : std_logic_vector(15 downto 0);
signal cmd_out_r : std_logic;
signal cmd_out_shift :std_logic_vector(3 downto 0);
signal cmd_out_r_o :std_logic;
signal shift_cnt  : integer range 0 to 31 := 0;  
signal fr_reg_cnt : integer range 0 to 31 := 0;  
signal delay_cnt  : integer range 0 to 255:= 0;
signal delay_cnt_latch : std_logic_vector(7 downto 0);
signal glb_pls_lv1_en :std_logic := '0';
signal cfg_error :std_logic;
signal fr_ram_wr_en :std_logic;
type ram_type is array(0 to 20) of std_logic_vector(31 downto 0);
signal FR_RAM :ram_type := (others => (others => '0'));
--(
--X"a1234565",X"a789abc5",X"adef0125",X"a3456785",X"a9abcdef",
--X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
--X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
--X"00000000",X"00000000",X"0fedcba9",X"87654321",X"0fedcba9",X"87654321");

type state_type is (IDLE, START, FILED1_SHIFT, FILED2_SHIFT, FILED34_SHIFT, FILED5_SHIFT, DELAY, WR_REG_DAT_SHIFT, WR_FR_DAT_SHIFT, FINISH);
signal cfg_state : state_type := IDLE ;

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of cfg_state,cmd_out_r_o: signal is "TRUE";
signal fr_addr_i   :std_logic_vector(5 downto 0);
signal fr_addr_ii  :std_logic_vector(5 downto 0); 
signal fr_addr_iii :std_logic_vector(5 downto 0); 

begin

-- cross clock domian
process(FR_CFG_CLK)
begin
  if rising_edge(FR_CFG_CLK) then
  fr_addr_i <= FR_RAM_ADDR;
  end if;
end process;

process(CMD_CLK)
begin
  if rising_edge(CMD_CLK) then
  fr_addr_ii  <= fr_addr_i;
  fr_addr_iii <= fr_addr_ii;
  end if;
end process;
  
fr_ram_wr_en <= fr_addr_iii(5);
front_end_reg_ram:process(CMD_CLK)
begin
  if rising_edge(CMD_CLK) then
    if fr_ram_wr_en = '1' then
      FR_RAM(conv_integer(fr_addr_iii(4 downto 0))) <= FR_RAM_DAT_IN;
    end if;
    FR_RAM_DAT_OUT <= FR_RAM(conv_integer(fr_addr_iii));
  end if;
end process;

cmd_clk_r <= CMD_CLK;

fei4_cfg_fsm:process(cmd_clk_r,RST)
begin
  if (RST = '1') then
    cmd_out_r <='0';
    shift_cnt <= 0;
    fr_reg_cnt <= 0;
    delay_cnt <= 0;
    shift_out_fr_reg <= (others => '0');
    shift_out_reg <= (others => '0');
    cmd_field_1 <= (others => '0');
    cmd_field_2 <= (others => '0');
    cmd_field_3 <= (others => '0');
    cmd_field_4 <= (others => '0');
    reg_dat  <= (others => '0');
    cfg_state <= IDLE;
    cfg_error <= '0';
   elsif rising_edge(cmd_clk_r) then
  
    case cfg_state is  
      when IDLE =>
        if CFG_FLG = '1' then 
          cfg_state <= START; 
        end if;
        
      when START =>
        if CFG_FLG ='0' then
          shift_cnt <= 0;
          fr_reg_cnt <= 0;
          delay_cnt <= 0;
          cfg_state <= FILED1_SHIFT;
          shift_out_reg <= CFG_REG(22 downto 0);     
          -- 5 bit
          cmd_field_1 <= CFG_REG(22 downto 18);
          -- 4 bit
          cmd_field_2 <= CFG_REG(17 DOWNTO 14);
          -- 4 bit
          cmd_field_3 <= CFG_REG(13 DOWNTO 10);
          -- 4 bit
          cmd_field_4 <= CFG_REG(9 downto 6);
          -- 6 bit
          cmd_field_5 <= CFG_REG(5 downto 0);
          
          delay_cnt_latch <= CFG_REG(30 DOWNTO 23);
          glb_pls_lv1_en <= CFG_REG(31);
          reg_dat  <= WR_REG_DAT;
        end if;
              
      when FILED1_SHIFT =>
        if (shift_cnt = 4) then 
          cmd_out_r <= shift_out_reg(18);
          -- LV1 trigger command only have filed 1
          if cmd_field_1 = "11101" then 
            cfg_state <= FINISH;
          else
            cfg_state <= FILED2_SHIFT;
            shift_cnt <= shift_cnt + 1;
          end if;
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= shift_out_reg(22-shift_cnt);
        end if;
               
      when FILED2_SHIFT =>
        if (shift_cnt = 8) then 
          cmd_out_r <= shift_out_reg(14);
          -- If LV1 fllowed by CAL is enabled, then to delay state          
          if cmd_field_2 = "0100" and glb_pls_lv1_en = '1' then          
            cfg_state <= DELAY;
          -- Only slow command have filed 3  
          elsif cmd_field_2 /= "1000" then 
            cfg_state <= FINISH;
          else
            cfg_state <= FILED34_SHIFT;
            shift_cnt <= shift_cnt + 1;
          end if;
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= shift_out_reg(22-shift_cnt);
        end if;

      when FILED34_SHIFT =>
        if (shift_cnt = 16) then 
          cmd_out_r <= shift_out_reg(6);
          --  Global reset command doesn't have filed 5
          if cmd_field_3 = "1000" then 
            cfg_state <= FINISH;
          else
            cfg_state <= FILED5_SHIFT;
            shift_cnt <= shift_cnt + 1;
          end if;
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= shift_out_reg(22-shift_cnt);
        end if;

      when FILED5_SHIFT =>
        if (shift_cnt = 22) then 
          cmd_out_r <= shift_out_reg(0);
          --Write register
          if cmd_field_3 = "0010" then 
            cfg_state <= WR_REG_DAT_SHIFT;
            shift_cnt <= 0;
          --Write Front end
          elsif cmd_field_3 = "0100" then
            cfg_state <= WR_FR_DAT_SHIFT;
            shift_out_fr_reg <= FR_RAM(0);
            shift_cnt <= 0;
          else
            cfg_state <= FINISH;
          end if;
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= shift_out_reg(22-shift_cnt);
        end if;
        
      -- Delay control for the command LV1 followed by cammand CAL  
      when DELAY =>
          if delay_cnt = conv_integer(delay_cnt_latch) then
            cfg_state <= FILED1_SHIFT;
            cmd_field_1 <= "11101";
            shift_out_reg(22 downto 18) <= "11101";
            shift_cnt <= 0;
          else
            delay_cnt <= delay_cnt + 1;
          end if;    
            
      when WR_REG_DAT_SHIFT =>
        if (shift_cnt = 15) then 
          cmd_out_r <= reg_dat(0);
          cfg_state <= FINISH;
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= reg_dat(15-shift_cnt);
        end if;      

      when WR_FR_DAT_SHIFT =>
        if (shift_cnt = 31) then 
          if fr_reg_cnt = 20 then
            cfg_state <= FINISH;
          else
            fr_reg_cnt <= fr_reg_cnt + 1;
            shift_out_fr_reg <= FR_RAM(fr_reg_cnt+1);
          end if;
          cmd_out_r <= shift_out_fr_reg(31);
          shift_cnt <= 0;         
        else
          shift_cnt <= shift_cnt + 1;
          cmd_out_r <= shift_out_fr_reg(shift_cnt);
        end if;        
                            
      when FINISH =>
        cmd_out_r <= '0';
        cfg_state <= IDLE;
             
      WHEN OTHERS =>
        cfg_error <= '1';
        cfg_state <= IDLE;
                
    end case;
  end if;
    
end process;

cmd_out_phase_shift:process(CLK160)
begin
if rising_edge(CLK160) then
   cmd_out_shift <= cmd_out_shift(2 downto 0) & cmd_out_r;
   cmd_out_r_o <= cmd_out_shift(conv_integer(CMD_OUT_PH_SEL));
end if;
end process;

fei4_cmd_out_buf:OBUFDS
generic map (
  IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
  SLEW => "SLOW"-- Specify the output slew rate
  ) 
port map(
  O  => CMD_OUT_P, -- Diff_p output (connect directly to top-level port)
  OB => CMD_OUT_N, -- Diff_n output (connect directly to top-level port)
  -- Since the Positive output is connected to the negative input of the FEI4, the cmd out is 
  -- reversed.
  I => cmd_out_r_o  -- Buffer input
  );
end Behavioral;
