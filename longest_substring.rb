# @param {String} s
# @return {Integer}

# look through each char in s, keeping track of each index
# if weve seen this char before, set the starting index to the index after the seen char's index
# however, we want to avoid this if the seen char comes before our starting index, so we can check for that
# get the cur length (current index - starting index + 1) and set max_length equal to it if larger
# add our char and index to the seen hash
# once weve seen all chars, return the max_length

def length_of_longest_substring(s)
  seen = {}
  starting_index = max_length = i = 0
  s.each_char do |char|
    if seen[char] && starting_index <= seen[char]
      starting_index = seen[char] + 1
    else
      max_length = [max_length, i - starting_index + 1].max
    end
    seen[char] = i
    i += 1
  end
  max_length
end

p length_of_longest_substring("au")
p length_of_longest_substring("")
p length_of_longest_substring("dvdf")
p length_of_longest_substring("bbbbbb")