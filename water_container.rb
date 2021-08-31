# @param {Integer[]} height
# @return {Integer}

# need to calculate the area at each step and return the max at the end
# we can start by looking at each end of the container as the bounds for the initial container
# then, whichever height is shorter, move that side "inward", since the larger height will result in more potential area

def max_area(height)
  left = 0
  right = height.length - 1
  max_area = 0
  while left < right
      width = right - left
      cur_area = [height[left], height[right]].min * width
      max_area = [cur_area, max_area].max
      height[left] > height[right] ? right -= 1 : left += 1
  end
  max_area
end
