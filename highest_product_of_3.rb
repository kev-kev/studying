# Given an array of integers, find the highest product you can get from three of the integers.
# The input array_of_ints will always have at least three integers.

# -- Brainstorming --
# First thought is we can sort and take the product of the largest 3 nums
# but if we have no positive integers in our array, would that approach work?
# if we have an array of all negative integers, [-1, -10, -5, -15, -20, -25]
# we actually would still want the product of the 3 largest nums to get the largest/least negative num
# but what if we only had two negative ints that could make a large positive product? [1, 10, 5, 15, -20, -25]
# in that case, we would want both of those negative nums (the two smallest nums) as well as the largest positive num

# here's an adjustede approach:
# sort the input arr
# if the first two nums are negative, we compare their product with the product of the last two nums
# whichever is 


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

# def highest_product_of_3(input)
#   input.sort!
#   product1 = input[0] * input[1]
#   product2 = input[-1] * input[-2]
#   product1 > product2 ? 
#     product1 * input[-1] :
#     product2 * input[-3]
# end

def highest_product_of_3(input)
  input.sort!
  product1 = input[0] * input[1] * input[-1]
  product2 = input[-1] * input[-2] * input[-3]
  [product1, product2].max
end

testcase = [-8,-7,-2,10,20] #1120

p highest_product_of_3(testcase)