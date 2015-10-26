// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon Oct 26 13:44:36 2015
// Host        : WPO-148239 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub C:/Hongbin/ITK/firmware_git/source/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vio,Vivado 2014.4" *)
module vio_0(clk, probe_in0, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[17:0],probe_out0[11:0]" */;
  input clk;
  input [17:0]probe_in0;
  output [11:0]probe_out0;
endmodule
