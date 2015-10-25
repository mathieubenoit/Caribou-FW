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
set_property PACKAGE_PIN AF27 [get_ports PS7_IIC_SDA]
set_property PACKAGE_PIN AJ29 [get_ports PS7_IIC_SCL]
set_property IOSTANDARD LVCMOS25 [get_ports PS7_IIC_SDA]
set_property IOSTANDARD LVCMOS25 [get_ports PS7_IIC_SCL]

set_property PACKAGE_PIN W26 [get_ports IIC2_SDA]
set_property IOSTANDARD LVCMOS25 [get_ports IIC2_SDA]
set_property PACKAGE_PIN V29 [get_ports IIC2_SCL]
set_property IOSTANDARD LVCMOS25 [get_ports IIC2_SCL]

set_property PACKAGE_PIN AC14 [get_ports IIC_BUFFER_EN]
set_property IOSTANDARD LVCMOS25 [get_ports IIC_BUFFER_EN]


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
set_property PACKAGE_PIN W8 [get_ports SMA_MGT_REFCLK_P]

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
connect_debug_port u_ila_0_0/clk [get_nets [list gbt_fpga_tx_frame_clk]]
set_property port_width 4 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {fei4_to_gbt/fei4_a2_data_2_gbt[0]} {fei4_to_gbt/fei4_a2_data_2_gbt[1]} {fei4_to_gbt/fei4_a2_data_2_gbt[2]} {fei4_to_gbt/fei4_a2_data_2_gbt[3]}]]
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
connect_debug_port u_ila_1_0/clk [get_nets [list gbt_fpga_rx_frame_clk]]
set_property port_width 32 [get_debug_ports u_ila_1_0/probe0]
connect_debug_port u_ila_1_0/probe0 [get_nets [list {gbt_slow_ctronl/reg0[0]} {gbt_slow_ctronl/reg0[1]} {gbt_slow_ctronl/reg0[2]} {gbt_slow_ctronl/reg0[3]} {gbt_slow_ctronl/reg0[4]} {gbt_slow_ctronl/reg0[5]} {gbt_slow_ctronl/reg0[6]} {gbt_slow_ctronl/reg0[7]} {gbt_slow_ctronl/reg0[8]} {gbt_slow_ctronl/reg0[9]} {gbt_slow_ctronl/reg0[10]} {gbt_slow_ctronl/reg0[11]} {gbt_slow_ctronl/reg0[12]} {gbt_slow_ctronl/reg0[13]} {gbt_slow_ctronl/reg0[14]} {gbt_slow_ctronl/reg0[15]} {gbt_slow_ctronl/reg0[16]} {gbt_slow_ctronl/reg0[17]} {gbt_slow_ctronl/reg0[18]} {gbt_slow_ctronl/reg0[19]} {gbt_slow_ctronl/reg0[20]} {gbt_slow_ctronl/reg0[21]} {gbt_slow_ctronl/reg0[22]} {gbt_slow_ctronl/reg0[23]} {gbt_slow_ctronl/reg0[24]} {gbt_slow_ctronl/reg0[25]} {gbt_slow_ctronl/reg0[26]} {gbt_slow_ctronl/reg0[27]} {gbt_slow_ctronl/reg0[28]} {gbt_slow_ctronl/reg0[29]} {gbt_slow_ctronl/reg0[30]} {gbt_slow_ctronl/reg0[31]}]]
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
connect_debug_port u_ila_2_0/clk [get_nets [list clk160]]
set_property port_width 4 [get_debug_ports u_ila_2_0/probe0]
connect_debug_port u_ila_2_0/probe0 [get_nets [list {fei4_a1_rx_1/data_extract/state[0]} {fei4_a1_rx_1/data_extract/state[1]} {fei4_a1_rx_1/data_extract/state[2]} {fei4_a1_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 4 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list {fei4_to_gbt/fei4_a1_data_2_gbt[0]} {fei4_to_gbt/fei4_a1_data_2_gbt[1]} {fei4_to_gbt/fei4_a1_data_2_gbt[2]} {fei4_to_gbt/fei4_a1_data_2_gbt[3]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 84 [get_debug_ports u_ila_0_0/probe2]
connect_debug_port u_ila_0_0/probe2 [get_nets [list {gbt_fpga_tx_data[0]} {gbt_fpga_tx_data[1]} {gbt_fpga_tx_data[2]} {gbt_fpga_tx_data[3]} {gbt_fpga_tx_data[4]} {gbt_fpga_tx_data[5]} {gbt_fpga_tx_data[6]} {gbt_fpga_tx_data[7]} {gbt_fpga_tx_data[8]} {gbt_fpga_tx_data[9]} {gbt_fpga_tx_data[10]} {gbt_fpga_tx_data[11]} {gbt_fpga_tx_data[12]} {gbt_fpga_tx_data[13]} {gbt_fpga_tx_data[14]} {gbt_fpga_tx_data[15]} {gbt_fpga_tx_data[16]} {gbt_fpga_tx_data[17]} {gbt_fpga_tx_data[18]} {gbt_fpga_tx_data[19]} {gbt_fpga_tx_data[20]} {gbt_fpga_tx_data[21]} {gbt_fpga_tx_data[22]} {gbt_fpga_tx_data[23]} {gbt_fpga_tx_data[24]} {gbt_fpga_tx_data[25]} {gbt_fpga_tx_data[26]} {gbt_fpga_tx_data[27]} {gbt_fpga_tx_data[28]} {gbt_fpga_tx_data[29]} {gbt_fpga_tx_data[30]} {gbt_fpga_tx_data[31]} {gbt_fpga_tx_data[32]} {gbt_fpga_tx_data[33]} {gbt_fpga_tx_data[34]} {gbt_fpga_tx_data[35]} {gbt_fpga_tx_data[36]} {gbt_fpga_tx_data[37]} {gbt_fpga_tx_data[38]} {gbt_fpga_tx_data[39]} {gbt_fpga_tx_data[40]} {gbt_fpga_tx_data[41]} {gbt_fpga_tx_data[42]} {gbt_fpga_tx_data[43]} {gbt_fpga_tx_data[44]} {gbt_fpga_tx_data[45]} {gbt_fpga_tx_data[46]} {gbt_fpga_tx_data[47]} {gbt_fpga_tx_data[48]} {gbt_fpga_tx_data[49]} {gbt_fpga_tx_data[50]} {gbt_fpga_tx_data[51]} {gbt_fpga_tx_data[52]} {gbt_fpga_tx_data[53]} {gbt_fpga_tx_data[54]} {gbt_fpga_tx_data[55]} {gbt_fpga_tx_data[56]} {gbt_fpga_tx_data[57]} {gbt_fpga_tx_data[58]} {gbt_fpga_tx_data[59]} {gbt_fpga_tx_data[60]} {gbt_fpga_tx_data[61]} {gbt_fpga_tx_data[62]} {gbt_fpga_tx_data[63]} {gbt_fpga_tx_data[64]} {gbt_fpga_tx_data[65]} {gbt_fpga_tx_data[66]} {gbt_fpga_tx_data[67]} {gbt_fpga_tx_data[68]} {gbt_fpga_tx_data[69]} {gbt_fpga_tx_data[70]} {gbt_fpga_tx_data[71]} {gbt_fpga_tx_data[72]} {gbt_fpga_tx_data[73]} {gbt_fpga_tx_data[74]} {gbt_fpga_tx_data[75]} {gbt_fpga_tx_data[76]} {gbt_fpga_tx_data[77]} {gbt_fpga_tx_data[78]} {gbt_fpga_tx_data[79]} {gbt_fpga_tx_data[80]} {gbt_fpga_tx_data[81]} {gbt_fpga_tx_data[82]} {gbt_fpga_tx_data[83]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe3]
connect_debug_port u_ila_0_0/probe3 [get_nets [list fei4_to_gbt/fei4_a1_data_valid]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe4]
connect_debug_port u_ila_0_0/probe4 [get_nets [list fei4_to_gbt/fei4_a2_data_valid]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe5]
connect_debug_port u_ila_0_0/probe5 [get_nets [list gbt_fpga_tx_is_data]]
create_debug_port u_ila_1_0 probe
set_property port_width 32 [get_debug_ports u_ila_1_0/probe1]
connect_debug_port u_ila_1_0/probe1 [get_nets [list {gbt_slow_ctronl/reg1[0]} {gbt_slow_ctronl/reg1[1]} {gbt_slow_ctronl/reg1[2]} {gbt_slow_ctronl/reg1[3]} {gbt_slow_ctronl/reg1[4]} {gbt_slow_ctronl/reg1[5]} {gbt_slow_ctronl/reg1[6]} {gbt_slow_ctronl/reg1[7]} {gbt_slow_ctronl/reg1[8]} {gbt_slow_ctronl/reg1[9]} {gbt_slow_ctronl/reg1[10]} {gbt_slow_ctronl/reg1[11]} {gbt_slow_ctronl/reg1[12]} {gbt_slow_ctronl/reg1[13]} {gbt_slow_ctronl/reg1[14]} {gbt_slow_ctronl/reg1[15]} {gbt_slow_ctronl/reg1[16]} {gbt_slow_ctronl/reg1[17]} {gbt_slow_ctronl/reg1[18]} {gbt_slow_ctronl/reg1[19]} {gbt_slow_ctronl/reg1[20]} {gbt_slow_ctronl/reg1[21]} {gbt_slow_ctronl/reg1[22]} {gbt_slow_ctronl/reg1[23]} {gbt_slow_ctronl/reg1[24]} {gbt_slow_ctronl/reg1[25]} {gbt_slow_ctronl/reg1[26]} {gbt_slow_ctronl/reg1[27]} {gbt_slow_ctronl/reg1[28]} {gbt_slow_ctronl/reg1[29]} {gbt_slow_ctronl/reg1[30]} {gbt_slow_ctronl/reg1[31]}]]
create_debug_port u_ila_1_0 probe
set_property port_width 84 [get_debug_ports u_ila_1_0/probe2]
connect_debug_port u_ila_1_0/probe2 [get_nets [list {gbt_fpga_rx_data[0]} {gbt_fpga_rx_data[1]} {gbt_fpga_rx_data[2]} {gbt_fpga_rx_data[3]} {gbt_fpga_rx_data[4]} {gbt_fpga_rx_data[5]} {gbt_fpga_rx_data[6]} {gbt_fpga_rx_data[7]} {gbt_fpga_rx_data[8]} {gbt_fpga_rx_data[9]} {gbt_fpga_rx_data[10]} {gbt_fpga_rx_data[11]} {gbt_fpga_rx_data[12]} {gbt_fpga_rx_data[13]} {gbt_fpga_rx_data[14]} {gbt_fpga_rx_data[15]} {gbt_fpga_rx_data[16]} {gbt_fpga_rx_data[17]} {gbt_fpga_rx_data[18]} {gbt_fpga_rx_data[19]} {gbt_fpga_rx_data[20]} {gbt_fpga_rx_data[21]} {gbt_fpga_rx_data[22]} {gbt_fpga_rx_data[23]} {gbt_fpga_rx_data[24]} {gbt_fpga_rx_data[25]} {gbt_fpga_rx_data[26]} {gbt_fpga_rx_data[27]} {gbt_fpga_rx_data[28]} {gbt_fpga_rx_data[29]} {gbt_fpga_rx_data[30]} {gbt_fpga_rx_data[31]} {gbt_fpga_rx_data[32]} {gbt_fpga_rx_data[33]} {gbt_fpga_rx_data[34]} {gbt_fpga_rx_data[35]} {gbt_fpga_rx_data[36]} {gbt_fpga_rx_data[37]} {gbt_fpga_rx_data[38]} {gbt_fpga_rx_data[39]} {gbt_fpga_rx_data[40]} {gbt_fpga_rx_data[41]} {gbt_fpga_rx_data[42]} {gbt_fpga_rx_data[43]} {gbt_fpga_rx_data[44]} {gbt_fpga_rx_data[45]} {gbt_fpga_rx_data[46]} {gbt_fpga_rx_data[47]} {gbt_fpga_rx_data[48]} {gbt_fpga_rx_data[49]} {gbt_fpga_rx_data[50]} {gbt_fpga_rx_data[51]} {gbt_fpga_rx_data[52]} {gbt_fpga_rx_data[53]} {gbt_fpga_rx_data[54]} {gbt_fpga_rx_data[55]} {gbt_fpga_rx_data[56]} {gbt_fpga_rx_data[57]} {gbt_fpga_rx_data[58]} {gbt_fpga_rx_data[59]} {gbt_fpga_rx_data[60]} {gbt_fpga_rx_data[61]} {gbt_fpga_rx_data[62]} {gbt_fpga_rx_data[63]} {gbt_fpga_rx_data[64]} {gbt_fpga_rx_data[65]} {gbt_fpga_rx_data[66]} {gbt_fpga_rx_data[67]} {gbt_fpga_rx_data[68]} {gbt_fpga_rx_data[69]} {gbt_fpga_rx_data[70]} {gbt_fpga_rx_data[71]} {gbt_fpga_rx_data[72]} {gbt_fpga_rx_data[73]} {gbt_fpga_rx_data[74]} {gbt_fpga_rx_data[75]} {gbt_fpga_rx_data[76]} {gbt_fpga_rx_data[77]} {gbt_fpga_rx_data[78]} {gbt_fpga_rx_data[79]} {gbt_fpga_rx_data[80]} {gbt_fpga_rx_data[81]} {gbt_fpga_rx_data[82]} {gbt_fpga_rx_data[83]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 16 [get_debug_ports u_ila_2_0/probe1]
connect_debug_port u_ila_2_0/probe1 [get_nets [list {fei4_a1_rx_1/data_extract/reg_addr[0]} {fei4_a1_rx_1/data_extract/reg_addr[1]} {fei4_a1_rx_1/data_extract/reg_addr[2]} {fei4_a1_rx_1/data_extract/reg_addr[3]} {fei4_a1_rx_1/data_extract/reg_addr[4]} {fei4_a1_rx_1/data_extract/reg_addr[5]} {fei4_a1_rx_1/data_extract/reg_addr[6]} {fei4_a1_rx_1/data_extract/reg_addr[7]} {fei4_a1_rx_1/data_extract/reg_addr[8]} {fei4_a1_rx_1/data_extract/reg_addr[9]} {fei4_a1_rx_1/data_extract/reg_addr[10]} {fei4_a1_rx_1/data_extract/reg_addr[11]} {fei4_a1_rx_1/data_extract/reg_addr[12]} {fei4_a1_rx_1/data_extract/reg_addr[13]} {fei4_a1_rx_1/data_extract/reg_addr[14]} {fei4_a1_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 16 [get_debug_ports u_ila_2_0/probe2]
connect_debug_port u_ila_2_0/probe2 [get_nets [list {fei4_a1_rx_1/data_extract/reg_value[0]} {fei4_a1_rx_1/data_extract/reg_value[1]} {fei4_a1_rx_1/data_extract/reg_value[2]} {fei4_a1_rx_1/data_extract/reg_value[3]} {fei4_a1_rx_1/data_extract/reg_value[4]} {fei4_a1_rx_1/data_extract/reg_value[5]} {fei4_a1_rx_1/data_extract/reg_value[6]} {fei4_a1_rx_1/data_extract/reg_value[7]} {fei4_a1_rx_1/data_extract/reg_value[8]} {fei4_a1_rx_1/data_extract/reg_value[9]} {fei4_a1_rx_1/data_extract/reg_value[10]} {fei4_a1_rx_1/data_extract/reg_value[11]} {fei4_a1_rx_1/data_extract/reg_value[12]} {fei4_a1_rx_1/data_extract/reg_value[13]} {fei4_a1_rx_1/data_extract/reg_value[14]} {fei4_a1_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 4 [get_debug_ports u_ila_2_0/probe3]
connect_debug_port u_ila_2_0/probe3 [get_nets [list {fei4_a1_cfg/cfg_state[0]} {fei4_a1_cfg/cfg_state[1]} {fei4_a1_cfg/cfg_state[2]} {fei4_a1_cfg/cfg_state[3]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 2 [get_debug_ports u_ila_2_0/probe4]
connect_debug_port u_ila_2_0/probe4 [get_nets [list {fei4_a1_rx_1/data_deser/rx_state[0]} {fei4_a1_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 10 [get_debug_ports u_ila_2_0/probe5]
connect_debug_port u_ila_2_0/probe5 [get_nets [list {fei4_a1_rx_1/data_deser/fei4_data_byte[0]} {fei4_a1_rx_1/data_deser/fei4_data_byte[1]} {fei4_a1_rx_1/data_deser/fei4_data_byte[2]} {fei4_a1_rx_1/data_deser/fei4_data_byte[3]} {fei4_a1_rx_1/data_deser/fei4_data_byte[4]} {fei4_a1_rx_1/data_deser/fei4_data_byte[5]} {fei4_a1_rx_1/data_deser/fei4_data_byte[6]} {fei4_a1_rx_1/data_deser/fei4_data_byte[7]} {fei4_a1_rx_1/data_deser/fei4_data_byte[8]} {fei4_a1_rx_1/data_deser/fei4_data_byte[9]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 8 [get_debug_ports u_ila_2_0/probe6]
connect_debug_port u_ila_2_0/probe6 [get_nets [list {fei4_a1_rx_1/fei4_data[0]} {fei4_a1_rx_1/fei4_data[1]} {fei4_a1_rx_1/fei4_data[2]} {fei4_a1_rx_1/fei4_data[3]} {fei4_a1_rx_1/fei4_data[4]} {fei4_a1_rx_1/fei4_data[5]} {fei4_a1_rx_1/fei4_data[6]} {fei4_a1_rx_1/fei4_data[7]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 4 [get_debug_ports u_ila_2_0/probe7]
connect_debug_port u_ila_2_0/probe7 [get_nets [list {fei4_a2_rx_1/data_extract/state[0]} {fei4_a2_rx_1/data_extract/state[1]} {fei4_a2_rx_1/data_extract/state[2]} {fei4_a2_rx_1/data_extract/state[3]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 16 [get_debug_ports u_ila_2_0/probe8]
connect_debug_port u_ila_2_0/probe8 [get_nets [list {fei4_a2_rx_1/data_extract/reg_addr[0]} {fei4_a2_rx_1/data_extract/reg_addr[1]} {fei4_a2_rx_1/data_extract/reg_addr[2]} {fei4_a2_rx_1/data_extract/reg_addr[3]} {fei4_a2_rx_1/data_extract/reg_addr[4]} {fei4_a2_rx_1/data_extract/reg_addr[5]} {fei4_a2_rx_1/data_extract/reg_addr[6]} {fei4_a2_rx_1/data_extract/reg_addr[7]} {fei4_a2_rx_1/data_extract/reg_addr[8]} {fei4_a2_rx_1/data_extract/reg_addr[9]} {fei4_a2_rx_1/data_extract/reg_addr[10]} {fei4_a2_rx_1/data_extract/reg_addr[11]} {fei4_a2_rx_1/data_extract/reg_addr[12]} {fei4_a2_rx_1/data_extract/reg_addr[13]} {fei4_a2_rx_1/data_extract/reg_addr[14]} {fei4_a2_rx_1/data_extract/reg_addr[15]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 16 [get_debug_ports u_ila_2_0/probe9]
connect_debug_port u_ila_2_0/probe9 [get_nets [list {fei4_a2_rx_1/data_extract/reg_value[0]} {fei4_a2_rx_1/data_extract/reg_value[1]} {fei4_a2_rx_1/data_extract/reg_value[2]} {fei4_a2_rx_1/data_extract/reg_value[3]} {fei4_a2_rx_1/data_extract/reg_value[4]} {fei4_a2_rx_1/data_extract/reg_value[5]} {fei4_a2_rx_1/data_extract/reg_value[6]} {fei4_a2_rx_1/data_extract/reg_value[7]} {fei4_a2_rx_1/data_extract/reg_value[8]} {fei4_a2_rx_1/data_extract/reg_value[9]} {fei4_a2_rx_1/data_extract/reg_value[10]} {fei4_a2_rx_1/data_extract/reg_value[11]} {fei4_a2_rx_1/data_extract/reg_value[12]} {fei4_a2_rx_1/data_extract/reg_value[13]} {fei4_a2_rx_1/data_extract/reg_value[14]} {fei4_a2_rx_1/data_extract/reg_value[15]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 10 [get_debug_ports u_ila_2_0/probe10]
connect_debug_port u_ila_2_0/probe10 [get_nets [list {fei4_a2_rx_1/data_deser/fei4_data_byte[0]} {fei4_a2_rx_1/data_deser/fei4_data_byte[1]} {fei4_a2_rx_1/data_deser/fei4_data_byte[2]} {fei4_a2_rx_1/data_deser/fei4_data_byte[3]} {fei4_a2_rx_1/data_deser/fei4_data_byte[4]} {fei4_a2_rx_1/data_deser/fei4_data_byte[5]} {fei4_a2_rx_1/data_deser/fei4_data_byte[6]} {fei4_a2_rx_1/data_deser/fei4_data_byte[7]} {fei4_a2_rx_1/data_deser/fei4_data_byte[8]} {fei4_a2_rx_1/data_deser/fei4_data_byte[9]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 2 [get_debug_ports u_ila_2_0/probe11]
connect_debug_port u_ila_2_0/probe11 [get_nets [list {fei4_a2_rx_1/data_deser/rx_state[0]} {fei4_a2_rx_1/data_deser/rx_state[1]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 8 [get_debug_ports u_ila_2_0/probe12]
connect_debug_port u_ila_2_0/probe12 [get_nets [list {fei4_a2_rx_1/fei4_data[0]} {fei4_a2_rx_1/fei4_data[1]} {fei4_a2_rx_1/fei4_data[2]} {fei4_a2_rx_1/fei4_data[3]} {fei4_a2_rx_1/fei4_data[4]} {fei4_a2_rx_1/fei4_data[5]} {fei4_a2_rx_1/fei4_data[6]} {fei4_a2_rx_1/fei4_data[7]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 32 [get_debug_ports u_ila_2_0/probe13]
connect_debug_port u_ila_2_0/probe13 [get_nets [list {hp2_burst_fifo_wrdata_t[0]} {hp2_burst_fifo_wrdata_t[1]} {hp2_burst_fifo_wrdata_t[2]} {hp2_burst_fifo_wrdata_t[3]} {hp2_burst_fifo_wrdata_t[4]} {hp2_burst_fifo_wrdata_t[5]} {hp2_burst_fifo_wrdata_t[6]} {hp2_burst_fifo_wrdata_t[7]} {hp2_burst_fifo_wrdata_t[8]} {hp2_burst_fifo_wrdata_t[9]} {hp2_burst_fifo_wrdata_t[10]} {hp2_burst_fifo_wrdata_t[11]} {hp2_burst_fifo_wrdata_t[12]} {hp2_burst_fifo_wrdata_t[13]} {hp2_burst_fifo_wrdata_t[14]} {hp2_burst_fifo_wrdata_t[15]} {hp2_burst_fifo_wrdata_t[16]} {hp2_burst_fifo_wrdata_t[17]} {hp2_burst_fifo_wrdata_t[18]} {hp2_burst_fifo_wrdata_t[19]} {hp2_burst_fifo_wrdata_t[20]} {hp2_burst_fifo_wrdata_t[21]} {hp2_burst_fifo_wrdata_t[22]} {hp2_burst_fifo_wrdata_t[23]} {hp2_burst_fifo_wrdata_t[24]} {hp2_burst_fifo_wrdata_t[25]} {hp2_burst_fifo_wrdata_t[26]} {hp2_burst_fifo_wrdata_t[27]} {hp2_burst_fifo_wrdata_t[28]} {hp2_burst_fifo_wrdata_t[29]} {hp2_burst_fifo_wrdata_t[30]} {hp2_burst_fifo_wrdata_t[31]}]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe14]
connect_debug_port u_ila_2_0/probe14 [get_nets [list fei4_a2_rx_1/data_deser/data_i]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe15]
connect_debug_port u_ila_2_0/probe15 [get_nets [list fei4_a1_rx_1/data_deser/data_i]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe16]
connect_debug_port u_ila_2_0/probe16 [get_nets [list fei4_a1_data_is_pix_dat]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe17]
connect_debug_port u_ila_2_0/probe17 [get_nets [list fei4_a2_data_is_pix_dat]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe18]
connect_debug_port u_ila_2_0/probe18 [get_nets [list fei4_a2_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe19]
connect_debug_port u_ila_2_0/probe19 [get_nets [list fei4_a1_rx_1/data_deser/fram_is_synced]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe20]
connect_debug_port u_ila_2_0/probe20 [get_nets [list fei4_a1_rx_1/data_deser/idle]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe21]
connect_debug_port u_ila_2_0/probe21 [get_nets [list fei4_a2_rx_1/data_deser/idle]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe22]
connect_debug_port u_ila_2_0/probe22 [get_nets [list fei4_a1_rx_1/data_deser/sync_tri]]
create_debug_port u_ila_2_0 probe
set_property port_width 1 [get_debug_ports u_ila_2_0/probe23]
connect_debug_port u_ila_2_0/probe23 [get_nets [list fei4_a2_rx_1/data_deser/sync_tri]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets gbt_fpga_tx_frame_clk]
