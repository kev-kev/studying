# Given an array of integers nums.

# A pair (i,j) is called good if nums[i] == nums[j] and i < j.

# Return the number of good pairs.

# -- Brainstorming --
#first thought is to iterate through the array from nums[i..-1] and check if nums[i] = num at each step, incrementing a value each time that's the case
def num_identical_pairs(nums)
  i, result, length = 0, 0, nums.length - 1
  while i < length do
      nums[i+1..-1].each do |num|
       result += 1 if num == nums[i]
      end
      i += 1
  end
  result 
end