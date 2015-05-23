# Try this in a coffeescript sandbox here:
# http://coffeescript.org/#try:%23%20paste%20code%20here

euler001 = (factor1, factor2, cap) ->

  # 1 + 2 + 3 + ... + n
  triangleSum = (n) ->
    (n * (n + 1))/2

  sum = 0
  sum += triangleSum(Math.ceil(cap/factor1 - 1))*factor1
  sum += triangleSum(Math.ceil(cap/factor2 - 1))*factor2
  product = factor1 * factor2
  sum -= triangleSum(Math.ceil(cap/product - 1))*product

console.log(euler001(3, 5, 10))
console.log(euler001(3, 5, 1000))
