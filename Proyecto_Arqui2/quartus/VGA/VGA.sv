module VGA (input clk, reset,
       	   output logic vga_hs, vga_vs, vga_blank_n, clockVGA);
    
	logic [9:0] hCounter, vCounter;	
	logic refreshDraw, d_reset;
	 
	assign d_reset = ~reset;
	     
  ClkDivisor VGAClkDivisor(clk, clockVGA);		     
  ControllerSync VGASync(clockVGA, d_reset, vga_hs, vga_vs, hCounter, vCounter, vga_blank_n, refreshDraw);	  	
    
endmodule 
