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
ExecStep $xv_path/bin/xsim wrapper_tb_func_synth -key {Post-Synthesis:sim_1:Functional:wrapper_tb} -tclbatch wrapper_tb.tcl -view /nfs/ug/homes-3/v/veiranei/ece532/img_proc_full/jpeg_testbench_func_synth.wcfg -log simulate.log
