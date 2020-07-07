module DataPath(input logic clk, reset, output logic [127:0] mem, 
					output logic [17:0] pc);
	
	logic [17:0] pc_4, instruction, pc_8, ff_8_out, pc_out;
	logic reg_write, mem_write, pc_src, add1_sel, alu_control, zero_flag;
	logic [127:0]rd1, rd2, alu_out, mux_out, add1_mux_out;
	logic [1:0] source;
	logic [14:0] add_8_out;
	
	// ´PC + 4 adder
	Add_pc Add1(pc,18'b000000000000000100, pc_4);
	
	// PC + 8 adder
	Add_pc Add2(pc_4, 18'b000000000000000100, pc_8);
	
	// PC Register
	flip_flop_D #(18) ff(clk, reset, 1'b1, pc_out, pc);
	
	// Instruccion Memory
	instruction_memory instr_mem(pc,instruction);
	
	// Vector Register File
	register_file reg_file(clk, reset, reg_write, instruction[7:4], instruction[3:0], 
					  instruction[11:8], mux_out, rd1, rd2);
	
	// ALU
	alu #(128) ALU(rd1, add1_mux_out, alu_control, alu_out, zero_flag);
	//Add Add3(rd1, add1_mux_out, alu_out);
	
	// Histogram Memory
	data_memory data_m(clk, mem_write, alu_out, mem);
	
	// Control Unit
	Control_Unit CU(clk, reset, zero_flag, instruction[17:12], mem_write, reg_write, pc_src, add1_sel, alu_control, source);
	
	// Branch Adder	
	Add_param #(15) Add_p(pc_8[14:0], instruction[14:0], add_8_out);

	// Write-back mux
	
	mux_4_x_1 #(128) mux_4_1(alu_out, mem, {113'b0, add_8_out}, 128'b0, source, mux_out);
	
	// Branch Mux
	mux_2_x_1 #(18) mux_2_1(pc_4, mux_out[17:0], pc_src, pc_out);
	
	// Add 1 Mux
	mux_2_x_1 #(128) add1_mux(rd2, 128'h1, add1_sel, add1_mux_out);
	
	
	
endmodule
