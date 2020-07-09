module Control_Unit(input logic clk, reset, flag, input logic [5:0] a, 
						  output logic mem_write, reg_write, pc_src, add1_sel, 
						  mem_sel, rst_out, output logic [1:0] alu_control, source, mem_control);
	
	logic mem, data, flag_write_previous, no_write, pc;
	logic [1:0] deco_alu;
	
	assign mem = ~a[4] & a[3];
	assign data = ~a[4] & ~a[3];
	
	assign pc = a[4] & ~a[3];
	assign source = a[4:3];
	
	assign no_write = a[2] & ~a[1];
	
	assign mem_write = ~a[0] & mem;
	assign reg_write = (a[0] & mem) | (~no_write & data);
	
	assign add1_sel = ~a[2] & a[1] & data;
	assign deco_alu = a[2:1];
	assign mem_control = a[2:1];
	
	mux_2_x_1 #(2) mux_alu(2'b01, deco_alu, data, alu_control); 
	
	assign flag_write_previous = data & no_write;
	
	cond_logic cd(clk, reset, a[5], flag_write_previous, flag, pc, pc_src);
	
	assign mem_sel = mem;
	
	assign rst_out = data & ~a[2] & ~a[1];
	
endmodule
