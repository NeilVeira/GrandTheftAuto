//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Mon Mar 20 20:34:33 2017
//Host        : TP-MILWIDG7 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (B,
    DDR2_addr,
    DDR2_ba,
    DDR2_cas_n,
    DDR2_ck_n,
    DDR2_ck_p,
    DDR2_cke,
    DDR2_cs_n,
    DDR2_dm,
    DDR2_dq,
    DDR2_dqs_n,
    DDR2_dqs_p,
    DDR2_odt,
    DDR2_ras_n,
    DDR2_we_n,
    G,
    H,
    R,
    V,
    jb_0_pin10_io,
    jb_0_pin1_io,
    jb_0_pin2_io,
    jb_0_pin3_io,
    jb_0_pin4_io,
    jb_0_pin7_io,
    jb_0_pin8_io,
    jb_0_pin9_io,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  output [3:0]B;
  output [12:0]DDR2_addr;
  output [2:0]DDR2_ba;
  output DDR2_cas_n;
  output [0:0]DDR2_ck_n;
  output [0:0]DDR2_ck_p;
  output [0:0]DDR2_cke;
  output [0:0]DDR2_cs_n;
  output [1:0]DDR2_dm;
  inout [15:0]DDR2_dq;
  inout [1:0]DDR2_dqs_n;
  inout [1:0]DDR2_dqs_p;
  output [0:0]DDR2_odt;
  output DDR2_ras_n;
  output DDR2_we_n;
  output [3:0]G;
  output H;
  output [3:0]R;
  output V;
  inout jb_0_pin10_io;
  inout jb_0_pin1_io;
  inout jb_0_pin2_io;
  inout jb_0_pin3_io;
  inout jb_0_pin4_io;
  inout jb_0_pin7_io;
  inout jb_0_pin8_io;
  inout jb_0_pin9_io;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [3:0]B;
  wire [12:0]DDR2_addr;
  wire [2:0]DDR2_ba;
  wire DDR2_cas_n;
  wire [0:0]DDR2_ck_n;
  wire [0:0]DDR2_ck_p;
  wire [0:0]DDR2_cke;
  wire [0:0]DDR2_cs_n;
  wire [1:0]DDR2_dm;
  wire [15:0]DDR2_dq;
  wire [1:0]DDR2_dqs_n;
  wire [1:0]DDR2_dqs_p;
  wire [0:0]DDR2_odt;
  wire DDR2_ras_n;
  wire DDR2_we_n;
  wire [3:0]G;
  wire H;
  wire [3:0]R;
  wire V;
  wire jb_0_pin10_i;
  wire jb_0_pin10_io;
  wire jb_0_pin10_o;
  wire jb_0_pin10_t;
  wire jb_0_pin1_i;
  wire jb_0_pin1_io;
  wire jb_0_pin1_o;
  wire jb_0_pin1_t;
  wire jb_0_pin2_i;
  wire jb_0_pin2_io;
  wire jb_0_pin2_o;
  wire jb_0_pin2_t;
  wire jb_0_pin3_i;
  wire jb_0_pin3_io;
  wire jb_0_pin3_o;
  wire jb_0_pin3_t;
  wire jb_0_pin4_i;
  wire jb_0_pin4_io;
  wire jb_0_pin4_o;
  wire jb_0_pin4_t;
  wire jb_0_pin7_i;
  wire jb_0_pin7_io;
  wire jb_0_pin7_o;
  wire jb_0_pin7_t;
  wire jb_0_pin8_i;
  wire jb_0_pin8_io;
  wire jb_0_pin8_o;
  wire jb_0_pin8_t;
  wire jb_0_pin9_i;
  wire jb_0_pin9_io;
  wire jb_0_pin9_o;
  wire jb_0_pin9_t;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  design_1 design_1_i
       (.B(B),
        .DDR2_addr(DDR2_addr),
        .DDR2_ba(DDR2_ba),
        .DDR2_cas_n(DDR2_cas_n),
        .DDR2_ck_n(DDR2_ck_n),
        .DDR2_ck_p(DDR2_ck_p),
        .DDR2_cke(DDR2_cke),
        .DDR2_cs_n(DDR2_cs_n),
        .DDR2_dm(DDR2_dm),
        .DDR2_dq(DDR2_dq),
        .DDR2_dqs_n(DDR2_dqs_n),
        .DDR2_dqs_p(DDR2_dqs_p),
        .DDR2_odt(DDR2_odt),
        .DDR2_ras_n(DDR2_ras_n),
        .DDR2_we_n(DDR2_we_n),
        .G(G),
        .H(H),
        .R(R),
        .V(V),
        .jb_0_pin10_i(jb_0_pin10_i),
        .jb_0_pin10_o(jb_0_pin10_o),
        .jb_0_pin10_t(jb_0_pin10_t),
        .jb_0_pin1_i(jb_0_pin1_i),
        .jb_0_pin1_o(jb_0_pin1_o),
        .jb_0_pin1_t(jb_0_pin1_t),
        .jb_0_pin2_i(jb_0_pin2_i),
        .jb_0_pin2_o(jb_0_pin2_o),
        .jb_0_pin2_t(jb_0_pin2_t),
        .jb_0_pin3_i(jb_0_pin3_i),
        .jb_0_pin3_o(jb_0_pin3_o),
        .jb_0_pin3_t(jb_0_pin3_t),
        .jb_0_pin4_i(jb_0_pin4_i),
        .jb_0_pin4_o(jb_0_pin4_o),
        .jb_0_pin4_t(jb_0_pin4_t),
        .jb_0_pin7_i(jb_0_pin7_i),
        .jb_0_pin7_o(jb_0_pin7_o),
        .jb_0_pin7_t(jb_0_pin7_t),
        .jb_0_pin8_i(jb_0_pin8_i),
        .jb_0_pin8_o(jb_0_pin8_o),
        .jb_0_pin8_t(jb_0_pin8_t),
        .jb_0_pin9_i(jb_0_pin9_i),
        .jb_0_pin9_o(jb_0_pin9_o),
        .jb_0_pin9_t(jb_0_pin9_t),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF jb_0_pin10_iobuf
       (.I(jb_0_pin10_o),
        .IO(jb_0_pin10_io),
        .O(jb_0_pin10_i),
        .T(jb_0_pin10_t));
  IOBUF jb_0_pin1_iobuf
       (.I(jb_0_pin1_o),
        .IO(jb_0_pin1_io),
        .O(jb_0_pin1_i),
        .T(jb_0_pin1_t));
  IOBUF jb_0_pin2_iobuf
       (.I(jb_0_pin2_o),
        .IO(jb_0_pin2_io),
        .O(jb_0_pin2_i),
        .T(jb_0_pin2_t));
  IOBUF jb_0_pin3_iobuf
       (.I(jb_0_pin3_o),
        .IO(jb_0_pin3_io),
        .O(jb_0_pin3_i),
        .T(jb_0_pin3_t));
  IOBUF jb_0_pin4_iobuf
       (.I(jb_0_pin4_o),
        .IO(jb_0_pin4_io),
        .O(jb_0_pin4_i),
        .T(jb_0_pin4_t));
  IOBUF jb_0_pin7_iobuf
       (.I(jb_0_pin7_o),
        .IO(jb_0_pin7_io),
        .O(jb_0_pin7_i),
        .T(jb_0_pin7_t));
  IOBUF jb_0_pin8_iobuf
       (.I(jb_0_pin8_o),
        .IO(jb_0_pin8_io),
        .O(jb_0_pin8_i),
        .T(jb_0_pin8_t));
  IOBUF jb_0_pin9_iobuf
       (.I(jb_0_pin9_o),
        .IO(jb_0_pin9_io),
        .O(jb_0_pin9_i),
        .T(jb_0_pin9_t));
endmodule
