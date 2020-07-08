# Program to show various ways to read and 
# write data in a file. 
file1 = open("RAM.txt","w") 
  
# \n is placed to indicate EOL (End of Line) 
for i in range(256):
    file1.write("mem["+ str(i) + "] <= adder_out[" + str(i-1) +"];\n") 
file1.close() #to change file access modes 