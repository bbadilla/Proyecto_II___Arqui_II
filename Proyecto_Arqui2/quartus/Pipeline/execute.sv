module execute(input logic [127:0] rd1, rd2, input logic [14:0] pc_8, branch, input logic [1:0] alu_control,
					input logic add1_sel, mem_sel,
					output logic [127:0] alu_out, output logic [14:0] add_8_out,
					output zero_flag);

					
	logic [127:0] add1_mux_out1, add1_mux_out;

	// Add 1 Mux
	mux_2_x_1 #(128) add1_mux(rd2, 128'h1, add1_sel, add1_mux_out1);
	
	// Mem Mux
	mux_2_x_1 #(128) mem_mux(add1_mux_out1, 128'h0, mem_sel, add1_mux_out);
	
	// ALU
	alu #(128) ALU(rd1, add1_mux_out, alu_control, alu_out, zero_flag);
	
	// Branch Adder	
	Add_param #(15) Add_p(pc_8, branch, add_8_out);
	
endmodule 