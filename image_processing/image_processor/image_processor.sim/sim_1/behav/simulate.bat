@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim image_processor_tb_behav -key {Behavioral:sim_1:Functional:image_processor_tb} -tclbatch image_processor_tb.tcl -view C:/Users/Neil/Documents/Neil/EngSci/year_4_winter/ECE532/image_processing/image_processor/image_processor_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
