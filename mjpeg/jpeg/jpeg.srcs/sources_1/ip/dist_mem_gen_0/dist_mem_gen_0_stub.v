// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Fri Feb 10 22:08:57 2017
// Host        : DESKTOP-QUJLBQI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/mjpeg_decoder/tmp/jpeg/jpeg.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.v
// Design      : dist_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_10,Vivado 2016.2" *)
module dist_mem_gen_0(a, d, dpra, clk, we, spo, dpo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[7:0],dpra[7:0],clk,we,spo[7:0],dpo[7:0]" */;
  input [7:0]a;
  input [7:0]d;
  input [7:0]dpra;
  input clk;
  input we;
  output [7:0]spo;
  output [7:0]dpo;
endmodule
