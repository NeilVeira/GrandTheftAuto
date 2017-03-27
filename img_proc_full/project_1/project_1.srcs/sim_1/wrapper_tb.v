module wrapper_tb
	();

	reg clk;
	reg reset;
	wire [3:0] R;
	wire [3:0] G;
	wire [3:0] B;
	wire H, V;

	image_processor_wrapper image_processor_wrapper_inst (
		.clk(clk),
		.reset(reset),
		.R(R),
		.G(G),
		.B(B),
		.H(H),
		.V(V)
	);

	initial begin
		reset = 1;
		clk = 0;
		#20 
		reset = 0;
	end

	always begin
		#5 clk = !clk;
    end

endmodule
