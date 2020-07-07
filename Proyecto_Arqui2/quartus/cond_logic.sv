module cond_logic(input logic clk, reset, cond, flag_write, z,  pc_src, output logic pc_src_p);

	logic flag_write_p, flag, cond_ex;

	flip_flop_D_neg #(1) ffn(clk, reset, flag_write_p, z, flag);
	
	cond_check cc(cond, flag, cond_ex);
	
	assign flag_write_p = flag_write & cond_ex;
	assign pc_src_p = cond_ex & pc_src;
	
endmodule