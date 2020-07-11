import cv2
import numpy as np
from matplotlib import pyplot as plt

is_gray = 0

size = 256, 256
m = np.zeros(size, dtype=np.uint8)
A = cv2.imread('img/lena.jpg', 0)

if len(A.shape) == 2:
    is_gray = 1

A = cv2.cvtColor(A, cv2.COLOR_BGR2RGB)

B = A.copy()

with open('test.txt', 'r') as f:
    for i in range(0, 256):
        for j in range(0, 256, 8):
            line = f.readline()
            if line != '':
                l = 0
                for k in range(2, 32, 4):
                    m[i, j + l] = int(line[k: k + 2], 16)
                    l += 1


histo1 = []

with open('histogram_original.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        histo1.append(int(line, 16))

histo2 = []

with open('histogram_equalized.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        histo2.append(int(line, 16) * 3)

size = 256, 256, 3
Z = np.zeros(size, dtype=np.uint8)

if (is_gray):
    Z[:, :, 0] = m
    Z[:, :, 1] = m
    Z[:, :, 2] = m

else:
    imgYCC = cv2.cvtColor(A, cv2.COLOR_RGB2YCrCb)

    Z[:, :, 0] = m
    Z[:, :, 1] = imgYCC[:, :, 1]
    Z[:, :, 2] = imgYCC[:, :, 2]

    Z = cv2.cvtColor(Z, cv2.COLOR_YCR_CB2RGB)

fig, axs = plt.subplots(2, 2)
axs[0, 0].imshow(A)
axs[0, 1].bar(range(256), histo1, width=1)
axs[1, 0].imshow(Z)
axs[1, 1].bar(range(256), histo2, width=1)

plt.show()
