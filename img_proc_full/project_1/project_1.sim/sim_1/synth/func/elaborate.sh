#!/bin/bash -f
xv_path="/cad1/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto f1a030eb72f44efca035727241454eb7 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L secureip --snapshot wrapper_tb_func_synth xil_defaultlib.wrapper_tb xil_defaultlib.glbl -log elaborate.log -cc clang
