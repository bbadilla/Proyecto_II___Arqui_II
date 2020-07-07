import numpy as np
from matplotlib import pyplot as plt
import random

histo = []

with open('histogram.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        histo.append(int(line, 16))


plt.bar(range(256), histo, width=1)
plt.show()
