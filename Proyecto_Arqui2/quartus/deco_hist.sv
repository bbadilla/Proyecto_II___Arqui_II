module deco_hist(input logic [7:0] pixel, output logic [255:0] deco_out);

	logic [255:0] x = 255'b1;
	assign deco_out = x << pixel;

endmodule 
