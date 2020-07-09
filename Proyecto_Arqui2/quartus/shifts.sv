module shifts(input logic [127:0] a, output logic [127:0] b);
	
	logic [23:0] c1;
	logic [23:0] c2;
	logic [23:0] c3;
	logic [23:0] c4;
	logic [23:0] c5;
	logic [23:0] c6;
	logic [23:0] c7;
	logic [23:0] c8;
	
	assign c1 = a[15:0] << 8;
	assign b[15:0] = c1 >> 16;
	
	assign c2 = a[31:16] << 8;
	assign b[31:16] = c2 >> 16;
	
	assign c3 = a[47:32] << 8;
	assign b[47:32] = c3 >> 16;
	
	assign c4 = a[63:48] << 8;
	assign b[63:48] = c4 >> 16;
	
	assign c5 = a[79:64] << 8;
	assign b[79:64] = c5 >> 16;
	
	assign c6 = a[95:80] << 8;
	assign b[95:80] = c6 >> 16;
	
	assign c7 = a[111:96] << 8;
	assign b[111:96] = c7 >> 16;
	
	assign c8 = a[127:112] << 8;
	assign b[127:112] = c8 >> 16;
	
endmodule 