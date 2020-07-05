module Control_Unit(input logic [5:0] a, output logic mem_write, reg_write);
	
	logic mem;
	assign mem = ~a[4] & a[3];
	
	assign mem_write = ~a[0] & mem;
	assign reg_write = a[0] & mem;
	
endmodule
