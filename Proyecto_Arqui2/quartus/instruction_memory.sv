module instruction_memory(input logic [17:0] a,
								  output logic [17:0] rd);								  
								  
  logic [17:0] memory [100:0];
  
  assign memory[0] = 18'b001000000000000000;
  assign memory[1] = 18'b001000000000000000;
  assign memory[2] = 18'b001001000100000000;
  assign memory[3] = 18'b010111111111101100;
  
  assign rd = memory[a[17:2]]; // word aligned
  
  
			  
endmodule 