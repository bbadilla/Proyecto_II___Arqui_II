module instruction_memory(input logic [31:0] a,
								  output logic [31:0] rd);								  
								  
  logic [31:0] memory [100:0];
  
  assign memory[0] = 32'hE3A01078; // MOV R1, #120
  assign memory[1] = 32'hE3A02001; // MOV R2, #1
  assign memory[2] = 32'hEAFFFFFF; // B pene
  assign memory[3] = 32'hE5812000; // STR R2, [R1]
  assign memory[4] = 32'hE2822001; // ADD R2, R2, #1
  assign memory[5] = 32'hEAFFFFFC; // B pene
  
//  assign memory[0] = 32'hE3A01008; // MOV R1, #7
//  assign memory[1] = 32'hE3A02007; // MOV R2, #7
//  assign memory[2] = 32'hE0813002; // ADD R3, R1, R2
//  assign memory[3] = 32'hE5813000; // STR R3, [R1]
//  assign memory[4] = 32'hEA000000; // B
  
//  
//  assign memory[0] = 32'hE3A00001; // MOV R0, #1
//  assign memory[1] = 32'hE3A01007; // MOV R1, #7
//  assign memory[2] = 32'hE3A02002; // MOV R2, #2
//  assign memory[3] = 32'hE1510002; // CMP R1, R2
//  assign memory[4] = 32'hE2803001; // ADD R3, R0, #1
//  assign memory[5] = 32'h00833000; // ADDEQ R3, R3, RO
//  assign memory[6] = 32'hE0833000; // ADD R3, R3, R0
//  assign memory[7] = 32'hE2834001; // ADD R4, R3, #1
//  assign memory[3] = 32'hE3A03007; // MOV R3, #7
//  assign memory[4] = 32'h00813002; // ADDEQ R3, R1, R2
//  assign memory[5] = 32'hE2833001; // ADD R3, R3, #1

  
//  assign memory[0] = 32'hE04F000F;
//  assign memory[1] = 32'hE2802005;
//  assign memory[2] = 32'hE280300C;
//  assign memory[3] =  32'hE2437009;
//  assign memory[4] =  32'hE1874002;
//  assign memory[5] =  32'hE0035004;
//  assign memory[6] =  32'hE0855004;
//  assign memory[7] =  32'hE0558007;
//  assign memory[8] =  32'h0A00000C;
//  assign memory[9] =  32'hE0538004;
//  assign memory[10] =  32'hAA000000;
//  assign memory[11] =  32'hE2805000;
//  assign memory[12] =  32'hE0578002;
//  assign memory[13] =  32'hB2857001;
//  assign memory[14] =  32'hE0477002;
//  assign memory[15] =  32'hE5837054;
//  assign memory[16] =  32'hE5902060;
//  assign memory[17] =  32'hE08FF000;
//  assign memory[18] =  32'hE280200E;
//  assign memory[19] =  32'hEA000001;
//  assign memory[20] =  32'hE280200D;
//  assign memory[21] =  32'hE280200A;
//  assign memory[22] =  32'hE5802064;
	 
  assign rd = memory[a[31:2]]; // word aligned
			  
endmodule 