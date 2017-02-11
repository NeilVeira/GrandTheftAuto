vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/xbip_utils_v3_0_6
vlib msim/c_reg_fd_v12_0_2
vlib msim/c_mux_bit_v12_0_2
vlib msim/c_shift_ram_v12_0_9

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap xbip_utils_v3_0_6 msim/xbip_utils_v3_0_6
vmap c_reg_fd_v12_0_2 msim/c_reg_fd_v12_0_2
vmap c_mux_bit_v12_0_2 msim/c_mux_bit_v12_0_2
vmap c_shift_ram_v12_0_9 msim/c_shift_ram_v12_0_9

vlog -work xil_defaultlib -64 -incr -sv \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_6 -64 -93 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_2 -64 -93 \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \

vcom -work c_mux_bit_v12_0_2 -64 -93 \
"../../../ipstatic/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_mux_bit_v12_0_2/hdl/c_mux_bit_v12_0.vhd" \

vcom -work c_shift_ram_v12_0_9 -64 -93 \
"../../../ipstatic/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
"../../../ipstatic/c_shift_ram_v12_0_9/hdl/c_shift_ram_v12_0.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../jpeg.srcs/sources_1/ip/c_shift_ram_0/sim/c_shift_ram_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

