proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.cache/wt [current_project]
  set_property parent.project_path C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.xpr [current_project]
  set_property ip_cache_permissions disable [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.runs/synth_1/stream_jpg_yy_nv_mn_v1_0.dcp
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/check_FF_fifo/jpeg_checkff_fifo_fifo_generator_v2_3_xst_1.ngc
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/check_FF_fifo/jpeg_checkff_fifo_fifo_generator_v2_3_xst_1_blkmemdp_v6_2_xst.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/upsampling_buffer/jpeg_upsampling_buffer.ngc
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/qt_table/jpeg_qt_sr.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/idct/jpeg_idct_core_12.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/huffman_input_sr/jpeg_huffman_input_sr.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_tables/jpeg_ht_tables.ngc
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_nr_of_symbols/jpeg_ht_nr_of_symbols.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/dequantize_multiplier/jpeg_dequant_multiplier.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/input_fifo/jpeg_input_fifo.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/check_FF_fifo/jpeg_checkff_fifo.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/qt_table/jpeg_qt_sr_c_shift_ram_v8_0_xst_1.ngc
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/input_fifo/jpeg_input_fifo_fifo_generator_v2_3_xst_1_blkmemdp_v6_2_xst.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/input_fifo/jpeg_input_fifo_fifo_generator_v2_3_xst_1.ngc
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/idct/jpeg_idct_core_6.edn
  read_edif C:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/dequantize_multiplier/jpeg_dequant_multiplier_mult_gen_v8_0_xst_1.ngc
  read_xdc -ref fifo_generator_0 -cells U0 c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells inst c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files c:/Users/yy/Desktop/ece532_debug/img_proc_full/jpeg.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  link_design -top stream_jpg_yy_nv_mn_v1_0 -part xc7a100tcsg324-1
  write_hwdef -file stream_jpg_yy_nv_mn_v1_0.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force stream_jpg_yy_nv_mn_v1_0_opt.dcp
  catch { report_drc -file stream_jpg_yy_nv_mn_v1_0_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force stream_jpg_yy_nv_mn_v1_0_placed.dcp
  catch { report_io -file stream_jpg_yy_nv_mn_v1_0_io_placed.rpt }
  catch { report_utilization -file stream_jpg_yy_nv_mn_v1_0_utilization_placed.rpt -pb stream_jpg_yy_nv_mn_v1_0_utilization_placed.pb }
  catch { report_control_sets -verbose -file stream_jpg_yy_nv_mn_v1_0_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force stream_jpg_yy_nv_mn_v1_0_routed.dcp
  catch { report_drc -file stream_jpg_yy_nv_mn_v1_0_drc_routed.rpt -pb stream_jpg_yy_nv_mn_v1_0_drc_routed.pb -rpx stream_jpg_yy_nv_mn_v1_0_drc_routed.rpx }
  catch { report_methodology -file stream_jpg_yy_nv_mn_v1_0_methodology_drc_routed.rpt -rpx stream_jpg_yy_nv_mn_v1_0_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file stream_jpg_yy_nv_mn_v1_0_timing_summary_routed.rpt -rpx stream_jpg_yy_nv_mn_v1_0_timing_summary_routed.rpx }
  catch { report_power -file stream_jpg_yy_nv_mn_v1_0_power_routed.rpt -pb stream_jpg_yy_nv_mn_v1_0_power_summary_routed.pb -rpx stream_jpg_yy_nv_mn_v1_0_power_routed.rpx }
  catch { report_route_status -file stream_jpg_yy_nv_mn_v1_0_route_status.rpt -pb stream_jpg_yy_nv_mn_v1_0_route_status.pb }
  catch { report_clock_utilization -file stream_jpg_yy_nv_mn_v1_0_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force stream_jpg_yy_nv_mn_v1_0_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

