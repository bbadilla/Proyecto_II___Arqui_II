module instruction_memory(input logic [17:0] a,
								  output logic [17:0] rd);								  
								  
  logic [17:0] memory [100:0];
  
  /*assign memory[0] = 18'b001000000000000000; // STR
  assign memory[1] = 18'b001001000100000000;	// LDR
  assign memory[2] = 18'b000010111011100000; // ++
  assign memory[3] = 18'b000101000011101101; // CMP
  assign memory[4] = 18'b110000000000000000; // BEQ
  assign memory[5] = 18'b010111111111100100; // B
  assign memory[6] = 18'b000101000011101101; // CMP*/
  
  assign memory[0] = 18'b001001000111100000;	// LDR
  assign memory[1] = 18'b001001000111100000;	// LDR
  assign memory[2] = 18'b001001000111100000;	// LDR
  assign memory[3] = 18'b001000000000010000; // STR
  assign memory[4] = 18'b000011111011100000; // ++
  assign memory[5] = 18'b000100000011101101; // CMP
  assign memory[6] = 18'b110000000000000000; // BEQ
  assign memory[7] = 18'b010111111111011100; // B
  assign memory[8] = 18'b000000111000000000; // RST
  assign memory[9] = 18'b000110000000000000; // SHFT
  
  
  assign rd = memory[a[17:2]]; // word aligned
  
  
			  
endmodule 