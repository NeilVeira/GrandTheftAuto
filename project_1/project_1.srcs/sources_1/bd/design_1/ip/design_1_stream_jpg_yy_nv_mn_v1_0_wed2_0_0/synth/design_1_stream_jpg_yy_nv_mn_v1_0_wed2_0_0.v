// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user:user:stream_jpg_yy_nv_mn_v1_0_wed2:1.0
// IP Revision: 21

(* X_CORE_INFO = "stream_jpg_yy_nv_mn_v1_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0,stream_jpg_yy_nv_mn_v1_0,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_stream_jpg_yy_nv_mn_v1_0_wed2_0_0 (
  s00_axis_aclk,
  s00_axis_aresetn,
  slow_clock,
  s00_axis_tready,
  s00_axis_tdata,
  s00_axis_tstrb,
  s00_axis_tlast,
  s00_axis_tvalid,
  clk_25,
  R,
  G,
  B,
  H,
  V,
  calibrate,
  microblaze_read,
  img_proc_write,
  edge_ram_addr,
  edge_ram_din,
  edge_ram_wren,
  error_o
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axis_aclk CLK" *)
input wire s00_axis_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axis_aresetn RST" *)
input wire s00_axis_aresetn;
input wire slow_clock;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TREADY" *)
output wire s00_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TDATA" *)
input wire [31 : 0] s00_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TSTRB" *)
input wire [3 : 0] s00_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TLAST" *)
input wire s00_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TVALID" *)
input wire s00_axis_tvalid;
input wire clk_25;
output wire [3 : 0] R;
output wire [3 : 0] G;
output wire [3 : 0] B;
output wire H;
output wire V;
input wire calibrate;
input wire [1 : 0] microblaze_read;
output wire [1 : 0] img_proc_write;
output wire [12 : 0] edge_ram_addr;
output wire [19 : 0] edge_ram_din;
output wire edge_ram_wren;
output wire error_o;

  stream_jpg_yy_nv_mn_v1_0 #(
    .C_S00_AXIS_TDATA_WIDTH(32)
  ) inst (
    .s00_axis_aclk(s00_axis_aclk),
    .s00_axis_aresetn(s00_axis_aresetn),
    .slow_clock(slow_clock),
    .s00_axis_tready(s00_axis_tready),
    .s00_axis_tdata(s00_axis_tdata),
    .s00_axis_tstrb(s00_axis_tstrb),
    .s00_axis_tlast(s00_axis_tlast),
    .s00_axis_tvalid(s00_axis_tvalid),
    .clk_25(clk_25),
    .R(R),
    .G(G),
    .B(B),
    .H(H),
    .V(V),
    .calibrate(calibrate),
    .microblaze_read(microblaze_read),
    .img_proc_write(img_proc_write),
    .edge_ram_addr(edge_ram_addr),
    .edge_ram_din(edge_ram_din),
    .edge_ram_wren(edge_ram_wren),
    .error_o(error_o)
  );
endmodule
