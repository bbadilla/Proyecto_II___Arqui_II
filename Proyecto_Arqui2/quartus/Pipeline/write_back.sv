module write_back(input logic [127:0] alu_out, mem_out, branch, input logic [1:0] source,
						output logic [127:0] wb);
						
	// Write-back mux
	mux_4_x_1 #(128) mux_4_1(alu_out, mem_out, {113'b0, branch}, 128'b0, source, wb);
endmodule 