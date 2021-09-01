# An avid hiker keeps meticulous records of their hikes. During the last hike that took exactly  steps, for every step it was noted if it was an uphill, , or a downhill,  step. Hikes always start and end at sea level, and each step up or down represents a  unit change in altitude. We define the following terms:

# A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
# A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
# Given the sequence of up and down steps during a hike, find and print the number of valleys walked through.

# Example
# steps = 8, path = [DDUUUUDD]
# => 1
# The hiker first enters a valley 2 units deep. Then they climb out and up onto a mountain 4 units high. Finally, the hiker returns to sea level and ends the hike.

def countingValleys(steps, path)
  elevation = count = prev = 0
  path.each_char do |dir|
      prev = elevation
      dir === "U" ?
          elevation += 1 :
          elevation -= 1
      count += 1 if prev < 0 && elevation === 0
  end
  count
end