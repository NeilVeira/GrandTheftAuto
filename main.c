#include "xparameters.h"
#include "xil_io.h"
#include "myip.h"

volatile unsigned int *myip_ptr = (unsigned int*) XPAR_Fib_LFSR_0_S00_AXI_BASEADDR;

int main()
{
	Fib_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x00000004);
	Fib_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x10, 0x00000001);
	Fib_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x00000003);
	
	// Low Level Driver
	for (int i =0; i<=100; i++)
		for (int j=0; j<=1000000;j++)
			Fib_LFSR_mReadReg(XPAR_MYIP_0_S00_AXI_BASEADDR, 0xC);

	return 0;
}
