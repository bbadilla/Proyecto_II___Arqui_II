module Control_Unit(input logic clk, reset, flag, input logic [5:0] a, 
						  output logic mem_write, reg_write, pc_src, add1_sel, alu_control, mem_sel,
						  output logic [1:0] source);
	
	logic mem, data, flag_write_previous, no_write, pc, deco_alu;
	
	assign mem = ~a[4] & a[3];
	assign data = ~a[4] & ~a[3];
	
	assign pc = a[4] & ~a[3];
	assign source = a[4:3];
	
	assign no_write = a[2] & ~a[1];
	
	assign mem_write = ~a[0] & mem;
	assign reg_write = (a[0] & mem) | (~no_write & data);
	
	assign add1_sel = ~a[2] & a[1] & data;
	
	alu_deco deco(a[2:1], deco_alu);
	
	mux_2_x_1 #(1) mux_alu(1'b0, deco_alu, data, alu_control);
	
	assign flag_write_previous = data & no_write;
	
	cond_logic cd(clk, reset, a[5], flag_write_previous, flag, pc, pc_src);
	
	assign mem_sel = mem;
	
endmodule
