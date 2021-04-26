# Each order is represented by an "order id" (an integer).
# We have our lists of orders sorted numerically already, in arrays. Write a method to merge our arrays of orders into one sorted array.
# For example:
# my_array     = [3, 4, 6, 10, 11, 15]
# alices_array = [1, 5, 8, 12, 14, 19, 21, 24]
# returns [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19, 21, 24]

# -- Brainstorming --
# Create indices for each array, and compare them 
# if i > j, result << arr2[j] j ++

def merge_arrays(arr1, arr2)
  i, j = 0, 0
  result = []
  while arr1[i] || arr2[j] do
    if !arr1[i]
      while arr2[j] do
        result << arr2[j]
        j += 1
      end
    elsif !arr2[j]
      while arr1[i] do
        result << arr1[i]
        i += 1
      end
    elsif arr1[i] < arr2[j]
      result << arr1[i]
      i += 1
    elsif arr1[i] > arr2[j]
      result << arr2[j]
      j += 1
    end
  end
  result
end


my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19, 21, 24]
#  [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19, 21, 24]
p merge_arrays(my_array, alices_array)
