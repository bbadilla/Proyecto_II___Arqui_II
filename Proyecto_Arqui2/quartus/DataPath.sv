module DataPath(input logic clk, reset, output logic [127:0] mem, 
					output logic [17:0] pc);
	
	logic [17:0] pc_4, instruction;
	logic reg_write, mem_write;
	logic [127:0]rd1, rd2, alu_out;
	
	Add_pc Add1(pc,18'b000000000000000100, pc_4);
	
	flip_flop_D #(18) ff(clk, reset, 1, pc_4, pc);
	
	instruction_memory instr_mem(pc,instruction);
	
	register_file reg_file(clk, reset, reg_write, instruction[7:4], instruction[3:0], 
					  instruction[11:8], mem, 128'b0, rd1, rd2);
					  
	Add Add2(rd1, 128'b0, alu_out);
	
	data_memory data_m(clk, mem_write, alu_out, mem);
	
	Control_Unit CU(instruction[17:12], mem_write, reg_write);
	
	
endmodule
