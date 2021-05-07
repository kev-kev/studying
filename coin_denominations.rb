# Write a method that, given:

# an amount of money
# an array of coin denominations
# computes the number of ways to make the amount of money with coins of the available denominations.

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

# -- Brainstorming --
# we can look at each denomination and see how many times that value goes into the target
# then try to use a smaller denomination to fill the gap
# if that doesn't work, use the next smallest and so on
# so if we have target=90, denominations=[1, 2, 3, 4], we could see how many times we can put 4 into 90, then how many times we can put 3 into the remainder, then 2..
# Then, since smaller denominations can add up to larger ones, would need to also try to do the same for each of those, up to the smallest denomination.
# so in that example, we'd have (22)4 + 2, 21(4) + 2(3), 21(4) + 3 + 2 + 1, 21(4) + 3(2)...
# since we need to apply the same operation on subproblems, and have a lot of repeating subproblems when solving this, it makes sense to use a recursive solution and memoize
# in each recursion then, we'd need to calculate the amount of ways to make the remaining amount with each denomination.

class CoinCounter
  def initialize
    @memo = {}
  end


  def count_coin_possibilities(remaining_amount, denominations, denomination_index = 0)
    key = [remaining_amount, denomination_index]
    return @memo[key] if @memo[key]

    return 1 if remaining_amount == 0 # if no remainder, add one
    return 0 if remaining_amount < 0 # overshot the remaining amount
    return 0 if denomination_index == denominations.length # no more denominations

    coin = denominations[denomination_index]
    result = 0
    
    while remaining_amount >= 0
      result += count_coin_possibilities(remaining_amount, denominations, denomination_index + 1) # move onto next coin until we're out of denominations
      remaining_amount -= coin
    end

    @memo[key] = result

    result
  end
end

a = CoinCounter.new
p a.count_coin_possibilities(4, [1, 2, 3])