# Given an array of integers, find the highest product you can get from three of the integers.
# The input array_of_ints will always have at least three integers.

# -- Brainstorming --
# First thought is we can sort and take the product of the largest 3 nums
# but if we have no positive integers in our array, would that approach work?
# if we have an array of all negative integers, [-1, -10, -5, -15, -20, -25]
# we actually would still want the product of the 3 largest nums to get the largest/least negative num
# but what if we only had two negative ints that could make a large positive product? [1, 10, 5, 15, -20, -25]
# in that case, we would want both of those negative nums (the two smallest nums) as well as the largest positive num

# here's an adjusted approach:
# sort the input arr
# if the first two nums are negative, we compare their product with the product of the last two nums...

# def highest_product_of_3(input)
#   input.sort!
#   if input[0] < 0 && input[1] < 0
#     product1 = input[0] * input[1]
#     product2 = input[-1] * input[-2]
#     product1 > product2 ? 
#       return product1 * input[-1] :
#       return product2 * input[-3]
#   else
#     return input[-3..-1].inject(:*)
#   end
# end

# but really, that is the same as writing this...

# def highest_product_of_3(input)
#   input.sort!
#   product1 = input[0] * input[1]
#   product2 = input[-1] * input[-2]
#   product1 > product2 ? 
#     product1 * input[-1] :
#     product2 * input[-3]
# end

# which is more concise, but we have an overlooked issue- what if input[-3] is a negative num? then product1 would be larger
# it also would make way more sense to keep all the math in one place... so let's just do it all at once and compare the products

# def highest_product_of_3(input)
#   input.sort!
#   product1 = input[0] * input[1] * input[-1]
#   product2 = input[-1] * input[-2] * input[-3]
#   [product1, product2].max
# end

# looks better, but maybe we can do this without the built in sort method (O(lgn))
# we can get the largest num one of two ways: multiplying the most negative number by a negative int, or multiplying the most positive number by a positive int
# a new approach could then be:
# keep track of the max and min products of two in the arr (can set both equal to input[0]*input[1]), the highest and lowest ints in the input, and the highest product of 3 so far
# each num in input[2..-1], check if it's the highest/lowest num, if it can be multiplied with the highest/lowest num to make the highest/lowest product of 2, and check if it can be multiplied by the highest/lowest product of 2 to be the largest so far
# then, return the largest value so far as the result ==> O(n) time 

def highest_product_of_3(input)
  min = [input[0], input[1]].min
  max = [input[0], input[1]].max
  min_product = (input[0] * input[1])
  max_product = (input[0] * input[1])
  result = input[0] * input[1] * input[2]
  input[2..-1].each do |n|
    result = [result, n * min_product, n * max_product].max
    min_product = [n * min, n * max, min_product].min
    max_product = [n * max, n * min, max_product].max
    min = n if n < min
    max = n if n > max
  end
  result
end

testcase = [-8,-7,-2,10,20] #1120

p highest_product_of_3(testcase)