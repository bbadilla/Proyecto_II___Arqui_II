module alu
	#(parameter N = 4)
	(input logic [N-1:0] a, b, input logic [1:0] s, output logic [N-1:0] c, output logic z);
	
	logic [N-1:0] sum, sub, out_shft;
	
	assign sum = a + b;
	assign sub = a - b;
	
	shifts shft(a, out_shft);
	
	mux_4_x_1 #(N) mux1(128'b0, sum, sub, out_shft, s, c);
	
	
	assign z = &(~c);
	
endmodule 