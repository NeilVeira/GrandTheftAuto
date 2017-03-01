#include "xparameters.h"
#include "xil_io.h"
//#include "image_proc_AXI.h"

#define XPAR_IMAGE_PROC_AXI_0_S00_AXI_BASEADDR 0x44A00000

volatile unsigned int *axi_ptr = (unsigned int*) XPAR_IMAGE_PROC_AXI_0_S00_AXI_BASEADDR;

int main()
{
	unsigned int empty, full, dout, rd_en;
	//unsigned int x,y;
	while (1){
		//poll until not empty
		do {
			empty = *(axi_ptr+2);
		} while (empty);

		//read value
		*(axi_ptr) = 1; //set read enable
		dout = *(axi_ptr+1);
		*(axi_ptr+4) = dout & 0x00FF; //lower 8 bits for X
		*(axi_ptr+5) = (dout & 0xFF00) >> 8; //upper 8 bits for Y
		//xil_printf("read edge pixel (%d,%d)\n",x,y);
	}
	return 0;
}
