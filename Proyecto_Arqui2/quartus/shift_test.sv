module shift_test();
	
	logic [127:0]  a;
	logic [127:0] b;

	shifts DUT(a, b);
	
	initial begin
	a = 128'hfafafafafafafafafafafafafafafafa; #10;
	$display("a = %h, b = %h", a, b);
	
	end
	
endmodule 