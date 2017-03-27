//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Sun Mar 26 15:08:24 2017
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
    LED,
    R,
    V,
    calibrate,
    error_o,
    pins,
    pmod_out_pin10_io,
    pmod_out_pin1_io,
    pmod_out_pin2_io,
    pmod_out_pin3_io,
    pmod_out_pin4_io,
    pmod_out_pin7_io,
    pmod_out_pin8_io,
    pmod_out_pin9_io,
    reset,
    reset_yy,
    switches,
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
  output [0:12]LED;
  output [3:0]R;
  output V;
  input calibrate;
  output error_o;
  output [0:3]pins;
  inout pmod_out_pin10_io;
  inout pmod_out_pin1_io;
  inout pmod_out_pin2_io;
  inout pmod_out_pin3_io;
  inout pmod_out_pin4_io;
  inout pmod_out_pin7_io;
  inout pmod_out_pin8_io;
  inout pmod_out_pin9_io;
  input reset;
  input reset_yy;
  input [0:4]switches;
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
  wire [0:12]LED;
  wire [3:0]R;
  wire V;
  wire calibrate;
  wire error_o;
  wire [0:3]pins;
  wire pmod_out_pin10_i;
  wire pmod_out_pin10_io;
  wire pmod_out_pin10_o;
  wire pmod_out_pin10_t;
  wire pmod_out_pin1_i;
  wire pmod_out_pin1_io;
  wire pmod_out_pin1_o;
  wire pmod_out_pin1_t;
  wire pmod_out_pin2_i;
  wire pmod_out_pin2_io;
  wire pmod_out_pin2_o;
  wire pmod_out_pin2_t;
  wire pmod_out_pin3_i;
  wire pmod_out_pin3_io;
  wire pmod_out_pin3_o;
  wire pmod_out_pin3_t;
  wire pmod_out_pin4_i;
  wire pmod_out_pin4_io;
  wire pmod_out_pin4_o;
  wire pmod_out_pin4_t;
  wire pmod_out_pin7_i;
  wire pmod_out_pin7_io;
  wire pmod_out_pin7_o;
  wire pmod_out_pin7_t;
  wire pmod_out_pin8_i;
  wire pmod_out_pin8_io;
  wire pmod_out_pin8_o;
  wire pmod_out_pin8_t;
  wire pmod_out_pin9_i;
  wire pmod_out_pin9_io;
  wire pmod_out_pin9_o;
  wire pmod_out_pin9_t;
  wire reset;
  wire reset_yy;
  wire [0:4]switches;
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
        .LED(LED),
        .Pmod_out_pin10_i(pmod_out_pin10_i),
        .Pmod_out_pin10_o(pmod_out_pin10_o),
        .Pmod_out_pin10_t(pmod_out_pin10_t),
        .Pmod_out_pin1_i(pmod_out_pin1_i),
        .Pmod_out_pin1_o(pmod_out_pin1_o),
        .Pmod_out_pin1_t(pmod_out_pin1_t),
        .Pmod_out_pin2_i(pmod_out_pin2_i),
        .Pmod_out_pin2_o(pmod_out_pin2_o),
        .Pmod_out_pin2_t(pmod_out_pin2_t),
        .Pmod_out_pin3_i(pmod_out_pin3_i),
        .Pmod_out_pin3_o(pmod_out_pin3_o),
        .Pmod_out_pin3_t(pmod_out_pin3_t),
        .Pmod_out_pin4_i(pmod_out_pin4_i),
        .Pmod_out_pin4_o(pmod_out_pin4_o),
        .Pmod_out_pin4_t(pmod_out_pin4_t),
        .Pmod_out_pin7_i(pmod_out_pin7_i),
        .Pmod_out_pin7_o(pmod_out_pin7_o),
        .Pmod_out_pin7_t(pmod_out_pin7_t),
        .Pmod_out_pin8_i(pmod_out_pin8_i),
        .Pmod_out_pin8_o(pmod_out_pin8_o),
        .Pmod_out_pin8_t(pmod_out_pin8_t),
        .Pmod_out_pin9_i(pmod_out_pin9_i),
        .Pmod_out_pin9_o(pmod_out_pin9_o),
        .Pmod_out_pin9_t(pmod_out_pin9_t),
        .R(R),
        .V(V),
        .calibrate(calibrate),
        .error_o(error_o),
        .pins(pins),
        .reset(reset),
        .reset_yy(reset_yy),
        .switches(switches),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF pmod_out_pin10_iobuf
       (.I(pmod_out_pin10_o),
        .IO(pmod_out_pin10_io),
        .O(pmod_out_pin10_i),
        .T(pmod_out_pin10_t));
  IOBUF pmod_out_pin1_iobuf
       (.I(pmod_out_pin1_o),
        .IO(pmod_out_pin1_io),
        .O(pmod_out_pin1_i),
        .T(pmod_out_pin1_t));
  IOBUF pmod_out_pin2_iobuf
       (.I(pmod_out_pin2_o),
        .IO(pmod_out_pin2_io),
        .O(pmod_out_pin2_i),
        .T(pmod_out_pin2_t));
  IOBUF pmod_out_pin3_iobuf
       (.I(pmod_out_pin3_o),
        .IO(pmod_out_pin3_io),
        .O(pmod_out_pin3_i),
        .T(pmod_out_pin3_t));
  IOBUF pmod_out_pin4_iobuf
       (.I(pmod_out_pin4_o),
        .IO(pmod_out_pin4_io),
        .O(pmod_out_pin4_i),
        .T(pmod_out_pin4_t));
  IOBUF pmod_out_pin7_iobuf
       (.I(pmod_out_pin7_o),
        .IO(pmod_out_pin7_io),
        .O(pmod_out_pin7_i),
        .T(pmod_out_pin7_t));
  IOBUF pmod_out_pin8_iobuf
       (.I(pmod_out_pin8_o),
        .IO(pmod_out_pin8_io),
        .O(pmod_out_pin8_i),
        .T(pmod_out_pin8_t));
  IOBUF pmod_out_pin9_iobuf
       (.I(pmod_out_pin9_o),
        .IO(pmod_out_pin9_io),
        .O(pmod_out_pin9_i),
        .T(pmod_out_pin9_t));
endmodule
