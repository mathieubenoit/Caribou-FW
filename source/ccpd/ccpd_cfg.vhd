----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2015 09:54:28 AM
-- Design Name: 
-- Module Name: ccpd_cfg_tb - Behavioral
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

entity ccpd_cfg_tb is
Port (
    sysclk             :in std_logic;
    rst                :in std_logic;

    FLG        :in std_logic;
    REG_LIMIT  :in std_logic_vector(4 downto 0);
    SHIFT_LIMIT :in std_logic_vector(4 downto 0);
    CLK_EN      :in std_logic_vector(1 downto 0);
    RAM_WR_EN   :in std_logic;
    RAM_WR_DAT      :in std_logic_vector(31 downto 0);
    RAM_ADDR    :in std_logic_vector(3 downto 0);
    RAM_RD_DAT  :out std_logic_vector(31 downto 0);    
           
    Sin                 :out std_logic;
    CkC                 :out std_logic;
    CkD                 :out std_logic;
    Ld                  :out std_logic
 );
end ccpd_cfg_tb;

architecture Behavioral of ccpd_cfg_tb is

signal ccpd_sin        :std_logic;
signal ccpd_ckc        :std_logic;
signal ccpd_ckd        :std_logic;
signal ccpd_ld         :std_logic;

signal ram_addr        :std_logic_vector(3 downto 0);
signal ram_wr_dat      :std_logic_vector(31 downto 0);
signal ram_rd_dat      :std_logic_vector(31 downto 0);
signal ram_wr_en       :std_logic;
signal ram_wr_clk      :std_logic;

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of ram_addr,ram_wr_dat,ram_rd_dat,ram_wr_en : signal is "TRUE";
attribute MARK_DEBUG of ccpd_sin,ccpd_ckc,ccpd_ckd,ccpd_ld : signal is "TRUE";


begin

ccpd_cfg:entity work.ccpd_cfg_core
    generic map(
    input_clk_fre  => 100_000_000, --input clock speed from user logic in Hz
    cfg_clk_freq   =>  400_000  --frequency of the CkC and CkD in Hz
    )
    Port map(
    clk             => sysclk,
    rst             => rst,
    
    
    start_flg       => FLG,
    reg_limit       => REG_LIMIT,
    shift_limit     => SHIFT_LIMIT,
    clock_enable    => CLK_EN,
    
    ram_addr        => RAM_ADDR,
    ram_wr_dat      => RAM_WR_DAT,
    ram_rd_dat      => RAM_RD_DAT,
    ram_wr_en       => RAM_WR_EN,
    ram_wr_clk      => sysclk,
            
    Sin             => ccpd_sin,
    CkC             => ccpd_ckc,
    CkD             => ccpd_ckd,
    Ld              => ccpd_ld
    );

Sin    <= ccpd_sin;
CkC    <= ccpd_ckc;
CkD    <= ccpd_ckd;
Ld     <= ccpd_ld;

end Behavioral;
