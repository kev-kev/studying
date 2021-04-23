# Write a method merge_ranges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.
# For example, given:
#   [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
# your method would return:
#   [[0, 1], [3, 8], [9, 12]]
# Do not assume the meetings are in order. The meeting times are coming from multiple teams.
# Write a solution that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges

# --- Brainstorming --- 
# We know meeting[0] < meeting[1] for each meeting
# Looking at the sample meetings, it's easy to combine each meeting into a range as long as they're in order, but gets tricky if it's out of order.
# First thought is it may be best to sort the data before combining into condensed ranges
# If meetings are in order, meetings[0][0] must be results[0][0] since it's the earliest possible start time
#   Then, check if meetings[0][1] > meetings[1][0] (in example data, this is 1 > 3 => false)
#   If so, combine the ranges, so result[0] = [meetings[0][0], meetings[1][0]]
#   Else, result[0] = meetings[0] 
# If out of order, would need to keep track of meeting start/end times as we progress, so I'm taking the first approach.

def merge_ranges(meetings)
  meetings = meetings.sort # [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]] --->  [[0, 1], [3, 5], [4, 8], [9, 10], [10, 12]]
  results = [meetings[0]] # results = [[0, 1]]
  meetings[1..-1].each_with_index do |meeting|  # [3, 5]
    if meeting[0] <= results[-1][1] #
      results[-1] = [results[-1][0], meeting[1]]
    else
      results << meeting
    end
  end
  results
end

sample = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

p merge_ranges(sample)
