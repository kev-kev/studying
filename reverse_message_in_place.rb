# Write a method reverse_words!() that takes a message as a string and reverses the order of the words in place.

# -- Brainstorming --
# Easy one liner would be message.split(" ").reverse.join(" "), but that would create a new array 
# Could iterate through and check for a space- each space would mean a new word
# But then we would need to create a new message by joining an array

# We already know how to reverse a string in place - 'cake pound steal' becomes 'laets dnuop ekac'
# We could start by reversing the entire message, then iterate through, looking for spaces, and reversing each word
def reverse_string!(string, i, j)
  # i, j = 0, string.length - 1
  while i < j do
    string[i], string[j] = string[j], string[i]
    i += 1
    j -= 1
  end
  string
end

def reverse_words!(message)
  reverse_string!(message, 0, message.length - 1).strip!
  i = 0
  j = 0 # last space index
  message.each_char do |c| #'laets dnuop ekac'
    if c === " " 
      reverse_string!(message, j, i-1)
      p message
      j = i + 1
    end
      i += 1
  end
end

message = "the sky is blue"
p reverse_words!(message)