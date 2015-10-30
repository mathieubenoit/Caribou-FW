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

# FMC HPC LVDS OUTPUT
#set_property PACKAGE_PIN AJ16 [get_ports FMC_LVDS1_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS1_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS1_N]

#set_property PACKAGE_PIN AD16 [get_ports FMC_LVDS2_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS2_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS2_N]

#set_property PACKAGE_PIN AA15 [get_ports FMC_LVDS3_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS3_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS3_N]

#set_property PACKAGE_PIN AD14 [get_ports FMC_LVDS4_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS4_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS4_N]

#set_property PACKAGE_PIN AJ15 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS5_N]

set_property PACKAGE_PIN AH19 [get_ports HPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS6_P]
set_property IOSTANDARD LVDS_25 [get_ports HPC_LVDS6_N]

#set_property PACKAGE_PIN AE12 [get_ports FMC_LVDS7_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_N]

#set_property PACKAGE_PIN AE13 [get_ports FMC_LVDS8_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_N]

#set_property PACKAGE_PIN AH17 [get_ports FMC_LVDS9_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_N]

#set_property PACKAGE_PIN AH14 [get_ports FMC_LVDS10_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_N]

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

#set_property PACKAGE_PIN AE12   [get_ports FMC_LVDS7_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS7_N]

#set_property PACKAGE_PIN AE13   [get_ports FMC_LVDS8_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS8_N]

#set_property PACKAGE_PIN AH17   [get_ports FMC_LVDS9_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS9_N]

#set_property PACKAGE_PIN AH14   [get_ports FMC_LVDS10_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_P]
#set_property IOSTANDARD LVDS_25 [get_ports FMC_LVDS10_N]

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

connect_debug_port u_ila_1/probe0 [get_nets [list {gbt_ctrl_addr_o[0]} {gbt_ctrl_addr_o[1]} {gbt_ctrl_addr_o[2]} {gbt_ctrl_addr_o[3]} {gbt_ctrl_addr_o[4]} {gbt_ctrl_addr_o[5]} {gbt_ctrl_addr_o[6]} {gbt_ctrl_addr_o[7]} {gbt_ctrl_addr_o[8]} {gbt_ctrl_addr_o[9]} {gbt_ctrl_addr_o[10]} {gbt_ctrl_addr_o[11]} {gbt_ctrl_addr_o[12]} {gbt_ctrl_addr_o[13]} {gbt_ctrl_addr_o[14]}]]
connect_debug_port u_ila_1/probe1 [get_nets [list {gbt_ctrl_data_o[0]} {gbt_ctrl_data_o[1]} {gbt_ctrl_data_o[2]} {gbt_ctrl_data_o[3]} {gbt_ctrl_data_o[4]} {gbt_ctrl_data_o[5]} {gbt_ctrl_data_o[6]} {gbt_ctrl_data_o[7]} {gbt_ctrl_data_o[8]} {gbt_ctrl_data_o[9]} {gbt_ctrl_data_o[10]} {gbt_ctrl_data_o[11]} {gbt_ctrl_data_o[12]} {gbt_ctrl_data_o[13]} {gbt_ctrl_data_o[14]} {gbt_ctrl_data_o[15]} {gbt_ctrl_data_o[16]} {gbt_ctrl_data_o[17]} {gbt_ctrl_data_o[18]} {gbt_ctrl_data_o[19]} {gbt_ctrl_data_o[20]} {gbt_ctrl_data_o[21]} {gbt_ctrl_data_o[22]} {gbt_ctrl_data_o[23]} {gbt_ctrl_data_o[24]} {gbt_ctrl_data_o[25]} {gbt_ctrl_data_o[26]} {gbt_ctrl_data_o[27]} {gbt_ctrl_data_o[28]} {gbt_ctrl_data_o[29]} {gbt_ctrl_data_o[30]} {gbt_ctrl_data_o[31]}]]
connect_debug_port u_ila_1/probe2 [get_nets [list {gbt_ctrl_fe_num_o[0]} {gbt_ctrl_fe_num_o[1]} {gbt_ctrl_fe_num_o[2]} {gbt_ctrl_fe_num_o[3]}]]
connect_debug_port u_ila_1/probe8 [get_nets [list gbt_ctrl_data_valid_o]]




connect_debug_port u_ila_0/probe0 [get_nets [list {si570_clk_freq[0]} {si570_clk_freq[1]} {si570_clk_freq[2]} {si570_clk_freq[3]} {si570_clk_freq[4]} {si570_clk_freq[5]} {si570_clk_freq[6]} {si570_clk_freq[7]} {si570_clk_freq[8]} {si570_clk_freq[9]} {si570_clk_freq[10]} {si570_clk_freq[11]} {si570_clk_freq[12]} {si570_clk_freq[13]} {si570_clk_freq[14]} {si570_clk_freq[15]} {si570_clk_freq[16]} {si570_clk_freq[17]} {si570_clk_freq[18]} {si570_clk_freq[19]}]]


connect_debug_port u_ila_1/clk [get_nets [list gbt_fpga_rx_frame_clk]]
connect_debug_port u_ila_2/clk [get_nets [list gbt_fpga_tx_frame_clk]]
connect_debug_port u_ila_0/probe4 [get_nets [list {fei4_a1_rx_1/data_deser/fei4_data[0]} {fei4_a1_rx_1/data_deser/fei4_data[1]} {fei4_a1_rx_1/data_deser/fei4_data[2]} {fei4_a1_rx_1/data_deser/fei4_data[3]} {fei4_a1_rx_1/data_deser/fei4_data[4]} {fei4_a1_rx_1/data_deser/fei4_data[5]} {fei4_a1_rx_1/data_deser/fei4_data[6]} {fei4_a1_rx_1/data_deser/fei4_data[7]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {fei4_a2_rx_1/data_deser/fei4_data[0]} {fei4_a2_rx_1/data_deser/fei4_data[1]} {fei4_a2_rx_1/data_deser/fei4_data[2]} {fei4_a2_rx_1/data_deser/fei4_data[3]} {fei4_a2_rx_1/data_deser/fei4_data[4]} {fei4_a2_rx_1/data_deser/fei4_data[5]} {fei4_a2_rx_1/data_deser/fei4_data[6]} {fei4_a2_rx_1/data_deser/fei4_data[7]}]]
connect_debug_port dbg_hub/clk [get_nets gbt_fpga_tx_frame_clk]

connect_debug_port u_ila_0_0/probe12 [get_nets [list {axi_hp2_burst/axi_awaddr_i[0]} {axi_hp2_burst/axi_awaddr_i[1]} {axi_hp2_burst/axi_awaddr_i[2]} {axi_hp2_burst/axi_awaddr_i[3]} {axi_hp2_burst/axi_awaddr_i[4]} {axi_hp2_burst/axi_awaddr_i[5]} {axi_hp2_burst/axi_awaddr_i[6]} {axi_hp2_burst/axi_awaddr_i[7]} {axi_hp2_burst/axi_awaddr_i[8]} {axi_hp2_burst/axi_awaddr_i[9]} {axi_hp2_burst/axi_awaddr_i[10]} {axi_hp2_burst/axi_awaddr_i[11]} {axi_hp2_burst/axi_awaddr_i[12]} {axi_hp2_burst/axi_awaddr_i[13]} {axi_hp2_burst/axi_awaddr_i[14]} {axi_hp2_burst/axi_awaddr_i[15]} {axi_hp2_burst/axi_awaddr_i[16]} {axi_hp2_burst/axi_awaddr_i[17]} {axi_hp2_burst/axi_awaddr_i[18]} {axi_hp2_burst/axi_awaddr_i[19]} {axi_hp2_burst/axi_awaddr_i[20]} {axi_hp2_burst/axi_awaddr_i[21]} {axi_hp2_burst/axi_awaddr_i[22]} {axi_hp2_burst/axi_awaddr_i[23]} {axi_hp2_burst/axi_awaddr_i[24]} {axi_hp2_burst/axi_awaddr_i[25]} {axi_hp2_burst/axi_awaddr_i[26]} {axi_hp2_burst/axi_awaddr_i[27]}]]



connect_debug_port u_ila_0/probe1 [get_nets [list {fei4_a1_rx_1/data_deser/fei4_data_byte[0]} {fei4_a1_rx_1/data_deser/fei4_data_byte[1]} {fei4_a1_rx_1/data_deser/fei4_data_byte[2]} {fei4_a1_rx_1/data_deser/fei4_data_byte[3]} {fei4_a1_rx_1/data_deser/fei4_data_byte[4]} {fei4_a1_rx_1/data_deser/fei4_data_byte[5]} {fei4_a1_rx_1/data_deser/fei4_data_byte[6]} {fei4_a1_rx_1/data_deser/fei4_data_byte[7]} {fei4_a1_rx_1/data_deser/fei4_data_byte[8]} {fei4_a1_rx_1/data_deser/fei4_data_byte[9]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {fei4_a1_rx_1/fei4_data[0]} {fei4_a1_rx_1/fei4_data[1]} {fei4_a1_rx_1/fei4_data[2]} {fei4_a1_rx_1/fei4_data[3]} {fei4_a1_rx_1/fei4_data[4]} {fei4_a1_rx_1/fei4_data[5]} {fei4_a1_rx_1/fei4_data[6]} {fei4_a1_rx_1/fei4_data[7]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {fei4_a2_rx_1/data_deser/fei4_data_byte[0]} {fei4_a2_rx_1/data_deser/fei4_data_byte[1]} {fei4_a2_rx_1/data_deser/fei4_data_byte[2]} {fei4_a2_rx_1/data_deser/fei4_data_byte[3]} {fei4_a2_rx_1/data_deser/fei4_data_byte[4]} {fei4_a2_rx_1/data_deser/fei4_data_byte[5]} {fei4_a2_rx_1/data_deser/fei4_data_byte[6]} {fei4_a2_rx_1/data_deser/fei4_data_byte[7]} {fei4_a2_rx_1/data_deser/fei4_data_byte[8]} {fei4_a2_rx_1/data_deser/fei4_data_byte[9]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {fei4_a2_rx_1/fei4_data[0]} {fei4_a2_rx_1/fei4_data[1]} {fei4_a2_rx_1/fei4_data[2]} {fei4_a2_rx_1/fei4_data[3]} {fei4_a2_rx_1/fei4_data[4]} {fei4_a2_rx_1/fei4_data[5]} {fei4_a2_rx_1/fei4_data[6]} {fei4_a2_rx_1/fei4_data[7]}]]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ACLK]]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {ccpd_cfg/ccpd_cfg/state[0]} {ccpd_cfg/ccpd_cfg/state[1]} {ccpd_cfg/ccpd_cfg/state[2]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list clk160]]
set_property port_width 32 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {hp2_burst_fifo_wrdata_t[0]} {hp2_burst_fifo_wrdata_t[1]} {hp2_burst_fifo_wrdata_t[2]} {hp2_burst_fifo_wrdata_t[3]} {hp2_burst_fifo_wrdata_t[4]} {hp2_burst_fifo_wrdata_t[5]} {hp2_burst_fifo_wrdata_t[6]} {hp2_burst_fifo_wrdata_t[7]} {hp2_burst_fifo_wrdata_t[8]} {hp2_burst_fifo_wrdata_t[9]} {hp2_burst_fifo_wrdata_t[10]} {hp2_burst_fifo_wrdata_t[11]} {hp2_burst_fifo_wrdata_t[12]} {hp2_burst_fifo_wrdata_t[13]} {hp2_burst_fifo_wrdata_t[14]} {hp2_burst_fifo_wrdata_t[15]} {hp2_burst_fifo_wrdata_t[16]} {hp2_burst_fifo_wrdata_t[17]} {hp2_burst_fifo_wrdata_t[18]} {hp2_burst_fifo_wrdata_t[19]} {hp2_burst_fifo_wrdata_t[20]} {hp2_burst_fifo_wrdata_t[21]} {hp2_burst_fifo_wrdata_t[22]} {hp2_burst_fifo_wrdata_t[23]} {hp2_burst_fifo_wrdata_t[24]} {hp2_burst_fifo_wrdata_t[25]} {hp2_burst_fifo_wrdata_t[26]} {hp2_burst_fifo_wrdata_t[27]} {hp2_burst_fifo_wrdata_t[28]} {hp2_burst_fifo_wrdata_t[29]} {hp2_burst_fifo_wrdata_t[30]} {hp2_burst_fifo_wrdata_t[31]}]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list USER_SMA_P_OBUF]]
set_property port_width 84 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {gbt_fpga_tx_data[0]} {gbt_fpga_tx_data[1]} {gbt_fpga_tx_data[2]} {gbt_fpga_tx_data[3]} {gbt_fpga_tx_data[4]} {gbt_fpga_tx_data[5]} {gbt_fpga_tx_data[6]} {gbt_fpga_tx_data[7]} {gbt_fpga_tx_data[8]} {gbt_fpga_tx_data[9]} {gbt_fpga_tx_data[10]} {gbt_fpga_tx_data[11]} {gbt_fpga_tx_data[12]} {gbt_fpga_tx_data[13]} {gbt_fpga_tx_data[14]} {gbt_fpga_tx_data[15]} {gbt_fpga_tx_data[16]} {gbt_fpga_tx_data[17]} {gbt_fpga_tx_data[18]} {gbt_fpga_tx_data[19]} {gbt_fpga_tx_data[20]} {gbt_fpga_tx_data[21]} {gbt_fpga_tx_data[22]} {gbt_fpga_tx_data[23]} {gbt_fpga_tx_data[24]} {gbt_fpga_tx_data[25]} {gbt_fpga_tx_data[26]} {gbt_fpga_tx_data[27]} {gbt_fpga_tx_data[28]} {gbt_fpga_tx_data[29]} {gbt_fpga_tx_data[30]} {gbt_fpga_tx_data[31]} {gbt_fpga_tx_data[32]} {gbt_fpga_tx_data[33]} {gbt_fpga_tx_data[34]} {gbt_fpga_tx_data[35]} {gbt_fpga_tx_data[36]} {gbt_fpga_tx_data[37]} {gbt_fpga_tx_data[38]} {gbt_fpga_tx_data[39]} {gbt_fpga_tx_data[40]} {gbt_fpga_tx_data[41]} {gbt_fpga_tx_data[42]} {gbt_fpga_tx_data[43]} {gbt_fpga_tx_data[44]} {gbt_fpga_tx_data[45]} {gbt_fpga_tx_data[46]} {gbt_fpga_tx_data[47]} {gbt_fpga_tx_data[48]} {gbt_fpga_tx_data[49]} {gbt_fpga_tx_data[50]} {gbt_fpga_tx_data[51]} {gbt_fpga_tx_data[52]} {gbt_fpga_tx_data[53]} {gbt_fpga_tx_data[54]} {gbt_fpga_tx_data[55]} {gbt_fpga_tx_data[56]} {gbt_fpga_tx_data[57]} {gbt_fpga_tx_data[58]} {gbt_fpga_tx_data[59]} {gbt_fpga_tx_data[60]} {gbt_fpga_tx_data[61]} {gbt_fpga_tx_data[62]} {gbt_fpga_tx_data[63]} {gbt_fpga_tx_data[64]} {gbt_fpga_tx_data[65]} {gbt_fpga_tx_data[66]} {gbt_fpga_tx_data[67]} {gbt_fpga_tx_data[68]} {gbt_fpga_tx_data[69]} {gbt_fpga_tx_data[70]} {gbt_fpga_tx_data[71]} {gbt_fpga_tx_data[72]} {gbt_fpga_tx_data[73]} {gbt_fpga_tx_data[74]} {gbt_fpga_tx_data[75]} {gbt_fpga_tx_data[76]} {gbt_fpga_tx_data[77]} {gbt_fpga_tx_data[78]} {gbt_fpga_tx_data[79]} {gbt_fpga_tx_data[80]} {gbt_fpga_tx_data[81]} {gbt_fpga_tx_data[82]} {gbt_fpga_tx_data[83]}]]
create_debug_core u_ila_3 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_3]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_3]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_3]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_3]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_3]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_3]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_3]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_3]
set_property port_width 1 [get_debug_ports u_ila_3/clk]
connect_debug_port u_ila_3/clk [get_nets [list USER_SMA_N_OBUF]]
set_property port_width 32 [get_debug_ports u_ila_3/probe0]
connect_debug_port u_ila_3/probe0 [get_nets [list {gbt_slow_ctronl/reg0[0]} {gbt_slow_ctronl/reg0[1]} {gbt_slow_ctronl/reg0[2]} {gbt_slow_ctronl/reg0[3]} {gbt_slow_ctronl/reg0[4]} {gbt_slow_ctronl/reg0[5]} {gbt_slow_ctronl/reg0[6]} {gbt_slow_ctronl/reg0[7]} {gbt_slow_ctronl/reg0[8]} {gbt_slow_ctronl/reg0[9]} {gbt_slow_ctronl/reg0[10]} {gbt_slow_ctronl/reg0[11]} {gbt_slow_ctronl/reg0[12]} {gbt_slow_ctronl/reg0[13]} {gbt_slow_ctronl/reg0[14]} {gbt_slow_ctronl/reg0[15]} {gbt_slow_ctronl/reg0[16]} {gbt_slow_ctronl/reg0[17]} {gbt_slow_ctronl/reg0[18]} {gbt_slow_ctronl/reg0[19]} {gbt_slow_ctronl/reg0[20]} {gbt_slow_ctronl/reg0[21]} {gbt_slow_ctronl/reg0[22]} {gbt_slow_ctronl/reg0[23]} {gbt_slow_ctronl/reg0[24]} {gbt_slow_ctronl/reg0[25]} {gbt_slow_ctronl/reg0[26]} {gbt_slow_ctronl/reg0[27]} {gbt_slow_ctronl/reg0[28]} {gbt_slow_ctronl/reg0[29]} {gbt_slow_ctronl/reg0[30]} {gbt_slow_ctronl/reg0[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {ccpd_cfg/ram_rd_dat[0]} {ccpd_cfg/ram_rd_dat[1]} {ccpd_cfg/ram_rd_dat[2]} {ccpd_cfg/ram_rd_dat[3]} {ccpd_cfg/ram_rd_dat[4]} {ccpd_cfg/ram_rd_dat[5]} {ccpd_cfg/ram_rd_dat[6]} {ccpd_cfg/ram_rd_dat[7]} {ccpd_cfg/ram_rd_dat[8]} {ccpd_cfg/ram_rd_dat[9]} {ccpd_cfg/ram_rd_dat[10]} {ccpd_cfg/ram_rd_dat[11]} {ccpd_cfg/ram_rd_dat[12]} {ccpd_cfg/ram_rd_dat[13]} {ccpd_cfg/ram_rd_dat[14]} {ccpd_cfg/ram_rd_dat[15]} {ccpd_cfg/ram_rd_dat[16]} {ccpd_cfg/ram_rd_dat[17]} {ccpd_cfg/ram_rd_dat[18]} {ccpd_cfg/ram_rd_dat[19]} {ccpd_cfg/ram_rd_dat[20]} {ccpd_cfg/ram_rd_dat[21]} {ccpd_cfg/ram_rd_dat[22]} {ccpd_cfg/ram_rd_dat[23]} {ccpd_cfg/ram_rd_dat[24]} {ccpd_cfg/ram_rd_dat[25]} {ccpd_cfg/ram_rd_dat[26]} {ccpd_cfg/ram_rd_dat[27]} {ccpd_cfg/ram_rd_dat[28]} {ccpd_cfg/ram_rd_dat[29]} {ccpd_cfg/ram_rd_dat[30]} {ccpd_cfg/ram_rd_dat[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {ccpd_cfg/ram_addr[0]} {ccpd_cfg/ram_addr[1]} {ccpd_cfg/ram_addr[2]} {ccpd_cfg/ram_addr[3]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {ccpd_cfg/reg0[0]} {ccpd_cfg/reg0[1]} {ccpd_cfg/reg0[2]} {ccpd_cfg/reg0[3]} {ccpd_cfg/reg0[4]} {ccpd_cfg/reg0[5]} {ccpd_cfg/reg0[6]} {ccpd_cfg/reg0[7]} {ccpd_cfg/reg0[8]} {ccpd_cfg/reg0[9]} {ccpd_cfg/reg0[10]} {ccpd_cfg/reg0[11]} {ccpd_cfg/reg0[12]} {ccpd_cfg/reg0[13]} {ccpd_cfg/reg0[14]} {ccpd_cfg/reg0[15]} {ccpd_cfg/reg0[16]} {ccpd_cfg/reg0[17]} {ccpd_cfg/reg0[18]} {ccpd_cfg/reg0[19]} {ccpd_cfg/reg0[20]} {ccpd_cfg/reg0[21]} {ccpd_cfg/reg0[22]} {ccpd_cfg/reg0[23]} {ccpd_cfg/reg0[24]} {ccpd_cfg/reg0[25]} {ccpd_cfg/reg0[26]} {ccpd_cfg/reg0[27]} {ccpd_cfg/reg0[28]} {ccpd_cfg/reg0[29]} {ccpd_cfg/reg0[30]} {ccpd_cfg/reg0[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {ccpd_cfg/ram_wr_dat[0]} {ccpd_cfg/ram_wr_dat[1]} {ccpd_cfg/ram_wr_dat[2]} {ccpd_cfg/ram_wr_dat[3]} {ccpd_cfg/ram_wr_dat[4]} {ccpd_cfg/ram_wr_dat[5]} {ccpd_cfg/ram_wr_dat[6]} {ccpd_cfg/ram_wr_dat[7]} {ccpd_cfg/ram_wr_dat[8]} {ccpd_cfg/ram_wr_dat[9]} {ccpd_cfg/ram_wr_dat[10]} {ccpd_cfg/ram_wr_dat[11]} {ccpd_cfg/ram_wr_dat[12]} {ccpd_cfg/ram_wr_dat[13]} {ccpd_cfg/ram_wr_dat[14]} {ccpd_cfg/ram_wr_dat[15]} {ccpd_cfg/ram_wr_dat[16]} {ccpd_cfg/ram_wr_dat[17]} {ccpd_cfg/ram_wr_dat[18]} {ccpd_cfg/ram_wr_dat[19]} {ccpd_cfg/ram_wr_dat[20]} {ccpd_cfg/ram_wr_dat[21]} {ccpd_cfg/ram_wr_dat[22]} {ccpd_cfg/ram_wr_dat[23]} {ccpd_cfg/ram_wr_dat[24]} {ccpd_cfg/ram_wr_dat[25]} {ccpd_cfg/ram_wr_dat[26]} {ccpd_cfg/ram_wr_dat[27]} {ccpd_cfg/ram_wr_dat[28]} {ccpd_cfg/ram_wr_dat[29]} {ccpd_cfg/ram_wr_dat[30]} {ccpd_cfg/ram_wr_dat[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {ccpd_cfg/reg1[0]} {ccpd_cfg/reg1[1]} {ccpd_cfg/reg1[2]} {ccpd_cfg/reg1[3]} {ccpd_cfg/reg1[4]} {ccpd_cfg/reg1[5]} {ccpd_cfg/reg1[6]} {ccpd_cfg/reg1[7]} {ccpd_cfg/reg1[8]} {ccpd_cfg/reg1[9]} {ccpd_cfg/reg1[10]} {ccpd_cfg/reg1[11]} {ccpd_cfg/reg1[12]} {ccpd_cfg/reg1[13]} {ccpd_cfg/reg1[14]} {ccpd_cfg/reg1[15]} {ccpd_cfg/reg1[16]} {ccpd_cfg/reg1[17]} {ccpd_cfg/reg1[18]} {ccpd_cfg/reg1[19]} {ccpd_cfg/reg1[20]} {ccpd_cfg/reg1[21]} {ccpd_cfg/reg1[22]} {ccpd_cfg/reg1[23]} {ccpd_cfg/reg1[24]} {ccpd_cfg/reg1[25]} {ccpd_cfg/reg1[26]} {ccpd_cfg/reg1[27]} {ccpd_cfg/reg1[28]} {ccpd_cfg/reg1[29]} {ccpd_cfg/reg1[30]} {ccpd_cfg/reg1[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {ccpd_cfg/reg3[0]} {ccpd_cfg/reg3[1]} {ccpd_cfg/reg3[2]} {ccpd_cfg/reg3[3]} {ccpd_cfg/reg3[4]} {ccpd_cfg/reg3[5]} {ccpd_cfg/reg3[6]} {ccpd_cfg/reg3[7]} {ccpd_cfg/reg3[8]} {ccpd_cfg/reg3[9]} {ccpd_cfg/reg3[10]} {ccpd_cfg/reg3[11]} {ccpd_cfg/reg3[12]} {ccpd_cfg/reg3[13]} {ccpd_cfg/reg3[14]} {ccpd_cfg/reg3[15]} {ccpd_cfg/reg3[16]} {ccpd_cfg/reg3[17]} {ccpd_cfg/reg3[18]} {ccpd_cfg/reg3[19]} {ccpd_cfg/reg3[20]} {ccpd_cfg/reg3[21]} {ccpd_cfg/reg3[22]} {ccpd_cfg/reg3[23]} {ccpd_cfg/reg3[24]} {ccpd_cfg/reg3[25]} {ccpd_cfg/reg3[26]} {ccpd_cfg/reg3[27]} {ccpd_cfg/reg3[28]} {ccpd_cfg/reg3[29]} {ccpd_cfg/reg3[30]} {ccpd_cfg/reg3[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {ccpd_cfg/reg2[0]} {ccpd_cfg/reg2[1]} {ccpd_cfg/reg2[2]} {ccpd_cfg/reg2[3]} {ccpd_cfg/reg2[4]} {ccpd_cfg/reg2[5]} {ccpd_cfg/reg2[6]} {ccpd_cfg/reg2[7]} {ccpd_cfg/reg2[8]} {ccpd_cfg/reg2[9]} {ccpd_cfg/reg2[10]} {ccpd_cfg/reg2[11]} {ccpd_cfg/reg2[12]} {ccpd_cfg/reg2[13]} {ccpd_cfg/reg2[14]} {ccpd_cfg/reg2[15]} {ccpd_cfg/reg2[16]} {ccpd_cfg/reg2[17]} {ccpd_cfg/reg2[18]} {ccpd_cfg/reg2[19]} {ccpd_cfg/reg2[20]} {ccpd_cfg/reg2[21]} {ccpd_cfg/reg2[22]} {ccpd_cfg/reg2[23]} {ccpd_cfg/reg2[24]} {ccpd_cfg/reg2[25]} {ccpd_cfg/reg2[26]} {ccpd_cfg/reg2[27]} {ccpd_cfg/reg2[28]} {ccpd_cfg/reg2[29]} {ccpd_cfg/reg2[30]} {ccpd_cfg/reg2[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pl_iic/iic_master_test/data_rx[0]} {pl_iic/iic_master_test/data_rx[1]} {pl_iic/iic_master_test/data_rx[2]} {pl_iic/iic_master_test/data_rx[3]} {pl_iic/iic_master_test/data_rx[4]} {pl_iic/iic_master_test/data_rx[5]} {pl_iic/iic_master_test/data_rx[6]} {pl_iic/iic_master_test/data_rx[7]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {axi_hp2_burst/axi_awaddr[0]} {axi_hp2_burst/axi_awaddr[1]} {axi_hp2_burst/axi_awaddr[2]} {axi_hp2_burst/axi_awaddr[3]} {axi_hp2_burst/axi_awaddr[4]} {axi_hp2_burst/axi_awaddr[5]} {axi_hp2_burst/axi_awaddr[6]} {axi_hp2_burst/axi_awaddr[7]} {axi_hp2_burst/axi_awaddr[8]} {axi_hp2_burst/axi_awaddr[9]} {axi_hp2_burst/axi_awaddr[10]} {axi_hp2_burst/axi_awaddr[11]} {axi_hp2_burst/axi_awaddr[12]} {axi_hp2_burst/axi_awaddr[13]} {axi_hp2_burst/axi_awaddr[14]} {axi_hp2_burst/axi_awaddr[15]} {axi_hp2_burst/axi_awaddr[16]} {axi_hp2_burst/axi_awaddr[17]} {axi_hp2_burst/axi_awaddr[18]} {axi_hp2_burst/axi_awaddr[19]} {axi_hp2_burst/axi_awaddr[20]} {axi_hp2_burst/axi_awaddr[21]} {axi_hp2_burst/axi_awaddr[22]} {axi_hp2_burst/axi_awaddr[23]} {axi_hp2_burst/axi_awaddr[24]} {axi_hp2_burst/axi_awaddr[25]} {axi_hp2_burst/axi_awaddr[26]} {axi_hp2_burst/axi_awaddr[27]} {axi_hp2_burst/axi_awaddr[28]} {axi_hp2_burst/axi_awaddr[29]} {axi_hp2_burst/axi_awaddr[30]} {axi_hp2_burst/axi_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {axi_hp2_burst/fifo_rdcnt_i[0]} {axi_hp2_burst/fifo_rdcnt_i[1]} {axi_hp2_burst/fifo_rdcnt_i[2]} {axi_hp2_burst/fifo_rdcnt_i[3]} {axi_hp2_burst/fifo_rdcnt_i[4]} {axi_hp2_burst/fifo_rdcnt_i[5]} {axi_hp2_burst/fifo_rdcnt_i[6]} {axi_hp2_burst/fifo_rdcnt_i[7]}]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {axi_hp2_burst/state[0]} {axi_hp2_burst/state[1]} {axi_hp2_burst/state[2]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {axi_hp2_burst/dout[0]} {axi_hp2_burst/dout[1]} {axi_hp2_burst/dout[2]} {axi_hp2_burst/dout[3]} {axi_hp2_burst/dout[4]} {axi_hp2_burst/dout[5]} {axi_hp2_burst/dout[6]} {axi_hp2_burst/dout[7]} {axi_hp2_burst/dout[8]} {axi_hp2_burst/dout[9]} {axi_hp2_burst/dout[10]} {axi_hp2_burst/dout[11]} {axi_hp2_burst/dout[12]} {axi_hp2_burst/dout[13]} {axi_hp2_burst/dout[14]} {axi_hp2_burst/dout[15]} {axi_hp2_burst/dout[16]} {axi_hp2_burst/dout[17]} {axi_hp2_burst/dout[18]} {axi_hp2_burst/dout[19]} {axi_hp2_burst/dout[20]} {axi_hp2_burst/dout[21]} {axi_hp2_burst/dout[22]} {axi_hp2_burst/dout[23]} {axi_hp2_burst/dout[24]} {axi_hp2_burst/dout[25]} {axi_hp2_burst/dout[26]} {axi_hp2_burst/dout[27]} {axi_hp2_burst/dout[28]} {axi_hp2_burst/dout[29]} {axi_hp2_burst/dout[30]} {axi_hp2_burst/dout[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list axi_hp2_burst/axi_awready]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list axi_hp2_burst/axi_awvalid]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list axi_hp2_burst/axi_wlast]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list axi_hp2_burst/axi_wready]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list axi_hp2_burst/axi_wvalid]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list ccpd_cfg/ccpd_ckc]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list ccpd_cfg/ccpd_ckd]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list ccpd_cfg/ccpd_ld]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list ccpd_cfg/ccpd_sin]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list axi_hp2_burst/fifo_empty]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list axi_hp2_burst/fifo_full]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list axi_hp2_burst/fifo_rden]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list axi_hp2_burst/last_rd_tri_i]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list ccpd_cfg/ram_wr_en]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list pl_iic/iic_master_test/sda_ena_n]]
create_debug_port u_ila_1 probe
set_property port_width 2 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {fei4_a2_rx_1/data_deser/rx_state[0]} {fei4_a2_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_1 probe
set_property port_width 16 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {fei4_a2_rx_1/data_extract/reg_addr[0]} {fei4_a2_rx_1/data_extract/reg_addr[1]} {fei4_a2_rx_1/data_extract/reg_addr[2]} {fei4_a2_rx_1/data_extract/reg_addr[3]} {fei4_a2_rx_1/data_extract/reg_addr[4]} {fei4_a2_rx_1/data_extract/reg_addr[5]} {fei4_a2_rx_1/data_extract/reg_addr[6]} {fei4_a2_rx_1/data_extract/reg_addr[7]} {fei4_a2_rx_1/data_extract/reg_addr[8]} {fei4_a2_rx_1/data_extract/reg_addr[9]} {fei4_a2_rx_1/data_extract/reg_addr[10]} {fei4_a2_rx_1/data_extract/reg_addr[11]} {fei4_a2_rx_1/data_extract/reg_addr[12]} {fei4_a2_rx_1/data_extract/reg_addr[13]} {fei4_a2_rx_1/data_extract/reg_addr[14]} {fei4_a2_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_1 probe
set_property port_width 16 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {fei4_a2_rx_1/data_extract/reg_value[0]} {fei4_a2_rx_1/data_extract/reg_value[1]} {fei4_a2_rx_1/data_extract/reg_value[2]} {fei4_a2_rx_1/data_extract/reg_value[3]} {fei4_a2_rx_1/data_extract/reg_value[4]} {fei4_a2_rx_1/data_extract/reg_value[5]} {fei4_a2_rx_1/data_extract/reg_value[6]} {fei4_a2_rx_1/data_extract/reg_value[7]} {fei4_a2_rx_1/data_extract/reg_value[8]} {fei4_a2_rx_1/data_extract/reg_value[9]} {fei4_a2_rx_1/data_extract/reg_value[10]} {fei4_a2_rx_1/data_extract/reg_value[11]} {fei4_a2_rx_1/data_extract/reg_value[12]} {fei4_a2_rx_1/data_extract/reg_value[13]} {fei4_a2_rx_1/data_extract/reg_value[14]} {fei4_a2_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_1 probe
set_property port_width 4 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {fei4_a2_rx_1/data_extract/state[0]} {fei4_a2_rx_1/data_extract/state[1]} {fei4_a2_rx_1/data_extract/state[2]} {fei4_a2_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_1 probe
set_property port_width 4 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {fei4_a2_rx_1/dat_extrac_state[0]} {fei4_a2_rx_1/dat_extrac_state[1]} {fei4_a2_rx_1/dat_extrac_state[2]} {fei4_a2_rx_1/dat_extrac_state[3]}]]
create_debug_port u_ila_1 probe
set_property port_width 11 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {fei4_a1_cfg/cal_cmd_cnt[0]} {fei4_a1_cfg/cal_cmd_cnt[1]} {fei4_a1_cfg/cal_cmd_cnt[2]} {fei4_a1_cfg/cal_cmd_cnt[3]} {fei4_a1_cfg/cal_cmd_cnt[4]} {fei4_a1_cfg/cal_cmd_cnt[5]} {fei4_a1_cfg/cal_cmd_cnt[6]} {fei4_a1_cfg/cal_cmd_cnt[7]} {fei4_a1_cfg/cal_cmd_cnt[8]} {fei4_a1_cfg/cal_cmd_cnt[9]} {fei4_a1_cfg/cal_cmd_cnt[10]}]]
create_debug_port u_ila_1 probe
set_property port_width 4 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {fei4_a1_cfg/cfg_state[0]} {fei4_a1_cfg/cfg_state[1]} {fei4_a1_cfg/cfg_state[2]} {fei4_a1_cfg/cfg_state[3]}]]
create_debug_port u_ila_1 probe
set_property port_width 2 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {fei4_a1_rx_1/data_deser/rx_state[0]} {fei4_a1_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_1 probe
set_property port_width 16 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {fei4_a1_rx_1/data_extract/reg_addr[0]} {fei4_a1_rx_1/data_extract/reg_addr[1]} {fei4_a1_rx_1/data_extract/reg_addr[2]} {fei4_a1_rx_1/data_extract/reg_addr[3]} {fei4_a1_rx_1/data_extract/reg_addr[4]} {fei4_a1_rx_1/data_extract/reg_addr[5]} {fei4_a1_rx_1/data_extract/reg_addr[6]} {fei4_a1_rx_1/data_extract/reg_addr[7]} {fei4_a1_rx_1/data_extract/reg_addr[8]} {fei4_a1_rx_1/data_extract/reg_addr[9]} {fei4_a1_rx_1/data_extract/reg_addr[10]} {fei4_a1_rx_1/data_extract/reg_addr[11]} {fei4_a1_rx_1/data_extract/reg_addr[12]} {fei4_a1_rx_1/data_extract/reg_addr[13]} {fei4_a1_rx_1/data_extract/reg_addr[14]} {fei4_a1_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_1 probe
set_property port_width 16 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {fei4_a1_rx_1/data_extract/reg_value[0]} {fei4_a1_rx_1/data_extract/reg_value[1]} {fei4_a1_rx_1/data_extract/reg_value[2]} {fei4_a1_rx_1/data_extract/reg_value[3]} {fei4_a1_rx_1/data_extract/reg_value[4]} {fei4_a1_rx_1/data_extract/reg_value[5]} {fei4_a1_rx_1/data_extract/reg_value[6]} {fei4_a1_rx_1/data_extract/reg_value[7]} {fei4_a1_rx_1/data_extract/reg_value[8]} {fei4_a1_rx_1/data_extract/reg_value[9]} {fei4_a1_rx_1/data_extract/reg_value[10]} {fei4_a1_rx_1/data_extract/reg_value[11]} {fei4_a1_rx_1/data_extract/reg_value[12]} {fei4_a1_rx_1/data_extract/reg_value[13]} {fei4_a1_rx_1/data_extract/reg_value[14]} {fei4_a1_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_1 probe
set_property port_width 4 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {fei4_a1_rx_1/data_extract/state[0]} {fei4_a1_rx_1/data_extract/state[1]} {fei4_a1_rx_1/data_extract/state[2]} {fei4_a1_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_1 probe
set_property port_width 4 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {fei4_a1_rx_1/dat_extrac_state[0]} {fei4_a1_rx_1/dat_extrac_state[1]} {fei4_a1_rx_1/dat_extrac_state[2]} {fei4_a1_rx_1/dat_extrac_state[3]}]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list fei4_a2_rx_1/dat_extrac_error_flg]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list fei4_a1_rx_1/dat_extrac_error_flg]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list fei4_a2_rx_1/data_deser/data_i]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list fei4_a1_rx_1/data_deser/data_i]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list fei4_a1_data_is_pix_dat]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list fei4_a2_data_is_pix_dat]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list fei4_cmd_out]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list fei4_a2_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list fei4_a1_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list fei4_a1_rx_1/data_deser/idle]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list fei4_a2_rx_1/data_deser/idle]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list fei4_a1_rx_1/data_deser/sync_tri]]
create_debug_port u_ila_1 probe
set_property port_width 1 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list fei4_a2_rx_1/data_deser/sync_tri]]
create_debug_port u_ila_2 probe
set_property port_width 4 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {fei4_to_gbt/fei4_a1_data_2_gbt[0]} {fei4_to_gbt/fei4_a1_data_2_gbt[1]} {fei4_to_gbt/fei4_a1_data_2_gbt[2]} {fei4_to_gbt/fei4_a1_data_2_gbt[3]}]]
create_debug_port u_ila_2 probe
set_property port_width 4 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {fei4_to_gbt/fei4_a2_data_2_gbt[0]} {fei4_to_gbt/fei4_a2_data_2_gbt[1]} {fei4_to_gbt/fei4_a2_data_2_gbt[2]} {fei4_to_gbt/fei4_a2_data_2_gbt[3]}]]
create_debug_port u_ila_2 probe
set_property port_width 1 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list fei4_to_gbt/fei4_a1_data_valid]]
create_debug_port u_ila_2 probe
set_property port_width 1 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list fei4_to_gbt/fei4_a2_data_valid]]
create_debug_port u_ila_2 probe
set_property port_width 1 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list gbt_fpga_tx_is_data]]
create_debug_port u_ila_3 probe
set_property port_width 32 [get_debug_ports u_ila_3/probe1]
connect_debug_port u_ila_3/probe1 [get_nets [list {gbt_slow_ctronl/reg1[0]} {gbt_slow_ctronl/reg1[1]} {gbt_slow_ctronl/reg1[2]} {gbt_slow_ctronl/reg1[3]} {gbt_slow_ctronl/reg1[4]} {gbt_slow_ctronl/reg1[5]} {gbt_slow_ctronl/reg1[6]} {gbt_slow_ctronl/reg1[7]} {gbt_slow_ctronl/reg1[8]} {gbt_slow_ctronl/reg1[9]} {gbt_slow_ctronl/reg1[10]} {gbt_slow_ctronl/reg1[11]} {gbt_slow_ctronl/reg1[12]} {gbt_slow_ctronl/reg1[13]} {gbt_slow_ctronl/reg1[14]} {gbt_slow_ctronl/reg1[15]} {gbt_slow_ctronl/reg1[16]} {gbt_slow_ctronl/reg1[17]} {gbt_slow_ctronl/reg1[18]} {gbt_slow_ctronl/reg1[19]} {gbt_slow_ctronl/reg1[20]} {gbt_slow_ctronl/reg1[21]} {gbt_slow_ctronl/reg1[22]} {gbt_slow_ctronl/reg1[23]} {gbt_slow_ctronl/reg1[24]} {gbt_slow_ctronl/reg1[25]} {gbt_slow_ctronl/reg1[26]} {gbt_slow_ctronl/reg1[27]} {gbt_slow_ctronl/reg1[28]} {gbt_slow_ctronl/reg1[29]} {gbt_slow_ctronl/reg1[30]} {gbt_slow_ctronl/reg1[31]}]]
create_debug_port u_ila_3 probe
set_property port_width 84 [get_debug_ports u_ila_3/probe2]
connect_debug_port u_ila_3/probe2 [get_nets [list {gbt_fpga_rx_data[0]} {gbt_fpga_rx_data[1]} {gbt_fpga_rx_data[2]} {gbt_fpga_rx_data[3]} {gbt_fpga_rx_data[4]} {gbt_fpga_rx_data[5]} {gbt_fpga_rx_data[6]} {gbt_fpga_rx_data[7]} {gbt_fpga_rx_data[8]} {gbt_fpga_rx_data[9]} {gbt_fpga_rx_data[10]} {gbt_fpga_rx_data[11]} {gbt_fpga_rx_data[12]} {gbt_fpga_rx_data[13]} {gbt_fpga_rx_data[14]} {gbt_fpga_rx_data[15]} {gbt_fpga_rx_data[16]} {gbt_fpga_rx_data[17]} {gbt_fpga_rx_data[18]} {gbt_fpga_rx_data[19]} {gbt_fpga_rx_data[20]} {gbt_fpga_rx_data[21]} {gbt_fpga_rx_data[22]} {gbt_fpga_rx_data[23]} {gbt_fpga_rx_data[24]} {gbt_fpga_rx_data[25]} {gbt_fpga_rx_data[26]} {gbt_fpga_rx_data[27]} {gbt_fpga_rx_data[28]} {gbt_fpga_rx_data[29]} {gbt_fpga_rx_data[30]} {gbt_fpga_rx_data[31]} {gbt_fpga_rx_data[32]} {gbt_fpga_rx_data[33]} {gbt_fpga_rx_data[34]} {gbt_fpga_rx_data[35]} {gbt_fpga_rx_data[36]} {gbt_fpga_rx_data[37]} {gbt_fpga_rx_data[38]} {gbt_fpga_rx_data[39]} {gbt_fpga_rx_data[40]} {gbt_fpga_rx_data[41]} {gbt_fpga_rx_data[42]} {gbt_fpga_rx_data[43]} {gbt_fpga_rx_data[44]} {gbt_fpga_rx_data[45]} {gbt_fpga_rx_data[46]} {gbt_fpga_rx_data[47]} {gbt_fpga_rx_data[48]} {gbt_fpga_rx_data[49]} {gbt_fpga_rx_data[50]} {gbt_fpga_rx_data[51]} {gbt_fpga_rx_data[52]} {gbt_fpga_rx_data[53]} {gbt_fpga_rx_data[54]} {gbt_fpga_rx_data[55]} {gbt_fpga_rx_data[56]} {gbt_fpga_rx_data[57]} {gbt_fpga_rx_data[58]} {gbt_fpga_rx_data[59]} {gbt_fpga_rx_data[60]} {gbt_fpga_rx_data[61]} {gbt_fpga_rx_data[62]} {gbt_fpga_rx_data[63]} {gbt_fpga_rx_data[64]} {gbt_fpga_rx_data[65]} {gbt_fpga_rx_data[66]} {gbt_fpga_rx_data[67]} {gbt_fpga_rx_data[68]} {gbt_fpga_rx_data[69]} {gbt_fpga_rx_data[70]} {gbt_fpga_rx_data[71]} {gbt_fpga_rx_data[72]} {gbt_fpga_rx_data[73]} {gbt_fpga_rx_data[74]} {gbt_fpga_rx_data[75]} {gbt_fpga_rx_data[76]} {gbt_fpga_rx_data[77]} {gbt_fpga_rx_data[78]} {gbt_fpga_rx_data[79]} {gbt_fpga_rx_data[80]} {gbt_fpga_rx_data[81]} {gbt_fpga_rx_data[82]} {gbt_fpga_rx_data[83]}]]
create_debug_port u_ila_3 probe
set_property port_width 1 [get_debug_ports u_ila_3/probe3]
connect_debug_port u_ila_3/probe3 [get_nets [list {gbt_link/sync_from_vio[7]}]]
create_debug_port u_ila_3 probe
set_property port_width 1 [get_debug_ports u_ila_3/probe4]
connect_debug_port u_ila_3/probe4 [get_nets [list gbt_fpga_rx_is_data]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets USER_SMA_P_OBUF]
