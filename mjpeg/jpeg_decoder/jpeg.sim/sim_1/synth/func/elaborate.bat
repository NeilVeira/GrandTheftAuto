@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto f1a030eb72f44efca035727241454eb7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot jpeg_testbench_func_synth xil_defaultlib.jpeg_testbench -log elaborate.log -cc clang
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
