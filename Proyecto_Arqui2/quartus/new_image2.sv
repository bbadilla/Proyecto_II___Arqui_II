module new_image2(input logic [12:0] a,  input logic clk, input logic [127:0] wd,
						 input logic we, output logic [127:0] rd);
						 
  logic [127:0] RAM [8191:0];
  assign rd = RAM[a]; // word aligned
  
  always_ff @(negedge clk)
    if (we) RAM[a] <= wd;
	
endmodule 