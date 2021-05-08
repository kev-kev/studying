# Given a list of N coins, their values (V1, V2, … , VN), and the total sum S. 
# Find the minimum number of coins the sum of which is S (we can use as many coins of one type as we want), 
#   or report that it’s not possible to select coins in such a way that they sum up to S.

# -- Brainstorming -- 
# Since we know we'll have many repeated subproblems (given our testcase, every time we use a 2, we can swap it with two 1s), maybe we can solve with DP
# Since we know how to solve the subproblems, let's try bottom up

# We can use a coin as long as it's less than or equal to our target amount, so..

#     if target >= coin
#       combinations[target] += combinations[target-coin]
#     end

# Columns are the target amount
# Rows are the coins we have available to make a target amount

#        0 | 1 | 2 | 3 | 4 | 5
#   125| 1   1   2   2   3   4

def change(amount, coins)
  combinations = Array.new(amount + 1, 0)
  combinations[0] = 1 # we know there is always one way to make 0 - with no coins
  coins.each do |coin|
    combinations.each_index do |target| 
      next if target == 0
      if target >= coin 
        combinations[target] += combinations[target - coin]
      end
    end
  end
  p combinations
  combinations.last
end

p change(5, [1, 2, 5])
