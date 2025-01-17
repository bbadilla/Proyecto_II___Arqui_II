module split
	#(size = 128)(
	input [size-1:0]  data,
	input	  wrclk,
	input	  wrreq,
	output	[23:0] q,
	output [12:0] memAdrr
);

	logic [7:0] pixel = 8'h0;
	logic [12:0] addr = 8'h0;
	logic newDirEn = 0;
	logic [23:0] temp;
	
	assign q = temp;
	assign memAdrr = addr;
	
	
	always_ff @(posedge wrclk) begin
		if(wrreq)begin
			temp <= data[24*(7-pixel)+:24];
			pixel <= pixel + 8'h1;
			begin
			if(pixel == 7)begin
				pixel <= 8'h0;
				newDirEn <= 1;

			end 
			if (newDirEn)begin
				addr <= addr + 13'h1;
				newDirEn <= 0;
			end
			end
				
		end
		
	end

endmodule
