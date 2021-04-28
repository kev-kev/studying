# You want to build a word cloud, an infographic where the size of a word corresponds to how often it appears in the body of text.

# To do this, you'll need data. Write code that takes a long string and builds its word cloud data in a hash ↴ , where the keys are words and the values are the number of times the words occurred.

# keep track of two indices, i and j. 
# walk through each char of the string, increasing i at each iteration, and check if the char is a space. 
# if it's a space, we need to add the trim of that word to the hash if it doesn't exist, and increase the value by one if it does
# if the char isn't a space, 
require 'set'
def word_cloud(string)
  excluded_punctuation = Set.new([" ", "_", "[", "]", "(", ")", ",", ".", "!", "?", "#", "$",])
  result, i, j = {}, 0, 0
  string.each_char do |c|
    if excluded_punctuation.include?(c)
      word = string.slice(j..i-1).downcase
      result[word] ? result[word] += 1 : result[word] = 1
      i += 1
      j = i
    else
     i += 1
    end
  end
  result
end

p word_cloud("We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake.")