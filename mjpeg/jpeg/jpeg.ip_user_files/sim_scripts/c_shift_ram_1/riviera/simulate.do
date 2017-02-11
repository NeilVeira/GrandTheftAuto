onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+c_shift_ram_1 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L xbip_utils_v3_0_6 -L c_reg_fd_v12_0_2 -L c_mux_bit_v12_0_2 -L c_shift_ram_v12_0_9 -O5 xil_defaultlib.c_shift_ram_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {c_shift_ram_1.udo}

run -all

endsim

quit -force
