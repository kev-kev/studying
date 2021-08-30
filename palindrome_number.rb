# @param {Integer} x
# @return {Boolean}


def is_palindrome(x) 
  orig = x
  return true if x < 10 && x >= 0
  return false if x < 0 || (x % 10 == 0)
  reverse = 0
  k = 10 ** (Math.log(x, 10).floor)
  while k >= 1
      reverse += x % 10 * k
      x /= 10
      k /= 10
  end
  p reverse, x 
  orig === reverse ? true : false
end