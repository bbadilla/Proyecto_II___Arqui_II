`timescale 1 ps / 1 ps
module RAM_test();

	logic [12:0]  dir;
	logic [127:0] q, data;
	logic wrclk, wd;


	always begin
		 wrclk <= 1; # 5; wrclk <= 0; # 5;
	end

	new_image DUT(dir, wrclk, data, 1'b1, q); 

	initial begin
		dir = 13'b0; data = 128'hfafafafafafafafafafafafafafafafa;
	end

endmodule
