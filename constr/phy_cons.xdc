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

## FEI4 A2 (LPC SLOT2) DOB
#set_property PACKAGE_PIN AC29 [get_ports FEI4_A2_DOB_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_DOB_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_DOB_N]
## FEI4 A2 (LPC SLOT2) CMD
#set_property PACKAGE_PIN Y30 [get_ports FEI4_A2_CMD_OUT_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_CMD_OUT_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_CMD_OUT_N]
## FEI4 A2 (LPC SLOT2) HITOR
#set_property PACKAGE_PIN AH26 [get_ports FEI4_A2_HIT_OR_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_HIT_OR_P]
#set_property IOSTANDARD LVDS_25 [get_ports FEI4_A2_HIT_OR_N]

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
connect_debug_port u_ila_0/clk [get_nets [list clk160]]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {hp2_burst_fifo_wrdata_t[0]} {hp2_burst_fifo_wrdata_t[1]} {hp2_burst_fifo_wrdata_t[2]} {hp2_burst_fifo_wrdata_t[3]} {hp2_burst_fifo_wrdata_t[4]} {hp2_burst_fifo_wrdata_t[5]} {hp2_burst_fifo_wrdata_t[6]} {hp2_burst_fifo_wrdata_t[7]} {hp2_burst_fifo_wrdata_t[8]} {hp2_burst_fifo_wrdata_t[9]} {hp2_burst_fifo_wrdata_t[10]} {hp2_burst_fifo_wrdata_t[11]} {hp2_burst_fifo_wrdata_t[12]} {hp2_burst_fifo_wrdata_t[13]} {hp2_burst_fifo_wrdata_t[14]} {hp2_burst_fifo_wrdata_t[15]} {hp2_burst_fifo_wrdata_t[16]} {hp2_burst_fifo_wrdata_t[17]} {hp2_burst_fifo_wrdata_t[18]} {hp2_burst_fifo_wrdata_t[19]} {hp2_burst_fifo_wrdata_t[20]} {hp2_burst_fifo_wrdata_t[21]} {hp2_burst_fifo_wrdata_t[22]} {hp2_burst_fifo_wrdata_t[23]} {hp2_burst_fifo_wrdata_t[24]} {hp2_burst_fifo_wrdata_t[25]} {hp2_burst_fifo_wrdata_t[26]} {hp2_burst_fifo_wrdata_t[27]} {hp2_burst_fifo_wrdata_t[28]} {hp2_burst_fifo_wrdata_t[29]} {hp2_burst_fifo_wrdata_t[30]} {hp2_burst_fifo_wrdata_t[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list hp2_burst_fifo_wren_t]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk160]
