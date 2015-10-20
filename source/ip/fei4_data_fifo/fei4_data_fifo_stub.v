// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Tue Oct 20 10:49:08 2015
// Host        : WPO-148239 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Hongbin/ITK/firmware_git/source/ip/fei4_data_fifo/fei4_data_fifo_stub.v
// Design      : fei4_data_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.2" *)
module fei4_data_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, empty, rd_data_count)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[7:0],wr_en,rd_en,dout[3:0],full,empty,rd_data_count[4:0]" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [7:0]din;
  input wr_en;
  input rd_en;
  output [3:0]dout;
  output full;
  output empty;
  output [4:0]rd_data_count;
endmodule
