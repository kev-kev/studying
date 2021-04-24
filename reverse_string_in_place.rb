# Write a method that takes a string and reverses the letters in place.


# "abcd" => "dcba"
# look at first and last letter of the string and set them equal to eachother
# then increment and decrement those indices until i > j
def reverse!(string)
  i, j = 0, string.length - 1
  while i < j do
    string[i], string[j] = string[j], string[i]
    i += 1
    j -= 1
  end
  string
end

p reverse!("My name is Kevin!")