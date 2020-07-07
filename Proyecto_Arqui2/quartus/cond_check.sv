module cond_check(input logic cond, input logic flags, output logic cond_ex);

	logic zero;
	
	assign zero = flags;
	
	always_comb
		case(cond)
			1'b1: cond_ex = zero;
			1'b0: cond_ex = 1'b1; // always
		default: cond_ex = 1'bx; // undefined
		endcase
endmodule 