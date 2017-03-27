#
#Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
#
set_param project.singleFileAddWarning.threshold 0
set_param chipscope.flow 0
set part xc7a100tcsg324-1
set ip_vlnv xilinx.com:ip:ila:6.1
set ip_module_name u_ila_0_CV
set params {{{PARAM_VALUE.ALL_PROBE_SAME_MU} {true} {PARAM_VALUE.ALL_PROBE_SAME_MU_CNT} {2} {PARAM_VALUE.C_ADV_TRIGGER} {false} {PARAM_VALUE.C_DATA_DEPTH} {1024} {PARAM_VALUE.C_EN_STRG_QUAL} {true} {PARAM_VALUE.C_INPUT_PIPE_STAGES} {0} {PARAM_VALUE.C_NUM_OF_PROBES} {16} {PARAM_VALUE.C_PROBE0_TYPE} {0} {PARAM_VALUE.C_PROBE0_WIDTH} {32} {PARAM_VALUE.C_PROBE10_TYPE} {0} {PARAM_VALUE.C_PROBE10_WIDTH} {1} {PARAM_VALUE.C_PROBE11_TYPE} {0} {PARAM_VALUE.C_PROBE11_WIDTH} {1} {PARAM_VALUE.C_PROBE12_TYPE} {0} {PARAM_VALUE.C_PROBE12_WIDTH} {1} {PARAM_VALUE.C_PROBE13_TYPE} {0} {PARAM_VALUE.C_PROBE13_WIDTH} {1} {PARAM_VALUE.C_PROBE14_TYPE} {0} {PARAM_VALUE.C_PROBE14_WIDTH} {1} {PARAM_VALUE.C_PROBE15_TYPE} {0} {PARAM_VALUE.C_PROBE15_WIDTH} {1} {PARAM_VALUE.C_PROBE1_TYPE} {0} {PARAM_VALUE.C_PROBE1_WIDTH} {32} {PARAM_VALUE.C_PROBE2_TYPE} {0} {PARAM_VALUE.C_PROBE2_WIDTH} {2} {PARAM_VALUE.C_PROBE3_TYPE} {0} {PARAM_VALUE.C_PROBE3_WIDTH} {2} {PARAM_VALUE.C_PROBE4_TYPE} {0} {PARAM_VALUE.C_PROBE4_WIDTH} {32} {PARAM_VALUE.C_PROBE5_TYPE} {0} {PARAM_VALUE.C_PROBE5_WIDTH} {1} {PARAM_VALUE.C_PROBE6_TYPE} {0} {PARAM_VALUE.C_PROBE6_WIDTH} {1} {PARAM_VALUE.C_PROBE7_TYPE} {0} {PARAM_VALUE.C_PROBE7_WIDTH} {1} {PARAM_VALUE.C_PROBE8_TYPE} {0} {PARAM_VALUE.C_PROBE8_WIDTH} {1} {PARAM_VALUE.C_PROBE9_TYPE} {0} {PARAM_VALUE.C_PROBE9_WIDTH} {1} {PARAM_VALUE.C_TRIGIN_EN} {0} {PARAM_VALUE.C_TRIGOUT_EN} {0}}}
set output_xci g:/yy/GrandTheftAuto/project_1/project_1.runs/impl_1/.Xil/Vivado-11156-TP-MILWIDG7/u_ila_0_CV.0/out/result.xci
set output_dcp g:/yy/GrandTheftAuto/project_1/project_1.runs/impl_1/.Xil/Vivado-11156-TP-MILWIDG7/u_ila_0_CV.0/out/result.dcp
set output_dir g:/yy/GrandTheftAuto/project_1/project_1.runs/impl_1/.Xil/Vivado-11156-TP-MILWIDG7/u_ila_0_CV.0/out
set ip_repo_paths {
  g:/yy/GrandTheftAuto/project_1/project_1.cache/ip
  w:/img_proc_full
  G:/yy/GrandTheftAuto/img_proc_full
  G:/yy/GrandTheftAuto/vivado-library-master/if/pmod_v1_0
  G:/yy/GrandTheftAuto/vivado-library-master/ip/Pmods/PmodWIFI_v1_0
  G:/yy/GrandTheftAuto/vivado-library-master/ip/Pmods/Pmod_Bridge_v1_0
  G:/Downloads/vivado-library-master/if/pmod_v1_0
  G:/Downloads/vivado-library-master/ip/Pmods/Pmod_Bridge_v1_0
  G:/Downloads/vivado-library-master/ip/Pmods/PmodWIFI_v1_0
  G:/yy/GrandTheftAuto/remote_controller
  G:/yy/GrandTheftAuto/vivado-library-master/ip/SWLED
  G:/yy/GrandTheftAuto/ip_repo
}
set ip_output_repo g:/yy/GrandTheftAuto/project_1/project_1.cache/ip
set ip_cache_permissions {read write}

set oopbus_ip_repo_paths [get_param chipscope.oopbus_ip_repo_paths]

set synth_opts {}
set xdc_files {}
source {C:/Xilinx/Vivado/2016.2/scripts/ip/ipxchipscope.tcl}

set failed [catch {ipx::chipscope::gen_and_synth_ip $part $ip_vlnv $ip_module_name $params $output_xci $output_dcp $output_dir $ip_repo_paths $ip_output_repo $ip_cache_permissions $oopbus_ip_repo_paths $synth_opts $xdc_files} errMessage]

if { $failed } {
  puts "Caught exception:"
  puts "$errMessage"
  exit 1
}
