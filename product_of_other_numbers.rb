# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
# For example, given:
#   [1, 7, 3, 4]
# your method would return:
#   [84, 12, 28, 21]
# by calculating:
#   [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
# Here's the catch: You can't use division in your solution!

# -- Brainstorming --
# could just slice the input to exclude the index at each step and multiply, but that's O(n^2)
# 