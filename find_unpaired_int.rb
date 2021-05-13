# Given an array of IDs, which contains many duplicate integers and one unique integer, find the unique integer.

# -- Brainstorming --
# Can iterate through the input, adding chars to a hash with a value of 1 and removing if we've seen the ID already

# def find_unique_id(arr)
#   seen = {}
#   arr.each do |i|
#     seen[i] ? seen.delete(i) : seen[i] = true
#   end
#   seen.first[0]
# end

# since we know we'll see every int twice except for one, and we only care about two states: if we've seen the num before or not, we can use the XOR bit operator
# each num we iterate through, we'll need to set our output to the XOR of that num

def find_unique_id
  unique_id = 0
  arr.each do |i|
    unique_id ^= i 
  end
  unique_id
end