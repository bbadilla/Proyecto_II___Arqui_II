module Add_8
	(input logic [7:0] a, output logic [3:0] i);
	
	assign i = a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7];
	
endmodule 