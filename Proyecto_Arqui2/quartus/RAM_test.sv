`timescale 1 ps / 1 ps
module RAM_test();

	logic [12:0]  dir;
	logic [127:0] q;
	logic wrclk, wd;


	always begin
		 wrclk <= 1; # 5; wrclk <= 0; # 5;
	end
	//7e7e7e 7e7e7e 7d7d7d 7b7b7b 7a7a7a 7a7a7a 7e7e7e 818181

	original_image DUT(dir, wrclk, 128'b0, 1'b0, q);

	initial begin
		 dir = 13'b0;#5;
		dir = 13'b1; 

	end

endmodule
