# http://rubyfiddle.com/riddles/54479

def euler001(factor1, factor2, cap)
  sum = 0
  sum += triangle_sum(((cap-1)/factor1).to_i)*factor1
  sum += triangle_sum(((cap-1)/factor2).to_i)*factor2
  product = factor1 * factor2
  sum -= triangle_sum(((cap-1)/product).to_i)*product
end

# 1 + 2 + 3 + ... + n
def triangle_sum(n)
  (n * (n + 1))/2
end

puts euler001(3, 5, 10)
puts euler001(3, 5, 1000)
