
`timescale 1 ns / 1 ps

	module stream_jpg_yy_nv_mn_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,
		input wire clk_25,
		output [3:0] R,
		output [3:0] G,
		output [3:0] B,
		output H,
		output V,
        input calibrate,
        input [1:0] microblaze_read,
        output [1:0] img_proc_write,
        output [12:0] edge_ram_addr,
        output [19:0] edge_ram_din,
        output edge_ram_wren
	);
// Instantiation of Axi Bus Interface S00_AXIS
	/*stream_jpg_yy_nv_mn_v1_0_S00_AXIS # ( 
		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
	) stream_jpg_yy_nv_mn_v1_0_S00_AXIS_inst (
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);*/
	
	 image_processor img_proc_inst(
		.Clk(s00_axis_aclk),
		.clk_25(clk_25),
		.data_i(s00_axis_tdata),
		.reset_i(s00_axis_aresetn),
		.datavalid_i(s00_axis_tvalid),
		.ready_i(1'b1),
		.ready_o(s00_axis_tready), 
        .calibrate(calibrate), 
		.R(R),
		.G(G),
		.B(B),
		.H(H),
		.V(V),
        .microblaze_read(microblaze_read),
        .img_proc_write(img_proc_write),
        .edge_ram_addr(edge_ram_addr),
        .edge_ram_din(edge_ram_din),
        .edge_ram_wren(edge_ram_wren)
	);

	// Add user logic here

	// User logic ends

	endmodule
