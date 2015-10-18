----------------------------------------------------------------------------------
-- Company: BNL
-- Engineer: Hongbin
-- 
-- Create Date: 08/15/2015 04:16:58 PM
-- Design Name: IDELAY Module
-- Module Name: idelay - Behavioral
-- Project Name: CaRIBOu Test Firmware 
-- Target Devices: XC7Z045
-- Tool Versions: Vivado 2014.2
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
Library UNISIM;
use UNISIM.vcomponents.all;

entity idelay2 is
    Port ( 
    RESET  :        in std_logic;
    DATA_IN:        in std_logic;
    DATA_OUT:       out std_logic;
    
    CLK    : in std_logic;
    CNT_OUT    : out std_logic_vector(4 downto 0);
    LD    : in  std_logic;
    CNT_IN     : in  std_logic_vector(4 downto 0)
    );
end idelay2;

architecture rtl of idelay2 is

--IDELAYE2 associate signals
signal idely_c           :std_logic; --All control inputs to IDELAYE2 primitive (RST , CE, and INC) are synchronous to the clock input (C). 
signal idely_ce          :std_logic; --Active high enable for increment/decrement function.
signal idely_cinvctrl   :std_logic; --Used for dynamically switching the polarity of C pin. 
signal idely_datain     :std_logic; 
signal idely_inc        :std_logic; --INC = 1 increments when CE is high. INC=0 decrements.
signal idely_ldpipeen   :std_logic; --When High, loads the pipeline register with the value currently on the CNTVALUEIN pins
signal idely_regrst     :std_logic; --When high, resets the pipeline register to all zeros. Only used in "V AR_LOAD_PIPE" mode.

begin

-- IDELAYE2: Input Fixed or Variable Delay Element
-- 7 Series
-- Xilinx HDL Libraries Guide, version 2014.2
IDELAYE2_inst : IDELAYE2
generic map (
    CINVCTRL_SEL => "FALSE",          -- Enable dynamic clock inversion (FALSE, TRUE)
    DELAY_SRC => "IDATAIN",           -- Delay input (IDATAIN, DATAIN)
    HIGH_PERFORMANCE_MODE => "TRUE",  -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
    IDELAY_TYPE => "VAR_LOAD",        -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
    IDELAY_VALUE => 0,                -- Input delay tap setting (0-31)
    PIPE_SEL => "FALSE",              -- Select pipelined mode, FALSE, TRUE
    REFCLK_FREQUENCY => 200.0,        -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
    SIGNAL_PATTERN => "CLOCK"         -- DATA, CLOCK input signal
)
port map (
    CNTVALUEOUT => CNT_OUT, -- 5-bit output: Counter value output
    DATAOUT => DATA_OUT,       -- 1-bit output: Delayed data output
    C => CLK,              -- 1-bit input: Clock input
    CE => '1',--idely_ce,             -- 1-bit input: Active high enable increment/decrement input
    CINVCTRL => idely_cinvctrl,       -- 1-bit input: Dynamic clock inversion input
    CNTVALUEIN => CNT_IN,             -- 5-bit input: Counter value input
    DATAIN => idely_datain,           -- 1-bit input: Internal delay data input
    IDATAIN => DATA_IN,              -- 1-bit input: Data input from the I/O
    INC => idely_inc,                 -- 1-bit input: Increment / Decrement tap delay input
    LD => LD,                    -- 1-bit input: Load IDELAY_VALUE input
    LDPIPEEN => idely_ldpipeen,       -- 1-bit input: Enable PIPELINE register to load data input
    REGRST => idely_regrst            -- 1-bit input: Active-high reset tap-delay input
);
-- End of IDELAYE2_inst instantiation
end rtl;