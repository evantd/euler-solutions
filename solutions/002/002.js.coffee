# http://coffeescript.org/#try:%23%20paste%20code%20here

# O(n)
euler002 = (max) ->
  even = 2
  other1 = 3
  other2 = 5
  sum = 0

  while (even <= 4000000)
    sum += even
    even = other1 + other2
    other1 = other2 + even
    other2 = even + other1

  sum

console.log(euler002(4000000))
