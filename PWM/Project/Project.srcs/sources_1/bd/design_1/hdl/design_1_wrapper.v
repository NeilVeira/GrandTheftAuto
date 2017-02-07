//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Sun Feb 05 15:56:01 2017
//Host        : DESKTOP-MK74K7A running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (O,
    clock_rtl,
    reset_rtl,
    reset_rtl_0);
  output [3:0]O;
  input clock_rtl;
  input reset_rtl;
  input reset_rtl_0;

  wire [3:0]O;
  wire clock_rtl;
  wire reset_rtl;
  wire reset_rtl_0;

  design_1 design_1_i
       (.O(O),
        .clock_rtl(clock_rtl),
        .reset_rtl(reset_rtl),
        .reset_rtl_0(reset_rtl_0));
endmodule
