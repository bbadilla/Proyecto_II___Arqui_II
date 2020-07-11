module fetch(input logic clk, reset, pc_src, input logic [17:0] wb, output logic [17:0] instruction, pc_8);

	logic [17:0] pc, pc_4, pc_out;

	// PC + 4 adder
	Add_pc Add1(pc, 18'b000000000000000100, pc_4);
	
	// PC + 8 adder
	Add_pc Add2(pc_4, 18'b000000000000000100, pc_8);
	
	// PC Register
	flip_flop_D #(18) ff(clk, reset, 1'b1, pc_out, pc);
	
	// Instruccion Memory
	instruction_memory instr_mem(pc, instruction);
	
	// Branch Mux
	mux_2_x_1 #(18) mux_2_1(pc_4, wb, pc_src, pc_out);

endmodule 