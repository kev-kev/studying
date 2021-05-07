# Write a method merge_ranges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.
# For example, given:
#   [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
# your method would return:
#   [[0, 1], [3, 8], [9, 12]]
# Do not assume the meetings are in order. The meeting times are coming from multiple teams.
# Write a solution that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges

# second attempt
#-- Brainstorming --
# Brute force approach would compare each meeting start time with each other meetings end times, merging if appropriate
# We know that each meeting start time will come before each meeting end time
# Compare the start time of each meeting with the end time of the prev meeting, combine if there's overlap
  # should combine if touching too ([1, 4] [4, 5] => [1, 5])
  # doesn't work once we get to an unsorted portion ([4, 8], [10, 12], [9, 10])
# Try sorting first, then comparing start and end times.
  # Not sure if there's a better way to do this, but this should run in O(n lg n) 

def merge_ranges(meeting_times)
  meeting_times.sort!
  merged_times = [meeting_times.first]
  meeting_times[1..-1].each do |start_time, end_time|
    last_meeting = merged_times.last
    if last_meeting[1] >= start_time
      merged_times[-1] = [last_meeting[0], end_time]
    else
      merged_times << [start_time, end_time]
    end
  end 
  merged_times
end


testcase = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
p merge_ranges(testcase)








# first attempt
# --- Brainstorming --- 
# We know meeting[0] < meeting[1] for each meeting
# Looking at the sample meetings, it's easy to combine each meeting into a range as long as they're in order, but gets tricky if it's out of order.
# First thought is it may be best to sort the data before combining into condensed ranges
# If meetings are in order, meetings[0][0] must be results[0][0] since it's the earliest possible start time
#   Then, check if meetings[0][1] > meetings[1][0] (in example data, this is 1 > 3 => false)
#   If so, combine the ranges, so result[0] = [meetings[0][0], meetings[1][0]]
# #   Else, result[0] = meetings[0] 
# # If out of order, would need to keep track of meeting start/end times as we progress, so I'm taking the first approach.

# def merge_ranges(meetings)
#   meetings = meetings.sort 
#   results = [meetings[0]] 
#   meetings[1..-1].each do |meeting|  
#     if meeting[1] < results[-1][1]
#       nil
#     elsif meeting[0] <= results[-1][1] 
#       results[-1] = [results[-1][0], meeting[1]]
#     else
#       results << meeting
#     end
#   end
#   results
# end
