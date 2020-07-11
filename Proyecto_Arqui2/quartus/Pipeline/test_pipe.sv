`timescale 1 ps / 1 ps
module test_pipe();

	logic [17:0] pc;
	logic clk, reset;
	
	always begin
		 clk <= 1; # 5; clk <= 0; # 5;
	end
	

	pipelined_processor DUT(clk, reset, pc);

	initial begin
		 reset <= 1; #5; reset <= 0; #5 reset <= 0;	 
		
	end
	
endmodule 