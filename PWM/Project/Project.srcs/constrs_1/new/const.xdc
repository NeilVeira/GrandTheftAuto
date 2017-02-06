set_property PACKAGE_PIN H17 [get_ports {O[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {O[0]}]
set_property PACKAGE_PIN K15 [get_ports {O[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {O[1]}]
set_property PACKAGE_PIN J13 [get_ports {O[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {O[2]}]
set_property PACKAGE_PIN N14 [get_ports {O[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {O[3]}]

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock_rtl }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clock_rtl }];


# SW0 bound to reset_rtl
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { reset_rtl}];

# SW1 bound to reset_rtl_0
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { reset_rtl_0}];