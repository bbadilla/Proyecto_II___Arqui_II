module data_memory(input logic clk, we,
						 input logic [127:0] a,
						 output logic [127:0] rd);
						 
  logic [15:0] RAM [254:0];
  
  genvar i;
	generate
		 for(i = 0; i < 255; i++)
		 begin: test
			  initial
			  //always@(posedge CLK50)
			  begin
					RAM[i][15:0] = 16'b0;
			  end
		 end
	endgenerate
  
  assign rd[15:0] = RAM[a[15:0]];
  assign rd[31:16] = RAM[a[31:16]];
  assign rd[47:32] = RAM[a[47:32]];
  assign rd[63:48] = RAM[a[63:48]];
  assign rd[79:64] = RAM[a[79:64]];
  assign rd[95:80] = RAM[a[95:80]];
  assign rd[111:96] = RAM[a[111:96]];
  assign rd[127:112] = RAM[a[127:112]];
  
  always_ff @(negedge clk)
    if (we)
		begin
			RAM[a[7:0]] <= (RAM[a[7:0]] + 1);
			RAM[a[23:16]] <= (RAM[a[23:16]] + 1);
			RAM[a[39:32]] <= (RAM[a[39:32]] + 1);
			RAM[a[55:48]] <= (RAM[a[55:48]] + 1);
			RAM[a[71:64]] <= (RAM[a[71:64]] + 1);
			RAM[a[87:80]] <= (RAM[a[87:80]] + 1);
			RAM[a[103:96]] <= (RAM[a[103:96]] + 1);
			RAM[a[119:112]] <= (RAM[a[119:112]] + 1);
		end
		
endmodule 