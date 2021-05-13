# Given an array of N positive integers, print k largest elements from the array. 

# EX: 
# N = 5, k = 2
# arr[] = {12,5,787,1,23}
# Output: 787 23
# Explanation: First largest element in
# the array is 787 and the second largest
# is 23.

# -- Brainstorming --
# crate an output arr with length k of the first k elements of the array and get the smallest item
# then from k..n-1, we check arr[i] at each step
# if larger than the smallest item, we replace it with arr[i] and determine the min again

def k_largest_elements(arr, n, k)
  result = arr[0..k-1]
  min = result.min
  arr[k..-1].each do |i| # => O(n-k)
    if i > min
      index = result.find_index(min) # => O(k)
      result[index] = i
      min = result.min # O(k) => loop has O(2k) total
    end
  end
  result.each do |x|
    print "#{x} "
  end
end
# O(n-k) * O(2k) = O(kn-k^2)

n = 7
k = 3
arr = [1,23,12,9,30,2,50]
k_largest_elements(arr, n, k)