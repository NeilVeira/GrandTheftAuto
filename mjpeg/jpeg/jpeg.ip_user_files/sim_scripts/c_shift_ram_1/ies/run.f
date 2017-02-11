-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xbip_utils_v3_0_6 \
  "../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/c_reg_fd_v12_0_2 \
  "../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
  "../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \
-endlib
-makelib ies/c_mux_bit_v12_0_2 \
  "../../../ipstatic/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
  "../../../ipstatic/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0.vhd" \
-endlib
-makelib ies/c_shift_ram_v12_0_9 \
  "../../../ipstatic/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
  "../../../ipstatic/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../jpeg.srcs/sources_1/ip/c_shift_ram_1/sim/c_shift_ram_1.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

