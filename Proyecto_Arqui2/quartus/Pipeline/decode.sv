module decode(input clk, reset, zero_flag, input logic [17:0] instruction, wb, output logic [127:0] rd1, rd2,
				  output logic reg_write, h1_mem_write, h2_mem_write, n_mem_write, pc_src, add1_sel, 
				  mem_sel, mux_rst, finish,
				  output logic [1:0] alu_control, source, mem_control);
				  
	logic [127:0] rst_out;

	
	// Vector Register File
	register_file reg_file(clk, reset, reg_write, instruction[7:4], instruction[3:0], 
					  instruction[11:8], rst_out, rd1, rd2);
					  
	// Control Unit
	Control_Unit CU(clk, reset, zero_flag, instruction[17:12], h1_mem_write, h2_mem_write, n_mem_write, 
						 reg_write, pc_src, add1_sel, mem_sel, mux_rst, alu_control, source, mem_control, finish);
						 
	// Mux Reset
	mux_2_x_1 #(128) mux_reset(wb, 128'b0, mux_rst, rst_out);

endmodule 