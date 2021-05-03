# Write a method for doing an in-place shuffle of an array.
# The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.
# Assume that you have a method get_random(floor, ceiling) for getting a random integer that is >= floor and <= ceiling.

# -- Brainstorming --
# Since we have to do this in place, my first thought is to iterate through the arr, swapping the current item with a random item from the arr.
# Each index of the input, get a random number from that index to the end of the arr
# Swap those indices and move on
# -- Edge Cases --
# what if the arr is 1 or 0 in length?

def shuffle!(input)
  if input.length < 2
    raise ArgumentError, "Array must contain at least two items to be shuffled"
  end
  last = input.length - 1 # last index
  (0..last).each do |cur|
    random = rand(cur..last)
    # if the random index picked isn't the same as the current index, swap them
    unless random === cur
      input[cur], input[random] = input[random], input[cur]
    end
  end
  input
end

testcase = [1, 2, 3, 4, 5]

p shuffle!(testcase)