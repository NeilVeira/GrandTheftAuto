//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Wed Feb 01 17:12:04 2017
//Host        : DESKTOP-QUJLBQI running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clock_rtl,
    led,
    reset_rtl,
    uart_rtl_rxd,
    uart_rtl_txd);
  input clock_rtl;
  output [15:0]led;
  input reset_rtl;
  input uart_rtl_rxd;
  output uart_rtl_txd;

  wire clock_rtl;
  wire [15:0]led;
  wire reset_rtl;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;

  design_1 design_1_i
       (.clock_rtl(clock_rtl),
        .led(led),
        .reset_rtl(reset_rtl),
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd));
endmodule
