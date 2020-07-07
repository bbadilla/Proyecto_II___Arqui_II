module alu_test();

	logic [3:0] a, b, c;
	logic s, z;
	
	alu DUT(a, b, s, c, z);
	
	initial begin
	a = 4'b1000; b = 4'b1000; s = 1'b1; #10;
	$display("a = %h, b = %h, s = %h, c = %h, z = %h", a, b, s, c, z);
	
	end

endmodule 