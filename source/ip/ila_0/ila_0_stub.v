// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Mon Oct 19 11:47:06 2015
// Host        : WPO-148239 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub c:/Hongbin/ITK/firmware_git/source/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[83:0],probe1[31:0],probe2[3:0],probe3[0:0]" */;
  input clk;
  input [83:0]probe0;
  input [31:0]probe1;
  input [3:0]probe2;
  input [0:0]probe3;
endmodule
