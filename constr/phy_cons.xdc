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
set_property PACKAGE_PIN W7 [get_ports SMA_MGT_REFCLK_N]
set_property PACKAGE_PIN W8 [get_ports SMA_MGT_REFCLK_P]

# SFP MGT TX/RX
set_property PACKAGE_PIN W4 [get_ports SFP_TX_P]
set_property PACKAGE_PIN W3 [get_ports SFP_TX_N]
set_property PACKAGE_PIN Y6 [get_ports SFP_RX_P]
set_property PACKAGE_PIN Y5 [get_ports SFP_RX_N]

# LOOP BACK TX/RX
#set_property PACKAGE_PIN V2  [get_ports SFP_TX_P] 
#set_property PACKAGE_PIN V1  [get_ports SFP_TX_N] 
#set_property PACKAGE_PIN AA4 [get_ports SFP_RX_P] 
#set_property PACKAGE_PIN AA3 [get_ports SFP_RX_N] 

# SFP TX DISABLE
set_property PACKAGE_PIN AA18    [get_ports SFP_TX_DISABLE]
set_property IOSTANDARD LVCMOS25 [get_ports SFP_TX_DISABLE]

# USR CLOCK
set_property PACKAGE_PIN AF14   [get_ports USER_CLOCK_P]
set_property IOSTANDARD LVDS_25 [get_ports USER_CLOCK_P]
set_property PACKAGE_PIN AG14   [get_ports USER_CLOCK_N]
set_property IOSTANDARD LVDS_25 [get_ports USER_CLOCK_N]


