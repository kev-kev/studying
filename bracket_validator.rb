# You're working with an intern that keeps coming to you with JavaScript code that won't run because the braces, brackets, and parentheses are off. To save you both some time, you decide to write a braces/brackets/parentheses validator.

# Let's say:

# '(', '{', '[' are called "openers."
# ')', '}', ']' are called "closers."
# Write an efficient method that tells us whether or not an input string's openers and closers are properly nested.

# Examples:

# "{ [ ] ( ) }" should return true
# "{ [ ( ] ) }" should return false
# "{ [ }" should return false


# -- brainstorming --
# if we can do this in O(n) time, we'd need to be able to check if each character is valid and return false if not
# all openers are valid
# closers can only be valid if it's corresponding opener has been seen already
#   also the most recently added opener must be closed before others
# each char, if it's an opener, add the corresponding closer to the stack
# if it's a closer, check the last char of the stack. if != return false, else pop off that char from the stack
# can check if chars are openers by creating a set of openers and checking if each char is included in it
# could also use a case statement, adding corresponding closers to the stack as we go 

# -- edge cases --
# is each char guaranteed to be an opener/closer? 
#   i'll assume not for this problem, so we could check for the chars we're interested in by checking if each char is included in a set of possible chars
# are there any invalid inputs?
#   if the length of our input is 1 or less

require 'Set'

def bracket_validator(input)
  raise ArgumentError, 'Invalid input' if input.length <= 1

  chars = Set['{', '}', '[', ']', '(', ')']
  stack = []
  input.each_char do |c|
    next unless chars.include?(c)
    if c === stack.last # removing last item from stack if we have a corresponding closer
      stack.pop 
      next
    end
    case c
    when '{'
      stack << '}' 
    when '['
      stack << ']'
    when '('
      stack << ')'
    else
      return false
    end
  end
  true
end

testcase = "{ [ }" 
p bracket_validator(testcase)