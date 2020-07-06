module DataPath(input logic clk, reset, output logic [127:0] mem, 
					output logic [17:0] pc);
	
	logic [17:0] pc_4, instruction, pc_8, ff_8_out, pc_out;
	logic reg_write, mem_write, pc_src;
	logic [127:0]rd1, rd2, alu_out, mux_out;
	logic [1:0] source;
	logic [14:0] add_8_out;
	
	Add_pc Add1(pc,18'b000000000000000100, pc_4);
	
	Add_pc Add2(pc_4, 18'b000000000000000100, pc_8);
	
	flip_flop_D #(18) ff(clk, reset, 'b1, pc_out, pc);
	
	instruction_memory instr_mem(pc,instruction);
	
	register_file reg_file(clk, reset, reg_write, instruction[7:4], instruction[3:0], 
					  instruction[11:8], mux_out, {110'b0, pc_8}, rd1, rd2);
					  
	Add Add3(rd1, 128'b0, alu_out);
	
	data_memory data_m(clk, mem_write, alu_out, mem);
	
	Control_Unit CU(instruction[17:12], mem_write, reg_write, pc_src, source);
	
	//flip_flop_D #(18) ff_8(clk, reset, 'b1, pc_8, ff_8_out);
	
	Add_param #(15) Add_p(pc_8[14:0], instruction[14:0], add_8_out);
	
	mux_4_x_1 #(128) mux_4_1(alu_out, mem, {113'b0, add_8_out}, 128'b0, source, mux_out);
	
	mux_2_x_1 #(18) mux_2_1(pc_4, mux_out[17:0], pc_src, pc_out);
	
	
	
	
endmodule
