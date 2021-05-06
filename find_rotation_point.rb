# I want to learn some big words so people think I'm smart.

# I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.

# Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated." For example:

#   words = [
#     'ptolemaic',
#     'retrograde',
#     'supplant',
#     'undulate',
#     'xenoepist',
#     'asymptote',  # <-- rotates here!
#     'babka',
#     'banoffee',
#     'engender',
#     'karpatka',
#     'othellolagkage',
# ]

# Write a method for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.

# To keep things simple, you can assume all words are lowercase.

# -- brainstorming --
# need to look at each word and determine if it comes after the prev word alphabetically
# we know that chars early in the alphabet are less than chars later in the alphabet
# could iterate through the words, keeping track of the prev word
# if our prev > cur, we're at the rotation point
# else, set prev to the current word and move on
def find_rotation_point(input)
  prev = input.first
  input[1..-1].each_with_index do |word, i|
    return i+1 if prev > word
    prev = word if prev < word
  end
end

  testcase = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage',
]

p find_rotation_point(testcase)