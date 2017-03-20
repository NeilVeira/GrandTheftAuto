@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim wrapper_tb_func_synth -key {Post-Synthesis:sim_1:Functional:wrapper_tb} -tclbatch wrapper_tb.tcl -view C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/GrandTheftAuto/img_proc_full_v2/jpeg_testbench_func_synth.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
