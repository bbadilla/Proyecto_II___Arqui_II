module filetest;
  int    fd;       // Variable for file descriptor handle
 
  initial begin
	 #10;
 
    // 1. Lets first open a new file and write some contents into it
    fd = $fopen("C:\\Programas\\ArquiII\\Proyecto2\\quartus\\hola.txt", "w");
	 
	 #10;
 
    // Write each index in the for loop to the file using $fdisplay
    // File handle should be the first argument
    for (int i = 0; i < 5; i++) begin
      $fwrite(fd, "%02h\n", i);
    end
	 
	 #10;
 
    // Close this file handle
    $fclose(fd);
  end
endmodule 