----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2014 09:06:17 AM
-- Design Name: 
-- Module Name: ads52j90_lvds - Behavioral
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
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ads5292_lvds is
Port ( 
    RESET   : in STD_LOGIC;
    CLK200  : in STD_LOGIC;
    SYSCLK  : in STD_LOGIC;
    CLK40   : in STD_LOGIC;
    
    FCLKP   : in STD_LOGIC;
    FCLKM   : in STD_LOGIC;
    DCLKP   : in STD_LOGIC;
    DCLKM   : in STD_LOGIC;
    DOUTP1  : in STD_LOGIC;
    DOUTM1  : in STD_LOGIC;
    DOUTP2  : in STD_LOGIC;
    DOUTM2  : in STD_LOGIC;
    DOUTP3  : in STD_LOGIC;
    DOUTM3  : in STD_LOGIC;
    DOUTP4  : in STD_LOGIC;
    DOUTM4  : in STD_LOGIC;
    DOUTP5  : in STD_LOGIC;
    DOUTM5  : in STD_LOGIC;
    DOUTP6  : in STD_LOGIC;
    DOUTM6  : in STD_LOGIC;
    
    CH1_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH2_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH3_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH4_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH5_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    CH6_DATA_OUT  : out STD_LOGIC_VECTOR(15 downto 0);
    
    LVDS_FCLK     : out STD_LOGIC;
    
    FCLK_POS: in STD_LOGIC_VECTOR(3 downto 0);
    DCLKFREQ: out STD_LOGIC_VECTOR(19 downto 0);
    FCLKFREQ: out STD_LOGIC_VECTOR(19 downto 0)     
);
end ads5292_lvds;

architecture Behavioral of ads5292_lvds is
--------------------------------------Signal declaration---------------------------
signal tied_to_ground : std_logic;
--clock
signal fclk : std_logic;--Frame clock of ADC data;
signal dclk : std_logic;--Bit clock of ADC data;

signal dclk_freq :std_logic_vector(19 downto 0);
signal fclk_freq :std_logic_vector(19 downto 0);

signal fclk_pos_reg :std_logic_vector(3 downto 0);
signal adc_ch1_data :std_logic_vector(11 downto 0);
signal adc_ch2_data :std_logic_vector(11 downto 0);
signal adc_ch3_data :std_logic_vector(11 downto 0);
signal adc_ch4_data :std_logic_vector(11 downto 0);
signal adc_ch5_data :std_logic_vector(11 downto 0);
signal adc_ch6_data :std_logic_vector(11 downto 0);

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of dclk_freq, fclk_freq : signal is "TRUE";
--attribute MARK_DEBUG of adc_ch1_data,adc_ch2_data,adc_ch3_data,adc_ch4_data,adc_ch5_data,adc_ch6_data: signal is "TRUE";

component lvds_ch
    Port (
    RESET :in std_logic;
	FCLK  :in std_logic;
    DCLK  :in std_logic;
    DOUTP :in std_logic;
    DOUTM :in std_logic;
    DATA_OUT :out std_logic_vector(11 downto 0);
	latch_p_s : std_logic_vector(3 downto 0)
     );
end component;


--frequency counter 
component frequency_counter 
   Generic(
           SYS_CLOCK_PERIOD : integer range 4 to 250 := 10 
          );
     Port ( CLOCK_PROBE : in STD_LOGIC;
            SYSCLK : in STD_LOGIC;
            RESET : in STD_LOGIC;
            FREQUENCY : out STD_LOGIC_VECTOR ( 19 downto 0)
            );
end component;

begin
tied_to_ground <= '0';
fclk_pos_reg <= FCLK_POS;

 FCLK_IBUFGDS : IBUFGDS
 generic map (
 DIFF_TERM => TRUE, 
 IBUF_LOW_PWR => FALSE, 
 IOSTANDARD => "DEFAULT")
 port map (
 O => fclk, 
 I  => FCLKP, 
 IB => FCLKM 
 );
 
DCLK_BUFFER: IBUFDS
    generic map (
       DIFF_TERM => TRUE, -- Differential Termination 
       IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
       IOSTANDARD => "DEFAULT")
    port map (
       O => dclk,  -- Buffer output
       I => DCLKP,  -- Diff_p buffer input (connect directly to top-level port)
       IB => DCLKM -- Diff_n buffer input (connect directly to top-level port)
    );

LVDS_FCLK <= fclk;
	  
ads5292_ch1:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP1,
    DOUTM => DOUTM1,
    DATA_OUT => adc_ch1_data,
	latch_p_s  => FCLK_POS
);

ads5292_ch2:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP2,
    DOUTM => DOUTM2,
    DATA_OUT => adc_ch2_data,
	latch_p_s  => FCLK_POS
);
ads5292_ch3:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP3,
    DOUTM => DOUTM3,
    DATA_OUT => adc_ch3_data,
	latch_p_s  => FCLK_POS
);
ads5292_ch4:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP4,
    DOUTM => DOUTM4,
    DATA_OUT => adc_ch4_data,
	latch_p_s  => FCLK_POS
);
ads5292_ch5:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP5,
    DOUTM => DOUTM5,
    DATA_OUT => adc_ch5_data,
	latch_p_s  => FCLK_POS
);
ads5292_ch6:lvds_ch
Port map (
    RESET => RESET,
	FCLK  => fclk,
    DCLK  => dclk,
    DOUTP => DOUTP6,
    DOUTM => DOUTM6,
    DATA_OUT => adc_ch6_data,
	latch_p_s  => FCLK_POS
);

fclk_counter:frequency_counter 
       generic map
       (
         SYS_CLOCK_PERIOD => 10 
       )
       port map 
       ( 
         CLOCK_PROBE => fclk,
         SYSCLK      => SYSCLK,
         RESET       => tied_to_ground,
         FREQUENCY   => fclk_freq
        ); 

dclk_counter:frequency_counter 
       generic map
       (
         SYS_CLOCK_PERIOD => 10 
       )
       port map 
       ( 
         CLOCK_PROBE => dclk,
         SYSCLK      => SYSCLK,
         RESET       => tied_to_ground,
         FREQUENCY   => dclk_freq
        ); 
       
DCLKFREQ <= dclk_freq;
FCLKFREQ <= fclk_freq;

process(CLK40)
begin
if rising_edge(CLK40) then
CH1_DATA_OUT(11 downto 0)  <= adc_ch1_data;
CH2_DATA_OUT(11 downto 0)  <= adc_ch2_data;
CH3_DATA_OUT(11 downto 0)  <= adc_ch3_data;
CH4_DATA_OUT(11 downto 0)  <= adc_ch4_data;
CH5_DATA_OUT(11 downto 0)  <= adc_ch5_data;
CH6_DATA_OUT(11 downto 0)  <= adc_ch6_data;

end if;
end process;

CH1_DATA_OUT(15 downto 12) <= (others => '0');
CH2_DATA_OUT(15 downto 12) <= (others => '0');
CH3_DATA_OUT(15 downto 12) <= (others => '0');
CH4_DATA_OUT(15 downto 12) <= (others => '0');
CH5_DATA_OUT(15 downto 12) <= (others => '0');
CH6_DATA_OUT(15 downto 12) <= (others => '0');

end Behavioral;