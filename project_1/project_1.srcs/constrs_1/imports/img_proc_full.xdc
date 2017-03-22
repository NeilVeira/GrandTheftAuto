#set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_100 }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

set_property PACKAGE_PIN A3 [get_ports {R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[0]}]
set_property PACKAGE_PIN B4 [get_ports {R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[1]}]
set_property PACKAGE_PIN C5 [get_ports {R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[2]}]
set_property PACKAGE_PIN A4 [get_ports {R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[3]}]
set_property PACKAGE_PIN C6 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
set_property PACKAGE_PIN A5 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
set_property PACKAGE_PIN B6 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
set_property PACKAGE_PIN A6 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]
set_property PACKAGE_PIN B7 [get_ports {G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[0]}]
set_property PACKAGE_PIN C7 [get_ports {G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[1]}]
set_property PACKAGE_PIN D7 [get_ports {G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[2]}]
set_property PACKAGE_PIN D8 [get_ports {G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[3]}]
set_property PACKAGE_PIN B11 [get_ports H]
set_property IOSTANDARD LVCMOS33 [get_ports H]
set_property PACKAGE_PIN B12 [get_ports V]
set_property IOSTANDARD LVCMOS33 [get_ports V]



connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/yy_ready_o]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/clk_wiz_1/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[0]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[1]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[2]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[3]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[4]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[5]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[6]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[7]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[8]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[9]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[10]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[11]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[12]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[13]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[14]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[15]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[16]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[17]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[18]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[19]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[20]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[21]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[22]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[23]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[24]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[25]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[26]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[27]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[28]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[29]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[30]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/dout[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[0]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[1]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[2]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[3]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[4]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[5]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[6]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[7]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[8]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[9]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[10]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[11]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[12]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[13]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[14]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[15]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[16]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[17]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[18]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[19]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[20]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[21]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[22]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[23]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[24]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[25]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[26]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[27]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[28]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[29]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[30]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/next_state[0]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/next_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/state[0]} {design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/microblaze_0_M0_AXIS_TDATA[0]} {design_1_i/microblaze_0_M0_AXIS_TDATA[1]} {design_1_i/microblaze_0_M0_AXIS_TDATA[2]} {design_1_i/microblaze_0_M0_AXIS_TDATA[3]} {design_1_i/microblaze_0_M0_AXIS_TDATA[4]} {design_1_i/microblaze_0_M0_AXIS_TDATA[5]} {design_1_i/microblaze_0_M0_AXIS_TDATA[6]} {design_1_i/microblaze_0_M0_AXIS_TDATA[7]} {design_1_i/microblaze_0_M0_AXIS_TDATA[8]} {design_1_i/microblaze_0_M0_AXIS_TDATA[9]} {design_1_i/microblaze_0_M0_AXIS_TDATA[10]} {design_1_i/microblaze_0_M0_AXIS_TDATA[11]} {design_1_i/microblaze_0_M0_AXIS_TDATA[12]} {design_1_i/microblaze_0_M0_AXIS_TDATA[13]} {design_1_i/microblaze_0_M0_AXIS_TDATA[14]} {design_1_i/microblaze_0_M0_AXIS_TDATA[15]} {design_1_i/microblaze_0_M0_AXIS_TDATA[16]} {design_1_i/microblaze_0_M0_AXIS_TDATA[17]} {design_1_i/microblaze_0_M0_AXIS_TDATA[18]} {design_1_i/microblaze_0_M0_AXIS_TDATA[19]} {design_1_i/microblaze_0_M0_AXIS_TDATA[20]} {design_1_i/microblaze_0_M0_AXIS_TDATA[21]} {design_1_i/microblaze_0_M0_AXIS_TDATA[22]} {design_1_i/microblaze_0_M0_AXIS_TDATA[23]} {design_1_i/microblaze_0_M0_AXIS_TDATA[24]} {design_1_i/microblaze_0_M0_AXIS_TDATA[25]} {design_1_i/microblaze_0_M0_AXIS_TDATA[26]} {design_1_i/microblaze_0_M0_AXIS_TDATA[27]} {design_1_i/microblaze_0_M0_AXIS_TDATA[28]} {design_1_i/microblaze_0_M0_AXIS_TDATA[29]} {design_1_i/microblaze_0_M0_AXIS_TDATA[30]} {design_1_i/microblaze_0_M0_AXIS_TDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/almost_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/datavalid_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/microblaze_0_M0_AXIS_TREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/microblaze_0_M0_AXIS_TVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/rst_clk_wiz_1_100M_peripheral_aresetn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list design_1_i/stream_jpg_yy_nv_mn_v1_0_wed2_0/inst/s00_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_out1]

set_property IOSTANDARD LVCMOS33 [get_ports calibrate]
set_property PACKAGE_PIN J15 [get_ports calibrate]
set_property IOSTANDARD LVCMOS33 [get_ports error_o]
set_property PACKAGE_PIN H17 [get_ports error_o]
