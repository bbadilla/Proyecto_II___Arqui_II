import cv2
import numpy as np

size = 256, 256, 3
m = np.zeros(size, dtype=np.uint8)
A = cv2.imread('img/lena.jpg')
B = A.copy()

with open('test.txt', 'r') as f:
    for i in range(0, 256):
        for j in range(0, 256, 8):
            line = f.readline()
            if line != '':
                l = 0
                for k in range(2, 32, 4):
                    m[i, j + l, 0] = int(line[k: k + 2], 16)
                    l += 1

if (len(A.shape) > 2):
    imgYCC = cv2.cvtColor(A, cv2.COLOR_BGR2YCR_CB)

    m[:, :, 1] = imgYCC[:, :, 1]
    m[:, :, 2] = imgYCC[:, :, 2]

    rgb = cv2.cvtColor(m, cv2.COLOR_YCR_CB2BGR)

    cv2.imshow('Converted Image', rgb)
else:
    cv2.imshow('Converted Image', m[:, :, 0])

cv2.imshow('Original Image', B)
cv2.waitKey(0)
cv2.destroyAllWindows()
