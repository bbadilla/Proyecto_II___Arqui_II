module instruction_memory(input logic [17:0] a,
								  output logic [17:0] rd);								  
								  
  logic [17:0] memory [100:0];
    
  assign memory[0] = 18'b001001000111100000;	// LDR ORIGINAL VR1 VR14
  assign memory[1] = 18'b001001000111100000;	// LDR ORIGINAL VR1 VR14
  assign memory[2] = 18'b001001000111100000;	// LDR ORIGINAL VR1 VR14
  assign memory[3] = 18'b001000000000010000; // STR ORIGINAL VR1
  assign memory[4] = 18'b000010111011100000; // ++  VR14
  assign memory[5] = 18'b000100000011101101; // CMP VR14 VR13
  assign memory[6] = 18'b110000000000000000; // BEQ 
  assign memory[7] = 18'b010111111111011100; // B
  
  assign memory[8] = 18'b000000111000000000; // RST VR14
  
  assign memory[9] = 18'b001001000111100000;		// LDR ORIGINAL VR1 VR14
  assign memory[10] = 18'b001001000111100000;	// LDR ORIGINAL VR1 VR14
  assign memory[11] = 18'b001001000111100000;	// LDR ORIGINAL VR1 VR14
  assign memory[12] = 18'b001011000000010000;	// LDR ACUMULATOR VR0 VR1
  assign memory[13] = 18'b000110001000000000; 	// SHFT VR2 VR0
  assign memory[14] = 18'b001010000011100010; 	// STR NEW VR2
  assign memory[15] = 18'b000010111011100000; 	// ++ VR14
  assign memory[16] = 18'b000100000011101101; 	// CMP VR14 VR13
  assign memory[17] = 18'b110000000000000000; 	// BEQ
  assign memory[18] = 18'b010111111111010100; 	// B
  
  assign memory[19] = 18'b000000111000000000; 	// RST VR14
  
  
  assign memory[20] = 18'b001101000111100000;	// LDR NEW VR1 VR14
  assign memory[21] = 18'b001101000111100000;	// LDR NEW VR1 VR14
  assign memory[22] = 18'b001101000111100000;	// LDR NEW VR1 VR14
  assign memory[23] = 18'b001100000000010000; 	// STR NEW VR1
  assign memory[24] = 18'b000010111011100000; 	// ++ VR14
  assign memory[25] = 18'b000100000011101101; 	// CMP VR14 
  assign memory[26] = 18'b110000000000000000; 	// BEQ
  assign memory[27] = 18'b010111111111011100; 	// B  
  
  assign memory[28] = 18'b000000111000000000; 	// RST VR14
  
  assign memory[29] = 18'b011000000000000000;   // FINISH
  
  assign rd = memory[a[17:2]]; // word aligned
  
  
			  
endmodule 