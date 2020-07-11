import cv2
import sys

if len(sys.argv) != 3:
    print("Usage: python img2mif.py <image route> <is gray scale (0, 1)>")
    sys.exit()

try:
    is_gray = int(sys.argv[2])
except:
    print("Enter a valid gray scale option")
    sys.exit()

if is_gray != 1 and is_gray != 0:
    print("Enter a valid gray scale option")
    sys.exit()

if (not is_gray):
    A = cv2.imread(sys.argv[1])
else:
    A = cv2.imread(sys.argv[1], 0)


if (not is_gray):
    print("Is a RGB image, converting to YCbCr...")
    A = cv2.cvtColor(A, cv2.COLOR_BGR2RGB)
    imgYCC = cv2.cvtColor(A, cv2.COLOR_RGB2YCrCb)
    A = imgYCC[:, :, 0]

m, n, = A.shape

width = 128
depth = 8192

with open("image.mif", "w") as f:
    f.write("WIDTH=" + str(width) + ";\r")
    f.write("DEPTH=" + str(depth) + ";\r")
    f.write("ADDRESS_RADIX=DEC;\r")
    f.write("DATA_RADIX=HEX;\r")
    f.write("CONTENT\n")
    f.write("BEGIN\n")
    f.write("\n")

    index = 0
    line = ""
    for i in range(0, m):
        line = str(index) + " : "
        for j in range(0, n, 8):
            for p in range(0, 8):
                line += '00' + str(hex(A[i, j + p])[2:])
            line += ";\r"
            f.write(line)
            index += 1
            line = str(index) + " : "

    f.write("\n")
    f.write("END;")
