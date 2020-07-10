`timescale 1 ps / 1 ps
module test();

	int  fd, fh1, fh2;
	
	logic [127:0] cur_data;
	logic [15:0] h1;
	logic [15:0] h2;

	logic [17:0] pc;
	logic clk, reset;
	logic finish;
	
	always begin
		 clk <= 1; # 5; clk <= 0; # 5;
		 if (finish) begin 
			$display("Process finished...\n");
		 
			 for (int i =0; i < 8192; i++) begin
				cur_data = DUT.n_image.altsyncram_component.m_default.altsyncram_inst.mem_data[i];  
				$fdisplay(fd,"%h",cur_data);
			end
			
			for (int i = 0; i < 256; i++) begin
				h1 = DUT.data_m.RAM[i];
				h2 = DUT.data_m2.RAM[i];
				
				$fdisplay(fh1, "%h", h1);
				$fdisplay(fh2, "%h", h2);
				
			end
		end
	end
	

	DataPath DUT(clk, reset, pc, finish);

	initial begin
		 fd = $fopen("C:\\Programas\\ArquiII\\Proyecto2\\quartus\\mem_out.txt", "w");
		 fh1 = $fopen("C:\\Programas\\ArquiII\\Proyecto2\\quartus\\histogram_original.txt", "w");
		 fh2 = $fopen("C:\\Programas\\ArquiII\\Proyecto2\\quartus\\histogram_equalized.txt", "w");
		 reset <= 1; #5; reset <= 0; #5 reset <= 0;			 
		
	end
	
endmodule 