module extend_test();

	logic [17:0] in;
	logic [7:0] out;
	
	test DUT(in, out);
	
	initial begin
	in = 18'b111111111111111111; #10;
	$display("in = %h, out = %h", in, out);
	
	end

endmodule 