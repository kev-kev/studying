# The greatest common divisor (GCD) of N numbers is the largest possible integer that divides all numbers without without giving a remainder.
# Write an algorithm to determine the GCD of N positive integers.

# -- Brainstorming --
# Could potentially calculate every factor of a num in the array, removing nums from our result as we find nums in the input without those as factors.
# But that would get lengthy fast
# By finding the GCD of each set of 2 nums in the array, we can determine what the solution is recursively

def gcd(a, b)
  b.zero? ? a : gcd(b, a % b)
end

def generalizedGCD(num, arr)
  result = arr[0]
  (1..num - 1).each do |i|
      result = gcd(result, arr[i])
  end
  result
end

p generalizedGCD(5, [2, 3, 4, 5, 6])