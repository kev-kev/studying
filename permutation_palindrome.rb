# Write an efficient method that checks whether any permutation ↴ of an input string is a palindrome. ↴

# You can assume the input string only contains lowercase letters.

# Examples:

# "civic" should return true
# "ivicc" should return true
# "civil" should return false
# "livci" should return false

# -- Brainstorming --
# How can we check for a palindrome?
# First thought is to check the length of the word- if it's even, then the second half of the word would be the same as the first half of the word, but reversed. Odd, and the same is true, but the middle character acts as a pivot 
# Can we use any of that info when checking if any permutation of a string is a palindrome?
# Since palindromes are the same forward and backward, they should have even character counts, not counting that one odd quantity letter
# Isn't possible to have a palindrome with more than one odd-quantity character
# "civic" - 2c, 2i, 1v => one pivot = true
# "ivicc" - 2c, 2i, 1v => still true
# "civil" - 1c, 2i, 1v, 1l => 3 pivots, so false
# "civvvic" - 2c, 2i, 3v => true

# iterate through the input string, adding to the hash as we come across new letters
# then, check each value of the hash- if we have more than one odd, return false. otherwise, true

def permutation_palindrome?(string)
  count, i = {}, 0
  string.each_char do |c|
    if count[c]
      count[c] += 1 
    else
       count[c] = 1
    end
  end
  count.each_value do |n|
    if n.odd?
      i += 1
      return false if i > 1
    end
  end
  true
end

p permutation_palindrome?("ciivvvic")