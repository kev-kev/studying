# You have a method rand7() that generates a random integer from 1 to 7. Use it to write a method rand5() that generates a random integer from 1 to 5.

# rand7() returns each integer with equal probability. rand5() must also return each integer with equal probability.

# -- Brainstorming --

# could just call rand7 and check if the result is < 5, if so call again until it isn't 

def rand7
  rand(1..7)
end

def rand5
  result = rand7
  while result > 5
    result = rand7
  end
  result
end