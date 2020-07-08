module extend_test();

	logic [7:0] in;
	logic [3:0] out;
	
	add_test DUT(in, out);
	
	initial begin
	in = 8'h0A; #10;
	$display("in = %b, out = %b", in, out);
	
	end

endmodule 