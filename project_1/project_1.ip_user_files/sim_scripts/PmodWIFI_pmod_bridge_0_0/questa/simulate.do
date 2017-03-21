onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PmodWIFI_pmod_bridge_0_0_opt

do {wave.do}

view wave
view structure
view signals

do {PmodWIFI_pmod_bridge_0_0.udo}

run -all

quit -force
