set_property SRC_FILE_INFO {cfile:c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/mjpeg_decoder/tmp/jpeg/jpeg.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc rfile:../../../../../jpeg.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_ooc.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells U0]
set_property src_info {type:SCOPED_XDC file:1 line:53 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 20.000 -name TS_CLK [get_ports clk]