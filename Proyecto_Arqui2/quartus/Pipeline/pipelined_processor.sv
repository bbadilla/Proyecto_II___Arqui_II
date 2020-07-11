module pipelined_processor(input logic clk, reset, output logic [17:0] pc);

	// Fetch Wires
	// In
	logic pc_src;
	logic [17:0] wb_out;	
	logic [17:0] instruction_out, pc_8_out; 
	
	// Out
	logic [17:0] wb_in;	
	logic [17:0] instruction_in, pc_8_in; 
	
	// Decode Wires
	// In
	logic zero_flag;
	logic [127:0] rd1_in, rd2_in;	
	logic reg_write_in, h1_mem_write_in, h2_mem_write_in, n_mem_write_in, pc_src1, add1_sel_in,
			mem_sel_in, mux_rst_in, finish_in;
	logic [1:0] alu_control_in, source_in, mem_control_in;
	
	// Out
	logic [127:0] rd1_out, rd2_out;	
	logic reg_write_out, h1_mem_write_out, h2_mem_write_out, n_mem_write_out, add1_sel_out,
			mem_sel_out, mux_rst_out, finish_out;
	logic [1:0] alu_control_out, source_out, mem_control_out;
	
	// Execute Wires
	// In
	logic [127:0] alu_in, add_8_in;
	
	// Out
	logic [127:0] alu_out, add_8_out, rd2_out2;
	logic [1:0] source_out2;
	
	// Memory Wires
	// In
	logic [127:0] mem_in;
	
	// Out
	logic [127:0] mem_out, alu_out2;
	logic [14:0] add_8_out2;
	logic [1:0] source_out3;
	
	// FETCH	
	fetch ft(clk, reset, pc_src1, wb_out, instruction_in, pc_8_in);
	
	flip_flop_D #(163) first(clk, reset, 1'b1, 
									 {wb_in, instruction_in, pc_8_in},
									 {wb_out, instruction_out, pc_8_out});
									 
	// DECODE									 
	decode dc(clk, reset, zero_flag, instruciont_out, wb_out, rd1_in, rd2_in, 
				reg_write_in, h1_mem_write_in, h2_mem_write_in, n_mem_write_in, pc_src, add1_sel_in,
				mem_sel_in, mux_rst_in, finish_in, alu_control_in, source_in, mem_control_in);				
	
	flip_flop_D #(270) second(clk, reset, 1'b1,
	{rd1_in, rd2_in, reg_write_in, h1_mem_write_in, h2_mem_write_in, n_mem_write_in, pc_src, add1_sel_in,
	mem_sel_in, mux_rst_in, finish_in, alu_control_in, source_in, mem_control_in},
	{rd1_out, rd2_out, reg_write_out, h1_mem_write_out, h2_mem_write_out, n_mem_write_out, add1_sel_out,
	mem_sel_out, mux_rst_out, finish_out, alu_control_out, source_out, mem_control_out});
	
	// EXECUTE	
	execute ex(rd1, rd2, pc_8_out, instruction_out, alu_control_out, add1_sel_out, mem_sel_out,
					alu_in, add_8_in, zero_flag);
	
	flip_flop_D #(386) third(clk, reset, 1'b1, {alu_in, add_8_in, rd2_out, source_out}, 
									{alu_out, add_8_out, rd2_out2, source_out2});
	
	// MEMORY
	memory mem(alu_out, rd2_out2, h1_mem_write_out, h2_mem_write_out, n_mem_write_out, mem_control_out, mem_in);
	
	flip_flop_D #(298) fourth(clk, reset, 1'b1, {alu_out, mem_in, add_8_out, source_out2}, 
																{alu_out2, mem_out, add_8_out2, source_out3});
	
	// WRITE-BACK
	write_back wbb(alu_out2, mem_out, add_8_out2, source_out3, wb_out);

endmodule 