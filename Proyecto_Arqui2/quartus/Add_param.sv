module Add_param
	#(parameter N = 4)
	(input logic [N-1:0] a, b, output logic [N-1:0] c);
	
	assign c = a + b;
	
endmodule 