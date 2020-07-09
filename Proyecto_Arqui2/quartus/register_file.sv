module register_file(input logic clk, rst,
							input logic we3,
							input logic [3:0] ra1, ra2, ra3,
							input logic [127:0] wd3,
							output logic [127:0] rd1, rd2);
							
  logic [127:0] rf[14:0];
	
  always_ff @(posedge rst, negedge clk)
	 begin
		if (rst)
			begin
				rf[0] <= 128'hfafafafafafafafafafafafafafafafa;
				rf[14] <= 128'b0;
				rf[13] <= 128'h00000000000000000000000000002000; 

			end
		else 
			begin
			  if (we3) rf[ra3] <= wd3;
			end		
		end    	 
	 
  assign rd1 = rf[ra1];
  assign rd2 = rf[ra2];

endmodule 