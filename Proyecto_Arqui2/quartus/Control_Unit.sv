module Control_Unit(input logic clk, reset, flag, input logic [5:0] a, 
						  output logic h1_mem_write, h2_mem_write, n_mem_write, reg_write, pc_src, add1_sel, 
						  mem_sel, rst_out, output logic [1:0] alu_control, source, mem_control, output logic finish);
	
	logic mem, data, flag_write_previous, no_write, pc;
	logic [1:0] deco_alu;
	
	// Mem Operation	
	assign mem = ~a[4] & a[3];
	
	// Data Operation
	assign data = ~a[4] & ~a[3];
	
	// Branch Operation
	assign pc = a[4] & ~a[3];
	
	// Write-back Mux
	assign source = a[4:3];
	
	// CMP operation
	assign no_write = a[2] & ~a[1];
	
	// Write on Original Memory Histogram  	
	assign h1_mem_write = ~a[0] & mem & ~a[2] & ~a[1];
	
	// Write on New Image Memory 	
	assign n_mem_write = ~a[0] & mem & ~a[2] & a[1];
	
	// Write on New Image Histogram
	assign h2_mem_write = ~a[0] & mem & a[2] & ~a[1];
	
	// Write on Register File
	assign reg_write = (a[0] & mem) | (~no_write & data);	
	
	// ++ operation
	assign add1_sel = ~a[2] & a[1] & data;
	
	// ALU Control
	assign deco_alu = a[2:1];	
	
	mux_2_x_1 #(2) mux_alu(2'b01, deco_alu, data, alu_control); 
	
	// Memory Mux Control
	assign mem_control = a[2:1];
	
	// Update ALU Flags	
	assign flag_write_previous = data & no_write;
	
	// Conditional Execution
	cond_logic cd(clk, reset, a[5], flag_write_previous, flag, pc, pc_src);
	
	// LDR/STR ALU mux
	assign mem_sel = mem;
	
	// RST operation
	assign rst_out = data & ~a[2] & ~a[1];
	
	// Finish
	assign finish = a[4] & a[3];	
endmodule
