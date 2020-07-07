module alu_deco(input logic [1:0] cmd, output logic alu_control);

	always_comb
		case(cmd)		
			2'b00: 
				alu_control = 1'b0;				
			2'b01:
				alu_control = 1'b0;	
			2'b10:
				alu_control = 1'b1;
		default:
				alu_control = 1'b0;			
		endcase

endmodule 