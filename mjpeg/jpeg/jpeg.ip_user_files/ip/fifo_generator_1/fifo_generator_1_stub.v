// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Feb 10 19:53:06 2017
// Host        : DESKTOP-QUJLBQI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/mjpeg_decoder/tmp/jpeg/jpeg.srcs/sources_1/ip/fifo_generator_1/fifo_generator_1_stub.v
// Design      : fifo_generator_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_1,Vivado 2016.2" *)
module fifo_generator_1(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, almost_full, empty, almost_empty, valid)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[11:0],wr_en,rd_en,dout[11:0],full,almost_full,empty,almost_empty,valid" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [11:0]din;
  input wr_en;
  input rd_en;
  output [11:0]dout;
  output full;
  output almost_full;
  output empty;
  output almost_empty;
  output valid;
endmodule
