module register_file(input logic clk, rst,
							input logic we3,
							input logic [3:0] ra1, ra2, ra3,
							input logic [127:0] wd3, r15,
							output logic [127:0] rd1, rd2);
							
  logic [127:0] rf[14:0];
  
//  initial begin
//		rf[0] = 128'h000C000F00050001000B00030008000A;
//  end
	
  always_ff @(posedge rst, negedge clk)
	 begin
		if (rst) rf[0] <= 128'h000C000F00050001000B00030008000A;
		else 
			begin
			  if (we3) rf[ra3] <= wd3;
			end		
		end    	 
	 
  assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
  assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];

endmodule 