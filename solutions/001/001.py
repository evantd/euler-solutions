# http://codepad.org/4aDqvlxv

import math

def euler001(factor1, factor2, cap):
  sum = 0
  sum += triangle_sum(int((cap-1)/factor1))*factor1
  sum += triangle_sum(int((cap-1)/factor2))*factor2
  product = factor1 * factor2
  sum -= triangle_sum(int((cap-1)/product))*product
  return sum

# 1 + 2 + 3 + ... + n
def triangle_sum(n):
  return (n * (n + 1))/2

print euler001(3, 5, 10)
print euler001(3, 5, 1000)
