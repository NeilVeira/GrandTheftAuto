// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1_wrapper(clock_rtl, led, reset_rtl, uart_rtl_rxd, uart_rtl_txd);
  input clock_rtl;
  output [15:0]led;
  input reset_rtl;
  input uart_rtl_rxd;
  output uart_rtl_txd;
endmodule
