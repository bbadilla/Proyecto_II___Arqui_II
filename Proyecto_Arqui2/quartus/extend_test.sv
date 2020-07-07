module extend_test();

	logic [7:0] in;
	logic [255:0] out;
	
	deco_hist DUT(in, out);
	
	initial begin
	in = 8'h0a; #10;
	$display("in = %h, out = %b", in, out);
	
	in = 8'h0b; #10;
	$display("in = %h, out = %b", in, out);
	
	end

endmodule 