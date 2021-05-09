# Given a staircase with N steps, how many ways are there to reach the top of the staircase by taking only one or two steps at a time?

# EX: num_ways(1) = 1, since we can only go up one step with 1
# num_ways(2) = 2, we can go up with two 1s or one 2

# -- Brainstorming --
# 3 => 3, [1, 1, 1], [1, 2], [2, 1]
# 4 => 5, [1, 1, 1, 1], [1, 1, 2] , [1, 2, 1], [2, 1, 1], [2, 2]
# we can see that num_ways(n) = num_ways(n-1) + num_ways(n-2)
# so we can find num_ways(0) by: num_ways(2) = num_ways(1) + num_ways(0) ==> 2 = 1 + num_ways(0) ==> num_ways(0) = 1
# now we have base cases for n=1 and n=0. we can code a recursive solution then like:

# def num_ways(n)
#   return 1 if n == 1 || n == 0
#   return num_ways(n - 1) + num_ways(n - 2) 
# end

# and a bottom up solution:

def num_ways(n)
  nums = Array.new(n + 1)
  nums[0..1] = 1, 1
  (2..n).each do |i| # start solving from 2 to the last index
    nums[i] = nums[i-1] + nums[i - 2]
  end
  nums.last
end