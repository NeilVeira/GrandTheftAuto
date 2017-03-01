//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Wed Mar 01 08:44:17 2017
//Host        : DESKTOP-QUJLBQI running 64-bit major release  (build 9200)
//Command     : generate_target img_proc_mb_wrapper.bd
//Design      : img_proc_mb_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module img_proc_mb_wrapper
   (clock_rtl,
    reset_rtl,
    reset_rtl_0,
    uart_rtl_rxd,
    uart_rtl_txd);
  input clock_rtl;
  input reset_rtl;
  input reset_rtl_0;
  input uart_rtl_rxd;
  output uart_rtl_txd;

  wire clock_rtl;
  wire reset_rtl;
  wire reset_rtl_0;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;

  img_proc_mb img_proc_mb_i
       (.clock_rtl(clock_rtl),
        .reset_rtl(reset_rtl),
        .reset_rtl_0(reset_rtl_0),
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd));
endmodule
