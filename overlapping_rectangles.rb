# Write a method to find the rectangular intersection of two given rectangles.

# rectangle = {
#   left_x: 1,
#   bottom_y: 1,
#   width: 6,
#   height: 3
# }

# -- Brainstorming --
# Rectangles overlap when:
#   smallest_left_x + width < largest_left_x
#   &&
#   smallest_bottom_y + height < largest_bottom_y
# can make a helper function that checks if each x and y line overlaps
# can just return 0 if not, then multiply the results to get the overlapping area

def get_line_overlap(line_1, line_2)
  return 0 if line_1.sum <= line_2.first

  if line_1.first < line_2.first
    line_1.sum - line_2.first
  else
    get_line_overlap(line_2, line_1)
  end
end

def overlapping_area(rect_1, rect_2)
  x_overlap = get_line_overlap(
    [rect_1[:left_x], rect_1[:width]],
    [rect_2[:left_x], rect_2[:width]]
  )
  y_overlap = get_line_overlap(
    [rect_1[:bottom_y], rect_1[:height]],
    [rect_2[:bottom_y], rect_2[:height]]
  )
  x_overlap * y_overlap
end

rectangle_2 = {
  left_x: 1,
  bottom_y: 1,
  width: 6,
  height: 3
}

rectangle_1 = {
  left_x: 5,
  bottom_y: 2,
  width: 3,
  height: 6
}

p overlapping_area(rectangle_1, rectangle_2)