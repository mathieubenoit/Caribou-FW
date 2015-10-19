----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2014 11:11:52 AM
-- Design Name: 
-- Module Name: lvds_ch - Behavioral
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
use IEEE.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lvds_ch is
    Port (
	RESET :in std_logic;
    FCLK  :in std_logic;
    DCLK  :in std_logic;
    DOUTP :in std_logic;
    DOUTM :in std_logic;
    DATA_OUT :out std_logic_vector(11 downto 0);
	latch_p_s : std_logic_vector(3 downto 0)
     );
end lvds_ch;

architecture Behavioral of lvds_ch is


signal dout :std_logic;


signal set   :std_logic;
signal iddr_clk_en :std_logic;
signal data_n :std_logic;
signal data_p :std_logic;

signal adc_data_i :std_logic_vector(11 downto 0);
--signal adc_data_reg : std_logic_vector(13 downto 0);
signal data_reg_p :std_logic_vector(5 downto 0);
signal data_reg_n :std_logic_vector(5 downto 0);
signal data_reg_p_l :std_logic_vector(5 downto 0);
signal data_reg_n_l :std_logic_vector(5 downto 0);

signal fclk_reg   :std_logic_vector(15 downto 0);
signal latch_p :integer range 0 to 15:=0;
signal ch_valid :std_logic;
signal ch_valid1 :std_logic;

signal fifo_full:std_logic;
signal fifo_empty:std_logic;
signal fifo_rd_en:std_logic;
signal fifo_wr_en:std_logic;

signal fifo_rd_clk:std_logic;

begin

IBUFDS_inst : IBUFDS
generic map (
DIFF_TERM => TRUE, -- Differential Termination
IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "LVDS_25")
port map (
O => dout, 
I  => DOUTP, 
IB => DOUTM 
);



iddr_clk_en <= '1';
set   <= '0';
IDDR_inst: IDDR
generic map (
  DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE"
-- or "SAME_EDGE_PIPELINED"
  INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
  INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
  SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC"
port map (
  Q1 => data_p, -- 1-bit output for positive edge of clock
  Q2 => data_n, -- 1-bit output for negative edge of clock
  C => DCLK, -- 1-bit clock input
  CE => iddr_clk_en, -- 1-bit clock enable input
  D => dout, -- 1-bit DDR data input
  R => RESET, -- 1-bit reset
  S => set -- 1-bit set
);

fclk_delay: process(DCLK, RESET)
begin
	 if RESET='1' then
		fclk_reg <= (others=> '0');
	  elsif rising_edge(DCLK) then
		 fclk_reg <= fclk_reg(14 downto 0)& FCLK;
	  end if;
end process;

process(DCLK)
begin
  if rising_edge(DCLK) then      
  latch_p <= to_integer(unsigned(latch_p_s));	
  ch_valid <=  fclk_reg(latch_p) and (not fclk_reg(latch_p+1));----------Wordwise mode	
  ch_valid1 <= fclk_reg(latch_p+3) and (not fclk_reg(latch_p+4));
  end if;
end process;

  
process(DCLK,RESET)
begin
  if rising_edge(DCLK) then
    if(RESET='1') then
	  data_reg_p <= (others => '0');
	  data_reg_n <= (others => '0');
    else
	  data_reg_p <= data_reg_p(4 downto 0) & data_p;
	  data_reg_n <= data_reg_n(4 downto 0) & data_n;   
   end if;
 end if;
end process;

process(DCLK,RESET)
begin
    if(RESET = '1') then
	  data_reg_n_l <= (others => '0');
      data_reg_p_l <= (others => '0');	  
     elsif rising_edge(DCLK) then
	   if(ch_valid= '1') then
         data_reg_n_l <= data_reg_n;	
         data_reg_p_l <= data_reg_P;	 	  
       end if;
  end if;
end process;

process(DCLK,RESET)
begin
    if(RESET ='1') then
	  adc_data_i <= (others => '0');
	elsif rising_edge(DCLK) then
	  if(ch_valid1= '1') then	  
		  adc_data_i(11) <= data_reg_p_l(0);
		  adc_data_i(10) <= data_reg_n_l(0);
		  adc_data_i(9)  <= data_reg_p_l(1);
		  adc_data_i(8)  <= data_reg_n_l(1);
		  adc_data_i(7)  <= data_reg_p_l(2);
		  adc_data_i(6)  <= data_reg_n_l(2);
		  adc_data_i(5)  <= data_reg_p_l(3);
		  adc_data_i(4)  <= data_reg_n_l(3);
		  adc_data_i(3)  <= data_reg_p_l(4);
		  adc_data_i(2)  <= data_reg_n_l(4);
		  adc_data_i(1)  <= data_reg_p_l(5);
		  adc_data_i(0)  <= data_reg_n_l(5);
     end if;
   end if;
end process;

DATA_OUT<=adc_data_i;
  
end Behavioral;
