#include "xparameters.h"
#include "xil_io.h"
#include "Fib_LFSR.h"

#define XPAR_Fib_LFSR_0_S00_AXI_BASEADDR 0x44A00000

//volatile unsigned int *myip_ptr = (unsigned int*) XPAR_Fib_LFSR_0_S00_AXI_BASEADDR;

int main()
{
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x4);
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x10, 0x1);
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x5);

	// Low Level Driver
	for (int i =0; i<=100; i++){
		for (int j=0; j<=1000000;j++){
			j++;
		}
		FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0xC);
	}
	return 0;
}
