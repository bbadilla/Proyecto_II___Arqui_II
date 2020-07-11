module DataPath(input logic clk, reset,
					output logic [17:0] pc, output logic finished, output logic [23:0] RGB,
					output logic vga_hs, vga_vs, blank, vga_clk);
	
	logic [17:0] pc_4, instruction, pc_8, ff_8_out, pc_out;
	logic reg_write, h1_mem_write, h2_mem_write, n_mem_write, pc_src, add1_sel, zero_flag, mem_sel, mux_rst, finish;
	logic [127:0] rd1, rd2, alu_out, mux_out, add1_mux_out, add1_mux_out1, original_im_out;
	logic [127:0] ac_out, rst_out, mem_mux_out, new_im_out;
	logic [1:0] alu_control, source, mem_control;
	logic [14:0] add_8_out;
	logic	[15:0] rd [255:0];
	logic	[15:0] rdn [255:0];
	logic [12:0] vga_counter, mux_vga_out;
	
	// PC + 4 adder
	Add_pc Add1(pc,18'b000000000000000100, pc_4);
	
	// PC + 8 adder
	Add_pc Add2(pc_4, 18'b000000000000000100, pc_8);
	
	// PC Register
	flip_flop_D #(18) ff(clk, reset, 1'b1, pc_out, pc);
	
	// Instruccion Memory
	instruction_memory instr_mem(pc,instruction);
	
	// Vector Register File
	register_file reg_file(clk, reset, reg_write, instruction[7:4], instruction[3:0], 
					  instruction[11:8], rst_out, rd1, rd2);
	
	// ALU
	alu #(128) ALU(rd1, add1_mux_out, alu_control, alu_out, zero_flag);
	
	// Histogram 1 Memory
	data_memory data_m(clk, h1_mem_write, alu_out, rd);
	
	// Histogram 2 Memory
	data_memory data_m2(clk, h2_mem_write, alu_out, rdn);
	
	// Control Unit
	Control_Unit CU(clk, reset, zero_flag, instruction[17:12], h1_mem_write, h2_mem_write, n_mem_write, 
						 reg_write, pc_src, add1_sel, mem_sel, mux_rst, alu_control, source, mem_control, finish);
	
	// Branch Adder	
	Add_param #(15) Add_p(pc_8[14:0], instruction[14:0], add_8_out);

	// Write-back mux
	mux_4_x_1 #(128) mux_4_1(alu_out, mem_mux_out, {113'b0, add_8_out}, 128'b0, source, mux_out);
	 
	// Branch Mux
	mux_2_x_1 #(18) mux_2_1(pc_4, mux_out[17:0], pc_src, pc_out);
	
	// Add 1 Mux
	mux_2_x_1 #(128) add1_mux(rd2, 128'h1, add1_sel, add1_mux_out1);
	
	// Mem Mux
	mux_2_x_1 #(128) mem_mux(add1_mux_out1, 128'h0, mem_sel, add1_mux_out);
	
	// Original Image
	original_image ori_image(alu_out[12:0], clk, 128'b0, 1'b0, original_im_out);
	
	// New Image
	new_image n_image(mux_vga_out, clk, rd2, n_mem_write, new_im_out);
	
	// Acumulator
	acumulator ac(clk, ~h1_mem_write, rd, alu_out, ac_out);
	
	// Mux Reset
	mux_2_x_1 #(128) mux_reset(mux_out, 128'b0, mux_rst, rst_out);
	
	// Mux Mem
	mux_4_x_1 #(128) mux_memory(original_im_out, ac_out, new_im_out, 128'b0, mem_control, mem_mux_out);	
	
	// VGA Mux
	mux_2_x_1 #(13) mux_vga(alu_out[12:0], vga_counter, finished, mux_vga_out);
	
	// Split
	split sp(new_im_out, vga_clk, finished, RGB, vga_counter);
	
	// VGA
	VGA video(clk, ~finish, vga_hs, vga_vs, blank, vga_clk);
	
	// Finish
	flip_flop_D_finish #(1) fff(clk, ~finish, 1'b1, 1'b1, finished);
			
	
	
endmodule
