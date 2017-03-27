onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PmodWIFI_axi_gpio_1_0_opt

do {wave.do}

view wave
view structure
view signals

do {PmodWIFI_axi_gpio_1_0.udo}

run -all

quit -force
