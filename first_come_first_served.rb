# Given all three arrays, write a method to check that my service is first-come, first-served. All food should come out in the same order customers requested it.

# We'll represent each customer order as a unique integer.

# As an example,

#   Take Out Orders: [1, 3, 5]
#  Dine In Orders: [2, 4, 6]
#   Served Orders: [1, 2, 4, 6, 5, 3]
# would not be first-come, first-served, since order 3 was requested before order 5 but order 5 was served first.

# But,

#   Take Out Orders: [17, 8, 24]
#  Dine In Orders: [12, 19, 2]
#   Served Orders: [17, 8, 12, 19, 24, 2]
# would be first-come, first-served.

def first_come_first_served?(arr1, arr2, arr3)
  i, j = 0, 0
  arr3.each do |item|
    if item === arr1[i]
      i += 1
    elsif item === arr2[j]
      j += 1
    else
      return false
    end
  end
  true
end

p first_come_first_served?([17, 8, 24], [12, 19, 2], [17, 8, 12, 19, 24, 2])