import numpy as np
import cv2
import pandas as pandita
from matplotlib import pyplot as plt


def comulative(a, arr):
    ac = 0
    for i in range(a):
        ac += arr[i]
    return ac


A = cv2.imread('img/lena.jpg')
A = cv2.cvtColor(A, cv2.COLOR_BGR2RGB)

B = cv2.cvtColor(A, cv2.COLOR_RGB2YCrCb)

Y = B[:, :, 0]

hist, bins = np.histogram(Y.ravel(), 256, [0, 256])

ac = []

for i in range(256):
    ac.append(comulative(i,  hist) / (2 ** 16))

size = 256, 256, 3
Z = np.zeros(size, dtype=np.uint8)

for i in range(256):
    for j in range(256):
        Z[i, j] = int((ac[Y[i, j]] * 255))

hist2, bins2 = np.histogram(Z.ravel(), 256, [0, 256])

Z[:, :, 1] = B[:, :, 1]
Z[:, :, 2] = B[:, :, 2]

Z = cv2.cvtColor(Z, cv2.COLOR_YCR_CB2RGB)

fig, axs = plt.subplots(2, 2)
axs[0, 0].imshow(A)
axs[0, 1].bar(bins[:-1], hist, width=1)
axs[1, 0].imshow(Z)
axs[1, 1].bar(bins2[:-1], hist2, width=1)

plt.show()

for i in range(256):
    print("Hist[{}] = {}".format(i, hist[i]))
