# A binary search algorithm finds an item in a sorted array in O(lg(n))O(lg(n)) time.

# A brute force search would walk through the whole array, taking O(n)O(n) time in the worst case.

# Let's say we have a sorted array of numbers. To find a number with a binary search, we:

# Start with the middle number: is it bigger or smaller than our target number? Since the array is sorted, this tells us if the target would be in the left half or the right half of our array.
# We've effectively divided the problem in half. We can "rule out" the whole half of the array that we know doesn't contain the target number.
# Repeat the same approach (of starting in the middle) on the new half-size problem. Then do it again and again, until we either find the number or "rule out" the whole set.

def binary_search(target, input)
  floor = -1
  ceiling = input.length

  while floor + 1 < ceiling # if we don't have at least one index left, don't run
    # find halfway point between the floor and ceiling, add it to the floor for our guess
    n = (ceiling - floor) / 2 + floor
    if input[n] == target # match
      return true
    elsif n > target # guess is greater than our target so move ceiling down
      ceiling = n
    else # guess is less than target, so move floor up
      floor = n
    end
  end
  false
end

test_target = 11
test_input = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p binary_search(test_target, test_input)