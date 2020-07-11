module memory(input logic clk, reset,
				  input logic [127:0] alu_out, rd2, input logic h1_mem_write, h2_mem_write, n_mem_write, 
				  input logic [1:0] mem_control, output logic [127:0] mem_out);
				  
	logic	[15:0] rd [255:0];
	logic	[15:0] rdn [255:0];
	
	logic [127:0] original_im_out, new_im_out, ac_out;
	
	// Histogram 1 Memory
	data_memory data_m(clk, h1_mem_write, alu_out, rd);
	
	// Histogram 2 Memory
	data_memory data_m2(clk, h2_mem_write, alu_out, rdn);
				  
	// Original Image
	original_image ori_image(alu_out[12:0], clk, 128'b0, 1'b0, original_im_out);
	
	// New Image
	new_image n_image(alu_out[12:0], clk, rd2, n_mem_write, new_im_out);
	
	// Acumulator
	acumulator ac(clk, ~h1_mem_write, rd, alu_out, ac_out);
	
	// Mux Mem
	mux_4_x_1 #(128) mux_memory(original_im_out, ac_out, new_im_out, 128'b0, mem_control, mem_out);
	
endmodule 