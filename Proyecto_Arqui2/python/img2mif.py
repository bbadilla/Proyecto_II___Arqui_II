import cv2

A = cv2.imread('img/lena.jpg')

if (len(A.shape) > 2):
    print("Is a RGB image, converting to YCbCr...")
    imgYCC = cv2.cvtColor(A, cv2.COLOR_BGR2YCR_CB)
    A = imgYCC[:, :, 0]

m, n, = A.shape

width = 128
depth = 8192

with open("image.mif", "w") as f:
    f.write("WIDTH=" + str(width) + ";\r")
    f.write("DEPTH=" + str(depth) + ";\r\r")
    f.write("ADDRESS_RADIX=UNS;\r")
    f.write("DATA_RADIX=HEX;\r\r")
    f.write("CONTENT BEGIN\r")

    index = 0
    line = ""
    for i in range(0, m):
        line = "\t" + str(index) + " : "
        for j in range(0, n, 8):
            for p in range(0, 8):
                line += '00' + str(hex(A[i, j + p])[2:])
            line += ";\r"
            f.write(line)
            index += 1
            line = "\t" + str(index) + " : "

    f.write("END")
