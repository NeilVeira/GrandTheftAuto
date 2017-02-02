#include "xparameters.h"
#include "xil_io.h"
#include "Fib_LFSR.h"

#define XPAR_Fib_LFSR_0_S00_AXI_BASEADDR 0x44A00000

#define FAST 	0x00F40000
#define MEDIUM 	0x03000000
#define SLOW 	0x1DCD0000

//volatile unsigned int *myip_ptr = (unsigned int*) XPAR_Fib_LFSR_0_S00_AXI_BASEADDR;

int main()
{
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x4);
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x10, 0xF0F0);
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x04, FAST);
	FIB_LFSR_mWriteReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0, 0x7);

	xil_printf("Starting\n");

	xil_printf("%x\n",FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x04));
	xil_printf("%x\n",FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x00));

	/*for (int i=0; i<1000; i++){
		//for (int j=0; j<10000; j++) ;
		xil_printf("%x\n",FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x08));
	}*/

	// Low Level Driver
	for (int i =0; i<=100; i++){
		for (int j=0; j<=1000000;j++){
		}
		xil_printf("%x\n",FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0x08));
		xil_printf("%x\n",FIB_LFSR_mReadReg(XPAR_Fib_LFSR_0_S00_AXI_BASEADDR, 0xC));
	}
	return 0;
}

