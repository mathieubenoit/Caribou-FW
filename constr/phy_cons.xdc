# Sys Clk in - 200 MHz oscillator
set_property PACKAGE_PIN G9 [get_ports CLK200_IN_N]
set_property IOSTANDARD LVDS [get_ports CLK200_IN_P]
set_property IOSTANDARD LVDS [get_ports CLK200_IN_N]

# FEI4 A1 (LPC SLOT1) DOB
set_property PACKAGE_PIN AB29 [get_ports FEI4_A1_DOB_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_DOB_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_DOB_N]
# FEI4 A1 (LPC SLOT1) CMD
set_property PACKAGE_PIN Y26 [get_ports FEI4_A1_CMD_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_CMD_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_CMD_OUT_N]
# FEI4 A1 (LPC SLOT1) HITOR
set_property PACKAGE_PIN AG26 [get_ports FEI4_A1_HIT_OR_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_HIT_OR_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A1_HIT_OR_N]

# FEI4 A2 (LPC SLOT2) DOB
set_property PACKAGE_PIN AC29 [get_ports FEI4_A2_DOB_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_DOB_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_DOB_N]
# FEI4 A2 (LPC SLOT2) CMD
set_property PACKAGE_PIN Y30 [get_ports FEI4_A2_CMD_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_CMD_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_CMD_OUT_N]
# FEI4 A2 (LPC SLOT2) HITOR
set_property PACKAGE_PIN AH26 [get_ports FEI4_A2_HIT_OR_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_HIT_OR_P]
set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_HIT_OR_N]

# FEI4 REF CLOCK and ADC Sampling CLK OUTPUT
set_property PACKAGE_PIN AB12 [get_ports CLK40_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40_OUT_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK40_OUT_N]

# Xilinx IIC Controller
set_property PACKAGE_PIN AF27 [get_ports PL_IIC1_SDA]
set_property PACKAGE_PIN AJ29 [get_ports PL_IIC1_SCL]
set_property IOSTANDARD LVCMOS25 [get_ports PL_IIC1_SDA]
set_property IOSTANDARD LVCMOS25 [get_ports PL_IIC1_SCL]

set_property PACKAGE_PIN AJ18 [get_ports PL_IIC2_SDA]
set_property IOSTANDARD LVCMOS25 [get_ports PL_IIC2_SDA]
set_property PACKAGE_PIN AJ14 [get_ports PL_IIC2_SCL]
set_property IOSTANDARD LVCMOS25 [get_ports PL_IIC2_SCL]

set_property PACKAGE_PIN AC14 [get_ports PL_IIC_BUFFER_EN]
set_property IOSTANDARD LVCMOS25 [get_ports PL_IIC_BUFFER_EN]

# USER SMA
set_property PACKAGE_PIN AD18 [get_ports USER_SMA_P]
set_property IOSTANDARD LVCMOS25 [get_ports USER_SMA_P]
set_property PACKAGE_PIN AD19 [get_ports USER_SMA_N]
set_property IOSTANDARD LVCMOS25 [get_ports USER_SMA_N]

FMC HPC LVDS OUTPUT
set_property PACKAGE_PIN AJ16 [get_ports FMC_LVDS1_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS1_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS1_N]

set_property PACKAGE_PIN AD16 [get_ports FMC_LVDS2_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS2_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS2_N]

set_property PACKAGE_PIN AA15 [get_ports FMC_LVDS3_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS3_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS3_N]

set_property PACKAGE_PIN AD14 [get_ports FMC_LVDS4_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS4_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS4_N]

#set_property PACKAGE_PIN AJ15 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_N]

set_property PACKAGE_PIN AH19 [get_ports HPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS6_N]

set_property PACKAGE_PIN AE12 [get_ports FMC_LVDS7_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_N]

set_property PACKAGE_PIN AE13 [get_ports FMC_LVDS8_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_N]

set_property PACKAGE_PIN AH17 [get_ports FMC_LVDS9_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_N]

set_property PACKAGE_PIN AH14 [get_ports FMC_LVDS10_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_P]
set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_N]

#set_property PACKAGE_PIN AE16 [get_ports FMC_LVDS11_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS11_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS11_N]

set_property PACKAGE_PIN AG21 [get_ports HPC_LVDS12_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS12_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS12_N]

# FMC LPC
set_property PACKAGE_PIN AJ16 [get_ports LPC_LVDS1_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS1_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS1_N]

set_property PACKAGE_PIN AD16 [get_ports LPC_LVDS2_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS2_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS2_N]

set_property PACKAGE_PIN AA15 [get_ports LPC_LVDS3_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS3_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS3_N]

set_property PACKAGE_PIN AD14 [get_ports LPC_LVDS4_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS4_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS4_N]

#set_property PACKAGE_PIN AJ15 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_N]

set_property PACKAGE_PIN AG12 [get_ports LPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS6_N]

set_property PACKAGE_PIN AE12 [get_ports LPC_LVDS7_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS7_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS7_N]

set_property PACKAGE_PIN AE13 [get_ports LPC_LVDS8_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS8_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS8_N]

set_property PACKAGE_PIN AH17 [get_ports LPC_LVDS9_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS9_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS9_N]

set_property PACKAGE_PIN AH14 [get_ports LPC_LVDS10_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS10_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS10_N]

#set_property PACKAGE_PIN AE16   [get_ports FMC_LVDS11_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS11_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS11_N]

set_property PACKAGE_PIN AF15 [get_ports LPC_LVDS12_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS12_P]
set_property IOSTANDARD LVDS_25 [get_ports LPC_LVDS12_N]


#ADC LVDS INPUT IOs
#bank12
set_property PACKAGE_PIN AC28 [get_ports ADC_FCLKP]
set_property IOSTANDARD LVDS_25 [get_ports ADC_FCLKP]
set_property IOSTANDARD LVDS_25 [get_ports ADC_FCLKM]
#bank10
set_property PACKAGE_PIN AG17 [get_ports ADC_DCLKP]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DCLKP]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DCLKM]
#bank12
set_property PACKAGE_PIN AD25 [get_ports ADC_DOUTP1]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP1]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM1]
#bank12
set_property PACKAGE_PIN AE25 [get_ports ADC_DOUTP2]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP2]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM2]
#bank12
set_property PACKAGE_PIN AF30 [get_ports ADC_DOUTP3]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP3]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM3]
#bank12
set_property PACKAGE_PIN AF29 [get_ports ADC_DOUTP4]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP4]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM4]
#bank12
set_property PACKAGE_PIN AH28 [get_ports ADC_DOUTP5]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP5]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM5]
#bank12
set_property PACKAGE_PIN AK27 [get_ports ADC_DOUTP6]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTP6]
set_property IOSTANDARD LVDS_25 [get_ports ADC_DOUTM6]

# GBT FPGA IO
# CPU RESET
set_property PACKAGE_PIN A8 [get_ports CPU_RESET]
set_property IOSTANDARD LVCMOS15 [get_ports CPU_RESET]

#USER LED
set_property PACKAGE_PIN Y21 [get_ports GPIO_LED_LEFT]
set_property IOSTANDARD LVCMOS25 [get_ports GPIO_LED_LEFT]

set_property PACKAGE_PIN G2 [get_ports GPIO_LED_CENTER]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_LED_CENTER]

set_property PACKAGE_PIN W21 [get_ports GPIO_LED_RIGHT]
set_property IOSTANDARD LVCMOS25 [get_ports GPIO_LED_RIGHT]

set_property PACKAGE_PIN A17 [get_ports GPIO_LED_0]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_LED_0]

# SAM MGT CLOCK IN
# SMA CLK
#set_property PACKAGE_PIN W8 [get_ports SMA_MGT_REFCLK_P]
# SI5324_CLK
set_property PACKAGE_PIN AC7 [get_ports SMA_MGT_REFCLK_N]

#SI5324 RST
set_property PACKAGE_PIN W23 [get_ports SI5324_RST_N]
set_property IOSTANDARD LVCMOS25 [get_ports SI5324_RST_N]

#SI5324 CLK
set_property PACKAGE_PIN AE20 [get_ports SI5324_CLK_IN_N]
set_property IOSTANDARD LVDS_25 [get_ports SI5324_CLK_IN_P]
set_property IOSTANDARD LVDS_25 [get_ports SI5324_CLK_IN_N]

# SFP MGT TX/RX
set_property PACKAGE_PIN Y5 [get_ports SFP_RX_N]

# LOOP BACK TX/RX
#set_property PACKAGE_PIN V2  [get_ports SFP_TX_P]
#set_property PACKAGE_PIN V1  [get_ports SFP_TX_N]
#set_property PACKAGE_PIN AA4 [get_ports SFP_RX_P]
#set_property PACKAGE_PIN AA3 [get_ports SFP_RX_N]

# SFP TX DISABLE
set_property PACKAGE_PIN AA18 [get_ports SFP_TX_DISABLE]
set_property IOSTANDARD LVCMOS25 [get_ports SFP_TX_DISABLE]

# USR CLOCK
set_property IOSTANDARD LVDS_25 [get_ports USER_CLOCK_P]
set_property PACKAGE_PIN AG14 [get_ports USER_CLOCK_N]
set_property IOSTANDARD LVDS_25 [get_ports USER_CLOCK_N]

# TLU signals FMC LPC
set_property PACKAGE_PIN AF18 [get_ports TLU_TRIGGER_I_P]
set_property IOSTANDARD LVDS_25 [get_ports TLU_TRIGGER_I_N]

set_property PACKAGE_PIN AJ26 [get_ports TLU_BUSY_O_P]
set_property IOSTANDARD LVDS_25 [get_ports TLU_BUSY_O_N]

#TLU simulator signals FMC HPC
set_property PACKAGE_PIN AC24 [get_ports TLU_TRIGGER_O_P]
set_property IOSTANDARD LVDS_25 [get_ports TLU_TRIGGER_O_N]

set_property PACKAGE_PIN P25 [get_ports TLU_BUSY_I_P]
set_property IOSTANDARD LVDS_25 [get_ports TLU_BUSY_I_N]

## User Clk - 156.25 MHz sourced by Si570
#set_property PACKAGE_PIN AF14   [get_ports clk_si570_p]
#set_property PACKAGE_PIN AG14   [get_ports clk_si570_n]
#set_property IOSTANDARD LVDS_25 [get_ports clk_si570_p]
#set_property IOSTANDARD LVDS_25 [get_ports clk_si570_n]


connect_debug_port u_ila_0/clk [get_nets [list gbt_link/gbtexmpldsgn/n_2_rxFrmClkPhAlgnr]]

create_clock -period 4.167 -name ADC_DCLKP -waveform {0.000 2.083} [get_ports ADC_DCLKP]
create_clock -period 25.000 -name ADC_FCLKP -waveform {0.000 12.500} [get_ports ADC_FCLKP]
create_clock -period 8.333 -name SMA_MGT_REFCLK_P -waveform {0.000 4.167} [get_ports SMA_MGT_REFCLK_P]
create_clock -period 6.409 -name USER_CLOCK_P -waveform {0.000 3.205} [get_ports USER_CLOCK_P]
#create_clock -period 25.000 -name gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/I -waveform {0.000 12.500} [get_pins {gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/gtxe2_i/TXOUTCLK}]
#create_clock -period 25.000 -name gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/O2 -waveform {0.000 12.500} [get_pins {gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/gtxe2_i/RXOUTCLK}]
set_false_path -from [get_clocks ADC_FCLKP] -to [get_clocks clk_fpga_0]
set_false_path -from [get_clocks {gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/I}] -to [get_clocks USER_CLOCK_P]
set_false_path -from [get_clocks {gbt_link/gbtexmpldsgn/gbtBank_1/mgt/mgtStd_gen.mgtStd/gtxStd_gen[1].gtxStd/O2}] -to [get_clocks USER_CLOCK_P]
set_false_path -from [get_clocks clkout0_1] -to [get_clocks clk16_clk_wiz_0]
set_clock_groups -asynchronous -group [get_clocks clk160_clk_wiz_0] -group [get_clocks clk_fpga_0]
set_clock_groups -asynchronous -group [get_clocks clk100_clk_wiz_0] -group [get_clocks clk_fpga_0]
set_clock_groups -asynchronous -group [get_clocks clk40_clk_wiz_0] -group [get_clocks clk_fpga_0]
set_clock_groups -asynchronous -group [get_clocks clk16_clk_wiz_0] -group [get_clocks clkout0_1]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk160_clk_wiz_0]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk16_clk_wiz_0]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk40_clk_wiz_0]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks ADC_DCLKP]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks ADC_FCLKP]



create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list ACLK]]
set_property port_width 32 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {axi_hp2_burst/axi_awaddr[0]} {axi_hp2_burst/axi_awaddr[1]} {axi_hp2_burst/axi_awaddr[2]} {axi_hp2_burst/axi_awaddr[3]} {axi_hp2_burst/axi_awaddr[4]} {axi_hp2_burst/axi_awaddr[5]} {axi_hp2_burst/axi_awaddr[6]} {axi_hp2_burst/axi_awaddr[7]} {axi_hp2_burst/axi_awaddr[8]} {axi_hp2_burst/axi_awaddr[9]} {axi_hp2_burst/axi_awaddr[10]} {axi_hp2_burst/axi_awaddr[11]} {axi_hp2_burst/axi_awaddr[12]} {axi_hp2_burst/axi_awaddr[13]} {axi_hp2_burst/axi_awaddr[14]} {axi_hp2_burst/axi_awaddr[15]} {axi_hp2_burst/axi_awaddr[16]} {axi_hp2_burst/axi_awaddr[17]} {axi_hp2_burst/axi_awaddr[18]} {axi_hp2_burst/axi_awaddr[19]} {axi_hp2_burst/axi_awaddr[20]} {axi_hp2_burst/axi_awaddr[21]} {axi_hp2_burst/axi_awaddr[22]} {axi_hp2_burst/axi_awaddr[23]} {axi_hp2_burst/axi_awaddr[24]} {axi_hp2_burst/axi_awaddr[25]} {axi_hp2_burst/axi_awaddr[26]} {axi_hp2_burst/axi_awaddr[27]} {axi_hp2_burst/axi_awaddr[28]} {axi_hp2_burst/axi_awaddr[29]} {axi_hp2_burst/axi_awaddr[30]} {axi_hp2_burst/axi_awaddr[31]}]]
create_debug_core u_ila_1_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1_0]
set_property port_width 1 [get_debug_ports u_ila_1_0/clk]
connect_debug_port u_ila_1_0/clk [get_nets [list clk160]]
set_property port_width 4 [get_debug_ports u_ila_1_0/probe0]
connect_debug_port u_ila_1_0/probe0 [get_nets [list {fei4_cfg/cfg_state[0]} {fei4_cfg/cfg_state[1]} {fei4_cfg/cfg_state[2]} {fei4_cfg/cfg_state[3]}]]
create_debug_core u_ila_2_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2_0]
set_property port_width 1 [get_debug_ports u_ila_2_0/clk]
connect_debug_port u_ila_2_0/clk [get_nets [list clk100]]
set_property port_width 32 [get_debug_ports u_ila_2_0/probe0]
connect_debug_port u_ila_2_0/probe0 [get_nets [list {fei4_cfg/delay_cnt[0]} {fei4_cfg/delay_cnt[1]} {fei4_cfg/delay_cnt[2]} {fei4_cfg/delay_cnt[3]} {fei4_cfg/delay_cnt[4]} {fei4_cfg/delay_cnt[5]} {fei4_cfg/delay_cnt[6]} {fei4_cfg/delay_cnt[7]} {fei4_cfg/delay_cnt[8]} {fei4_cfg/delay_cnt[9]} {fei4_cfg/delay_cnt[10]} {fei4_cfg/delay_cnt[11]} {fei4_cfg/delay_cnt[12]} {fei4_cfg/delay_cnt[13]} {fei4_cfg/delay_cnt[14]} {fei4_cfg/delay_cnt[15]} {fei4_cfg/delay_cnt[16]} {fei4_cfg/delay_cnt[17]} {fei4_cfg/delay_cnt[18]} {fei4_cfg/delay_cnt[19]} {fei4_cfg/delay_cnt[20]} {fei4_cfg/delay_cnt[21]} {fei4_cfg/delay_cnt[22]} {fei4_cfg/delay_cnt[23]} {fei4_cfg/delay_cnt[24]} {fei4_cfg/delay_cnt[25]} {fei4_cfg/delay_cnt[26]} {fei4_cfg/delay_cnt[27]} {fei4_cfg/delay_cnt[28]} {fei4_cfg/delay_cnt[29]} {fei4_cfg/delay_cnt[30]} {fei4_cfg/delay_cnt[31]}]]
create_debug_core u_ila_3_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_3_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_3_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_3_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_3_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_3_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_3_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_3_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_3_0]
set_property port_width 1 [get_debug_ports u_ila_3_0/clk]
connect_debug_port u_ila_3_0/clk [get_nets [list USER_SMA_P_OBUF]]
set_property port_width 4 [get_debug_ports u_ila_3_0/probe0]
connect_debug_port u_ila_3_0/probe0 [get_nets [list {fei4_to_gbt/fei4_a1_data_2_gbt[0]} {fei4_to_gbt/fei4_a1_data_2_gbt[1]} {fei4_to_gbt/fei4_a1_data_2_gbt[2]} {fei4_to_gbt/fei4_a1_data_2_gbt[3]}]]
create_debug_core u_ila_4_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_4_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_4_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_4_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_4_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_4_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_4_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_4_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_4_0]
set_property port_width 1 [get_debug_ports u_ila_4_0/clk]
connect_debug_port u_ila_4_0/clk [get_nets [list USER_SMA_N_OBUF]]
set_property port_width 84 [get_debug_ports u_ila_4_0/probe0]
connect_debug_port u_ila_4_0/probe0 [get_nets [list {gbt_fpga_rx_data[0]} {gbt_fpga_rx_data[1]} {gbt_fpga_rx_data[2]} {gbt_fpga_rx_data[3]} {gbt_fpga_rx_data[4]} {gbt_fpga_rx_data[5]} {gbt_fpga_rx_data[6]} {gbt_fpga_rx_data[7]} {gbt_fpga_rx_data[8]} {gbt_fpga_rx_data[9]} {gbt_fpga_rx_data[10]} {gbt_fpga_rx_data[11]} {gbt_fpga_rx_data[12]} {gbt_fpga_rx_data[13]} {gbt_fpga_rx_data[14]} {gbt_fpga_rx_data[15]} {gbt_fpga_rx_data[16]} {gbt_fpga_rx_data[17]} {gbt_fpga_rx_data[18]} {gbt_fpga_rx_data[19]} {gbt_fpga_rx_data[20]} {gbt_fpga_rx_data[21]} {gbt_fpga_rx_data[22]} {gbt_fpga_rx_data[23]} {gbt_fpga_rx_data[24]} {gbt_fpga_rx_data[25]} {gbt_fpga_rx_data[26]} {gbt_fpga_rx_data[27]} {gbt_fpga_rx_data[28]} {gbt_fpga_rx_data[29]} {gbt_fpga_rx_data[30]} {gbt_fpga_rx_data[31]} {gbt_fpga_rx_data[32]} {gbt_fpga_rx_data[33]} {gbt_fpga_rx_data[34]} {gbt_fpga_rx_data[35]} {gbt_fpga_rx_data[36]} {gbt_fpga_rx_data[37]} {gbt_fpga_rx_data[38]} {gbt_fpga_rx_data[39]} {gbt_fpga_rx_data[40]} {gbt_fpga_rx_data[41]} {gbt_fpga_rx_data[42]} {gbt_fpga_rx_data[43]} {gbt_fpga_rx_data[44]} {gbt_fpga_rx_data[45]} {gbt_fpga_rx_data[46]} {gbt_fpga_rx_data[47]} {gbt_fpga_rx_data[48]} {gbt_fpga_rx_data[49]} {gbt_fpga_rx_data[50]} {gbt_fpga_rx_data[51]} {gbt_fpga_rx_data[52]} {gbt_fpga_rx_data[53]} {gbt_fpga_rx_data[54]} {gbt_fpga_rx_data[55]} {gbt_fpga_rx_data[56]} {gbt_fpga_rx_data[57]} {gbt_fpga_rx_data[58]} {gbt_fpga_rx_data[59]} {gbt_fpga_rx_data[60]} {gbt_fpga_rx_data[61]} {gbt_fpga_rx_data[62]} {gbt_fpga_rx_data[63]} {gbt_fpga_rx_data[64]} {gbt_fpga_rx_data[65]} {gbt_fpga_rx_data[66]} {gbt_fpga_rx_data[67]} {gbt_fpga_rx_data[68]} {gbt_fpga_rx_data[69]} {gbt_fpga_rx_data[70]} {gbt_fpga_rx_data[71]} {gbt_fpga_rx_data[72]} {gbt_fpga_rx_data[73]} {gbt_fpga_rx_data[74]} {gbt_fpga_rx_data[75]} {gbt_fpga_rx_data[76]} {gbt_fpga_rx_data[77]} {gbt_fpga_rx_data[78]} {gbt_fpga_rx_data[79]} {gbt_fpga_rx_data[80]} {gbt_fpga_rx_data[81]} {gbt_fpga_rx_data[82]} {gbt_fpga_rx_data[83]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 32 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list {axi_hp2_burst/dout[0]} {axi_hp2_burst/dout[1]} {axi_hp2_burst/dout[2]} {axi_hp2_burst/dout[3]} {axi_hp2_burst/dout[4]} {axi_hp2_burst/dout[5]} {axi_hp2_burst/dout[6]} {axi_hp2_burst/dout[7]} {axi_hp2_burst/dout[8]} {axi_hp2_burst/dout[9]} {axi_hp2_burst/dout[10]} {axi_hp2_burst/dout[11]} {axi_hp2_burst/dout[12]} {axi_hp2_burst/dout[13]} {axi_hp2_burst/dout[14]} {axi_hp2_burst/dout[15]} {axi_hp2_burst/dout[16]} {axi_hp2_burst/dout[17]} {axi_hp2_burst/dout[18]} {axi_hp2_burst/dout[19]} {axi_hp2_burst/dout[20]} {axi_hp2_burst/dout[21]} {axi_hp2_burst/dout[22]} {axi_hp2_burst/dout[23]} {axi_hp2_burst/dout[24]} {axi_hp2_burst/dout[25]} {axi_hp2_burst/dout[26]} {axi_hp2_burst/dout[27]} {axi_hp2_burst/dout[28]} {axi_hp2_burst/dout[29]} {axi_hp2_burst/dout[30]} {axi_hp2_burst/dout[31]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 8 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list {axi_hp2_burst/fifo_rdcnt_i[0]} {axi_hp2_burst/fifo_rdcnt_i[1]} {axi_hp2_burst/fifo_rdcnt_i[2]} {axi_hp2_burst/fifo_rdcnt_i[3]} {axi_hp2_burst/fifo_rdcnt_i[4]} {axi_hp2_burst/fifo_rdcnt_i[5]} {axi_hp2_burst/fifo_rdcnt_i[6]} {axi_hp2_burst/fifo_rdcnt_i[7]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 3 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list {axi_hp2_burst/state[0]} {axi_hp2_burst/state[1]} {axi_hp2_burst/state[2]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list axi_hp2_burst/axi_awready]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list axi_hp2_burst/axi_awvalid]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe6]
connect_debug_port u_ila_0_0/probe6 [get_nets [list axi_hp2_burst/axi_wlast]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe7]
connect_debug_port u_ila_0_0/probe7 [get_nets [list axi_hp2_burst/axi_wready]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe8]
connect_debug_port u_ila_0_0/probe8 [get_nets [list axi_hp2_burst/axi_wvalid]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe9]
connect_debug_port u_ila_0_0/probe9 [get_nets [list axi_hp2_burst/fifo_empty]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe10]
connect_debug_port u_ila_0_0/probe10 [get_nets [list axi_hp2_burst/fifo_full]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe11]
connect_debug_port u_ila_0_0/probe11 [get_nets [list axi_hp2_burst/fifo_rden]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe12]
connect_debug_port u_ila_0_0/probe12 [get_nets [list axi_hp2_burst/last_rd_tri_i]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe13]
connect_debug_port u_ila_0_0/probe13 [get_nets [list fei4_a1_rx_1/data_deser/sync_tri]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe14]
connect_debug_port u_ila_0_0/probe14 [get_nets [list fei4_a2_rx_1/data_deser/sync_tri]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe1]
connect_debug_port u_ila_1_0/probe1 [get_nets [list {fei4_a2_rx_1/data_deser/rx_state[0]} {fei4_a2_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 16 [get_debug_ports u_ila_1_0/probe2]
connect_debug_port u_ila_1_0/probe2 [get_nets [list {fei4_a2_rx_1/data_extract/reg_addr[0]} {fei4_a2_rx_1/data_extract/reg_addr[1]} {fei4_a2_rx_1/data_extract/reg_addr[2]} {fei4_a2_rx_1/data_extract/reg_addr[3]} {fei4_a2_rx_1/data_extract/reg_addr[4]} {fei4_a2_rx_1/data_extract/reg_addr[5]} {fei4_a2_rx_1/data_extract/reg_addr[6]} {fei4_a2_rx_1/data_extract/reg_addr[7]} {fei4_a2_rx_1/data_extract/reg_addr[8]} {fei4_a2_rx_1/data_extract/reg_addr[9]} {fei4_a2_rx_1/data_extract/reg_addr[10]} {fei4_a2_rx_1/data_extract/reg_addr[11]} {fei4_a2_rx_1/data_extract/reg_addr[12]} {fei4_a2_rx_1/data_extract/reg_addr[13]} {fei4_a2_rx_1/data_extract/reg_addr[14]} {fei4_a2_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 16 [get_debug_ports u_ila_1_0/probe3]
connect_debug_port u_ila_1_0/probe3 [get_nets [list {fei4_a2_rx_1/data_extract/reg_value[0]} {fei4_a2_rx_1/data_extract/reg_value[1]} {fei4_a2_rx_1/data_extract/reg_value[2]} {fei4_a2_rx_1/data_extract/reg_value[3]} {fei4_a2_rx_1/data_extract/reg_value[4]} {fei4_a2_rx_1/data_extract/reg_value[5]} {fei4_a2_rx_1/data_extract/reg_value[6]} {fei4_a2_rx_1/data_extract/reg_value[7]} {fei4_a2_rx_1/data_extract/reg_value[8]} {fei4_a2_rx_1/data_extract/reg_value[9]} {fei4_a2_rx_1/data_extract/reg_value[10]} {fei4_a2_rx_1/data_extract/reg_value[11]} {fei4_a2_rx_1/data_extract/reg_value[12]} {fei4_a2_rx_1/data_extract/reg_value[13]} {fei4_a2_rx_1/data_extract/reg_value[14]} {fei4_a2_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 4 [get_debug_ports u_ila_1_0/probe4]
connect_debug_port u_ila_1_0/probe4 [get_nets [list {fei4_a2_rx_1/data_extract/state[0]} {fei4_a2_rx_1/data_extract/state[1]} {fei4_a2_rx_1/data_extract/state[2]} {fei4_a2_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 4 [get_debug_ports u_ila_1_0/probe5]
connect_debug_port u_ila_1_0/probe5 [get_nets [list {fei4_a2_rx_1/dat_extrac_state[0]} {fei4_a2_rx_1/dat_extrac_state[1]} {fei4_a2_rx_1/dat_extrac_state[2]} {fei4_a2_rx_1/dat_extrac_state[3]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 2 [get_debug_ports u_ila_1_0/probe6]
connect_debug_port u_ila_1_0/probe6 [get_nets [list {fei4_a1_rx_1/data_deser/rx_state[0]} {fei4_a1_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 16 [get_debug_ports u_ila_1_0/probe7]
connect_debug_port u_ila_1_0/probe7 [get_nets [list {fei4_a1_rx_1/data_extract/reg_addr[0]} {fei4_a1_rx_1/data_extract/reg_addr[1]} {fei4_a1_rx_1/data_extract/reg_addr[2]} {fei4_a1_rx_1/data_extract/reg_addr[3]} {fei4_a1_rx_1/data_extract/reg_addr[4]} {fei4_a1_rx_1/data_extract/reg_addr[5]} {fei4_a1_rx_1/data_extract/reg_addr[6]} {fei4_a1_rx_1/data_extract/reg_addr[7]} {fei4_a1_rx_1/data_extract/reg_addr[8]} {fei4_a1_rx_1/data_extract/reg_addr[9]} {fei4_a1_rx_1/data_extract/reg_addr[10]} {fei4_a1_rx_1/data_extract/reg_addr[11]} {fei4_a1_rx_1/data_extract/reg_addr[12]} {fei4_a1_rx_1/data_extract/reg_addr[13]} {fei4_a1_rx_1/data_extract/reg_addr[14]} {fei4_a1_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 4 [get_debug_ports u_ila_1_0/probe8]
connect_debug_port u_ila_1_0/probe8 [get_nets [list {fei4_a1_rx_1/data_extract/state[0]} {fei4_a1_rx_1/data_extract/state[1]} {fei4_a1_rx_1/data_extract/state[2]} {fei4_a1_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 16 [get_debug_ports u_ila_1_0/probe9]
connect_debug_port u_ila_1_0/probe9 [get_nets [list {fei4_a1_rx_1/data_extract/reg_value[0]} {fei4_a1_rx_1/data_extract/reg_value[1]} {fei4_a1_rx_1/data_extract/reg_value[2]} {fei4_a1_rx_1/data_extract/reg_value[3]} {fei4_a1_rx_1/data_extract/reg_value[4]} {fei4_a1_rx_1/data_extract/reg_value[5]} {fei4_a1_rx_1/data_extract/reg_value[6]} {fei4_a1_rx_1/data_extract/reg_value[7]} {fei4_a1_rx_1/data_extract/reg_value[8]} {fei4_a1_rx_1/data_extract/reg_value[9]} {fei4_a1_rx_1/data_extract/reg_value[10]} {fei4_a1_rx_1/data_extract/reg_value[11]} {fei4_a1_rx_1/data_extract/reg_value[12]} {fei4_a1_rx_1/data_extract/reg_value[13]} {fei4_a1_rx_1/data_extract/reg_value[14]} {fei4_a1_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 4 [get_debug_ports u_ila_1_0/probe10]
connect_debug_port u_ila_1_0/probe10 [get_nets [list {fei4_a1_rx_1/dat_extrac_state[0]} {fei4_a1_rx_1/dat_extrac_state[1]} {fei4_a1_rx_1/dat_extrac_state[2]} {fei4_a1_rx_1/dat_extrac_state[3]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 32 [get_debug_ports u_ila_1_0/probe11]
connect_debug_port u_ila_1_0/probe11 [get_nets [list {hp2_burst_fifo_wrdata_t[0]} {hp2_burst_fifo_wrdata_t[1]} {hp2_burst_fifo_wrdata_t[2]} {hp2_burst_fifo_wrdata_t[3]} {hp2_burst_fifo_wrdata_t[4]} {hp2_burst_fifo_wrdata_t[5]} {hp2_burst_fifo_wrdata_t[6]} {hp2_burst_fifo_wrdata_t[7]} {hp2_burst_fifo_wrdata_t[8]} {hp2_burst_fifo_wrdata_t[9]} {hp2_burst_fifo_wrdata_t[10]} {hp2_burst_fifo_wrdata_t[11]} {hp2_burst_fifo_wrdata_t[12]} {hp2_burst_fifo_wrdata_t[13]} {hp2_burst_fifo_wrdata_t[14]} {hp2_burst_fifo_wrdata_t[15]} {hp2_burst_fifo_wrdata_t[16]} {hp2_burst_fifo_wrdata_t[17]} {hp2_burst_fifo_wrdata_t[18]} {hp2_burst_fifo_wrdata_t[19]} {hp2_burst_fifo_wrdata_t[20]} {hp2_burst_fifo_wrdata_t[21]} {hp2_burst_fifo_wrdata_t[22]} {hp2_burst_fifo_wrdata_t[23]} {hp2_burst_fifo_wrdata_t[24]} {hp2_burst_fifo_wrdata_t[25]} {hp2_burst_fifo_wrdata_t[26]} {hp2_burst_fifo_wrdata_t[27]} {hp2_burst_fifo_wrdata_t[28]} {hp2_burst_fifo_wrdata_t[29]} {hp2_burst_fifo_wrdata_t[30]} {hp2_burst_fifo_wrdata_t[31]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe12]
connect_debug_port u_ila_1_0/probe12 [get_nets [list fei4_a2_rx_1/dat_extrac_error_flg]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe13]
connect_debug_port u_ila_1_0/probe13 [get_nets [list fei4_a1_rx_1/dat_extrac_error_flg]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe14]
connect_debug_port u_ila_1_0/probe14 [get_nets [list fei4_a1_rx_1/data_deser/data_i]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe15]
connect_debug_port u_ila_1_0/probe15 [get_nets [list fei4_a2_rx_1/data_deser/data_i]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe16]
connect_debug_port u_ila_1_0/probe16 [get_nets [list fei4_a1_data_is_pix_dat]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe17]
connect_debug_port u_ila_1_0/probe17 [get_nets [list fei4_a2_data_is_pix_dat]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe18]
connect_debug_port u_ila_1_0/probe18 [get_nets [list fei4_a1_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe19]
connect_debug_port u_ila_1_0/probe19 [get_nets [list fei4_a2_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe20]
connect_debug_port u_ila_1_0/probe20 [get_nets [list fei4_a1_rx_1/data_deser/idle]]
create_debug_port u_ila_1_0 probe
set_property port_width 1 [get_debug_ports u_ila_1_0/probe21]
connect_debug_port u_ila_1_0/probe21 [get_nets [list fei4_a2_rx_1/data_deser/idle]]
create_debug_port u_ila_2_0 probe
set_property port_width 8 [get_debug_ports u_ila_2_0/probe1]
connect_debug_port u_ila_2_0/probe1 [get_nets [list {pl_iic/iic_master_test/data_rx[0]} {pl_iic/iic_master_test/data_rx[1]} {pl_iic/iic_master_test/data_rx[2]} {pl_iic/iic_master_test/data_rx[3]} {pl_iic/iic_master_test/data_rx[4]} {pl_iic/iic_master_test/data_rx[5]} {pl_iic/iic_master_test/data_rx[6]} {pl_iic/iic_master_test/data_rx[7]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 5 [get_debug_ports u_ila_2_0/probe2]
connect_debug_port u_ila_2_0/probe2 [get_nets [list {ccpd_cfg/ccpd_cfg/shift_cnt_limit[0]} {ccpd_cfg/ccpd_cfg/shift_cnt_limit[1]} {ccpd_cfg/ccpd_cfg/shift_cnt_limit[2]} {ccpd_cfg/ccpd_cfg/shift_cnt_limit[3]} {ccpd_cfg/ccpd_cfg/shift_cnt_limit[4]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 3 [get_debug_ports u_ila_2_0/probe3]
connect_debug_port u_ila_2_0/probe3 [get_nets [list {ccpd_cfg/ccpd_cfg/state[0]} {ccpd_cfg/ccpd_cfg/state[1]} {ccpd_cfg/ccpd_cfg/state[2]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 5 [get_debug_ports u_ila_2_0/probe4]
connect_debug_port u_ila_2_0/probe4 [get_nets [list {ccpd_cfg/ccpd_cfg/reg_cnt_limit[0]} {ccpd_cfg/ccpd_cfg/reg_cnt_limit[1]} {ccpd_cfg/ccpd_cfg/reg_cnt_limit[2]} {ccpd_cfg/ccpd_cfg/reg_cnt_limit[3]} {ccpd_cfg/ccpd_cfg/reg_cnt_limit[4]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe5]
connect_debug_port u_ila_2_0/probe5 [get_nets [list ccpd_cfg/ccpd_ckc]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe6]
connect_debug_port u_ila_2_0/probe6 [get_nets [list ccpd_ckc_b]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe7]
connect_debug_port u_ila_2_0/probe7 [get_nets [list ccpd_cfg/ccpd_ckd]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe8]
connect_debug_port u_ila_2_0/probe8 [get_nets [list ccpd_ckd_b]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe9]
connect_debug_port u_ila_2_0/probe9 [get_nets [list ccpd_inj_trigger_out]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe10]
connect_debug_port u_ila_2_0/probe10 [get_nets [list ccpd_cfg/ccpd_ld]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe11]
connect_debug_port u_ila_2_0/probe11 [get_nets [list ccpd_ld_b]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe12]
connect_debug_port u_ila_2_0/probe12 [get_nets [list ccpd_cfg/ccpd_sin]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe13]
connect_debug_port u_ila_2_0/probe13 [get_nets [list ccpd_sin_b]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe14]
connect_debug_port u_ila_2_0/probe14 [get_nets [list pl_iic/iic_master_test/sda_ena_n]]
create_debug_port u_ila_3_0 probe
set_property port_width 4 [get_debug_ports u_ila_3_0/probe1]
connect_debug_port u_ila_3_0/probe1 [get_nets [list {fei4_to_gbt/fei4_a2_data_2_gbt[0]} {fei4_to_gbt/fei4_a2_data_2_gbt[1]} {fei4_to_gbt/fei4_a2_data_2_gbt[2]} {fei4_to_gbt/fei4_a2_data_2_gbt[3]}]]
create_debug_port u_ila_3_0 probe
set_property port_width 84 [get_debug_ports u_ila_3_0/probe2]
connect_debug_port u_ila_3_0/probe2 [get_nets [list {gbt_fpga_tx_data[0]} {gbt_fpga_tx_data[1]} {gbt_fpga_tx_data[2]} {gbt_fpga_tx_data[3]} {gbt_fpga_tx_data[4]} {gbt_fpga_tx_data[5]} {gbt_fpga_tx_data[6]} {gbt_fpga_tx_data[7]} {gbt_fpga_tx_data[8]} {gbt_fpga_tx_data[9]} {gbt_fpga_tx_data[10]} {gbt_fpga_tx_data[11]} {gbt_fpga_tx_data[12]} {gbt_fpga_tx_data[13]} {gbt_fpga_tx_data[14]} {gbt_fpga_tx_data[15]} {gbt_fpga_tx_data[16]} {gbt_fpga_tx_data[17]} {gbt_fpga_tx_data[18]} {gbt_fpga_tx_data[19]} {gbt_fpga_tx_data[20]} {gbt_fpga_tx_data[21]} {gbt_fpga_tx_data[22]} {gbt_fpga_tx_data[23]} {gbt_fpga_tx_data[24]} {gbt_fpga_tx_data[25]} {gbt_fpga_tx_data[26]} {gbt_fpga_tx_data[27]} {gbt_fpga_tx_data[28]} {gbt_fpga_tx_data[29]} {gbt_fpga_tx_data[30]} {gbt_fpga_tx_data[31]} {gbt_fpga_tx_data[32]} {gbt_fpga_tx_data[33]} {gbt_fpga_tx_data[34]} {gbt_fpga_tx_data[35]} {gbt_fpga_tx_data[36]} {gbt_fpga_tx_data[37]} {gbt_fpga_tx_data[38]} {gbt_fpga_tx_data[39]} {gbt_fpga_tx_data[40]} {gbt_fpga_tx_data[41]} {gbt_fpga_tx_data[42]} {gbt_fpga_tx_data[43]} {gbt_fpga_tx_data[44]} {gbt_fpga_tx_data[45]} {gbt_fpga_tx_data[46]} {gbt_fpga_tx_data[47]} {gbt_fpga_tx_data[48]} {gbt_fpga_tx_data[49]} {gbt_fpga_tx_data[50]} {gbt_fpga_tx_data[51]} {gbt_fpga_tx_data[52]} {gbt_fpga_tx_data[53]} {gbt_fpga_tx_data[54]} {gbt_fpga_tx_data[55]} {gbt_fpga_tx_data[56]} {gbt_fpga_tx_data[57]} {gbt_fpga_tx_data[58]} {gbt_fpga_tx_data[59]} {gbt_fpga_tx_data[60]} {gbt_fpga_tx_data[61]} {gbt_fpga_tx_data[62]} {gbt_fpga_tx_data[63]} {gbt_fpga_tx_data[64]} {gbt_fpga_tx_data[65]} {gbt_fpga_tx_data[66]} {gbt_fpga_tx_data[67]} {gbt_fpga_tx_data[68]} {gbt_fpga_tx_data[69]} {gbt_fpga_tx_data[70]} {gbt_fpga_tx_data[71]} {gbt_fpga_tx_data[72]} {gbt_fpga_tx_data[73]} {gbt_fpga_tx_data[74]} {gbt_fpga_tx_data[75]} {gbt_fpga_tx_data[76]} {gbt_fpga_tx_data[77]} {gbt_fpga_tx_data[78]} {gbt_fpga_tx_data[79]} {gbt_fpga_tx_data[80]} {gbt_fpga_tx_data[81]} {gbt_fpga_tx_data[82]} {gbt_fpga_tx_data[83]}]]
create_debug_port u_ila_3_0 probe
set_property port_width 1 [get_debug_ports u_ila_3_0/probe3]
connect_debug_port u_ila_3_0/probe3 [get_nets [list fei4_to_gbt/fei4_a1_data_valid]]
create_debug_port u_ila_3_0 probe
set_property port_width 1 [get_debug_ports u_ila_3_0/probe4]
connect_debug_port u_ila_3_0/probe4 [get_nets [list fei4_to_gbt/fei4_a2_data_valid]]
create_debug_port u_ila_3_0 probe
set_property port_width 1 [get_debug_ports u_ila_3_0/probe5]
connect_debug_port u_ila_3_0/probe5 [get_nets [list gbt_fpga_tx_is_data]]
create_debug_port u_ila_4_0 probe
set_property port_width 1 [get_debug_ports u_ila_4_0/probe1]
connect_debug_port u_ila_4_0/probe1 [get_nets [list gbt_fpga_rx_is_data]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets ACLK]
