module histogram();

	logic [127:0]  data, rd;
	logic wrclk, wd;


	always begin
		 wrclk=~wrclk;
		 #5;
		 wd = ~wd;
	end
	//7e7e7e 7e7e7e 7d7d7d 7b7b7b 7a7a7a 7a7a7a 7e7e7e 818181

	data_memory DUT(wrclk, wd, data, rd);

	initial begin
		 wrclk = 0; wd = 1; 
		 data = 128'h0;#5;
		 wrclk = 1;
		 wrclk = 0;
		 data = 128'h000C000F00050001000B00030008000A;#5;
		 
		 wd = 0;
		 wrclk = 1;

	end

endmodule
