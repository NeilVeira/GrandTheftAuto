onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib img_proc_mb_opt

do {wave.do}

view wave
view structure
view signals

do {img_proc_mb.udo}

run -all

quit -force
