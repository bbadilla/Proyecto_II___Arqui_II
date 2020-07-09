`timescale 1 ps / 1 ps
module test();

	logic [17:0] pc;
	logic clk, reset; 
	
	always begin
		 clk <= 1; # 5; clk <= 0; # 5;
	end
	//7e7e7e 7e7e7e 7d7d7d 7b7b7b 7a7a7a 7a7a7a 7e7e7e 818181

	DataPath DUT(clk, reset, pc);

	initial begin
		 reset <= 1; #5; reset <= 0; #5 reset <= 0;
	end
	
endmodule 