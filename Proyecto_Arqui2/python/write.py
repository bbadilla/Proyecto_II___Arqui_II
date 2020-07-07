# Program to show various ways to read and 
# write data in a file. 
file1 = open("RAM.txt","w") 
  
# \n is placed to indicate EOL (End of Line) 
for i in range(256):
    file1.write("RAM["+ str(i) + "] <= (RAM[" + str(i) +"] + add_8_out["+str(i)+"]);\n") 
file1.close() #to change file access modes 