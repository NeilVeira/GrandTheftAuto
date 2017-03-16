# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/.Xil/Vivado-10360-DESKTOP-QUJLBQI/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a100tcsg324-1

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_nr_of_symbols {
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv
      C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv
    }
      rt::read_verilog -include C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_nr_of_symbols {
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/edge_detector.v
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/image_processor.v
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/vga_controller.v
    }
      rt::read_vhdl -lib xil_defaultlib {
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_upsampling_buffer.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_qt_sr.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_idct_core_12.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_huffman_input_sr.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_ht_tables.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_ht_nr_of_symbols.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_dequant_multiplier.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/upsampling_buffer/jpeg_upsampling_buffer.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/qt_table/jpeg_qt_sr.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/idct/jpeg_idct_core_12.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/huffman_input_sr/jpeg_huffman_input_sr.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_tables/jpeg_ht_tables.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/ht_nr_of_symbols/jpeg_ht_nr_of_symbols.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/dequantize_multiplier/jpeg_dequant_multiplier.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_YCbCr2RGB.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_upsampling.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_input_fifo.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_idct.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_huffman.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_header.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_dezigzag.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_dequantize.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_check_FF.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_checkff_fifo.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/input_fifo/jpeg_input_fifo.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/check_FF_fifo/jpeg_checkff_fifo.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/jpeg_qt_tables.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/coregen/idct/jpeg_idct_core_6.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/imports/mjpeg/pcores/myipif/hdl/vhdl/fifo_sim32.vhd
      C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/vga_driver.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/synth/fifo_generator_0.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/blk_mem_gen_3/synth/blk_mem_gen_3.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/blk_mem_gen_2/synth/blk_mem_gen_2.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/blk_mem_gen_1/synth/blk_mem_gen_1.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/blk_mem_gen_0/synth/blk_mem_gen_0.vhd
    }
      rt::read_vhdl -lib blk_mem_gen_v8_3_3 {
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/blk_mem_gen_v8_3_3/hdl/blk_mem_gen_v8_3_vhsyn_rfs.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/blk_mem_gen_v8_3_3/hdl/blk_mem_gen_v8_3.vhd
    }
      rt::read_vhdl -lib fifo_generator_v13_1_1 {
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1_vhsyn_rfs.vhd
      c:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/jpeg.srcs/sources_1/ip/fifo_generator_0/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1.vhd
    }
      rt::read_vhdl -lib xpm C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top image_processor
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full/.Xil/Vivado-10360-DESKTOP-QUJLBQI/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
      rt::run_rtlelab -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
