module alu
	#(parameter N = 4)
	(input logic [N-1:0] a, b, input logic s, output logic [N-1:0] c, output logic z);
	
	logic [N-1:0] sum, sub;
	
	assign sum = a + b;
	assign sub = a - b;
	
	mux_2_x_1 #(N) mux1(sum, sub, s, c);
	
	assign z = &(~c);
	
endmodule 