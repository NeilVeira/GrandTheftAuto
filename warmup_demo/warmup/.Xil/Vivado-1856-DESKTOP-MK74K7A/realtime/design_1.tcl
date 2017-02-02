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
    set ::env(RT_TMP) "E:/ECE532/warmup/.Xil/Vivado-1856-DESKTOP-MK74K7A/realtime/tmp"
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
      rt::read_verilog -sv -include e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/clk_wiz_v5_3 {
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv
      E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv
    }
      rt::read_verilog -include e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/clk_wiz_v5_3 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/user/fib_lfsr_v1_0/hdl/Fibonacci_LFSR.v
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/user/fib_lfsr_v1_0/hdl/Fib_LFSR_v1_0_S00_AXI.v
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/user/fib_lfsr_v1_0/hdl/Fib_LFSR_v1_0.v
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_Fib_LFSR_0_0/synth/design_1_Fib_LFSR_0_0.v
      E:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/hdl/design_1.v
      E:/ECE532/IPs/ip_repo/Fib_LFSR_1.0/hdl/Fib_LFSR_v1_0_S00_AXI.v
      E:/ECE532/IPs/ip_repo/Fib_LFSR_1.0/hdl/Fib_LFSR_v1_0.v
      E:/ECE532/IPs/ip_repo/Fib_LFSR_1.0/hdl/Fibonacci_LFSR.v
      E:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
    }
      rt::read_vhdl -lib microblaze_v9_6_1 e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/microblaze_v9_6/hdl/microblaze_v9_6_vh_rfs.vhd
      rt::read_vhdl -lib xil_defaultlib {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_microblaze_0_0/synth/design_1_microblaze_0_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_dlmb_v10_0/synth/design_1_dlmb_v10_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_ilmb_v10_0/synth/design_1_ilmb_v10_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/synth/design_1_dlmb_bram_if_cntlr_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/synth/design_1_ilmb_bram_if_cntlr_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_lmb_bram_0/synth/design_1_lmb_bram_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_mdm_1_0/synth/design_1_mdm_1_0.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/synth/design_1_rst_clk_wiz_1_100M_0.vhd
    }
      rt::read_vhdl -lib lmb_v10_v3_0_8 e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_v10_v3_0/hdl/vhdl/lmb_v10.vhd
      rt::read_vhdl -lib lmb_bram_if_cntlr_v4_0_9 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_funcs.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_primitives.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/xor18.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parity.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parityenable.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/checkbit_handler.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/correct_one_bit.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect_mask.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/axi_interface.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_mux.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_cntlr.vhd
    }
      rt::read_vhdl -lib blk_mem_gen_v8_3_3 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/blk_mem_gen_v8_3/hdl/blk_mem_gen_v8_3_vhsyn_rfs.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/blk_mem_gen_v8_3/hdl/blk_mem_gen_v8_3.vhd
    }
      rt::read_vhdl -lib axi_lite_ipif_v3_0_4 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd
    }
      rt::read_vhdl -lib mdm_v3_2_6 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm_primitives.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/arbiter.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/srl_fifo.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/bus_master.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/jtag_control.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm_core.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/mdm_v3_2/hdl/vhdl/mdm.vhd
    }
      rt::read_vhdl -lib lib_cdc_v1_0_2 e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd
      rt::read_vhdl -lib proc_sys_reset_v5_0_9 {
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd
      e:/ECE532/warmup/warmup.srcs/sources_1/bd/design_1/ipshared/xilinx.com/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd
    }
      rt::read_vhdl -lib xpm E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top design_1
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
    rt::set_parameter enableSplitFlowPath "E:/ECE532/warmup/.Xil/Vivado-1856-DESKTOP-MK74K7A/"
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