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

# table[1][2] is asking how many ways are there to make 2 with 1
# table[3][5] asks how many ways are there to make 5 with 1, 2, 5 (our answer)

# -- 2d array bottom up approach -- 

def change(n, coins)
  size = coins.length
  table = []
  (size + 1).times do
    table << [1] + Array.new(n, 0)
  end
  (1..size).each do |row|
    (1..n).each do |col|
      if coins[row-1] <= col
        table[row][col] = table[row - 1][col] + table[row][col - coins[row - 1]]
      else # we can't use the coin, so take the val from one row up
        table[row][col] = table[row-1][col]
      end
    end
  end
  table.each do |row|
    p row
  end
end

# -- 1D array bottom up approach --

# def change(amount, coins)
#   combinations = Array.new(amount + 1, 0)
#   combinations[0] = 1 # we know there is always one way to make 0 - with no coins
#   coins.each do |coin|
#     (0..amount).each do |target| 
#       next if target == 0
#       if target >= coin 
#         combinations[target] += combinations[target - coin]
#       end
#     end
#   end
#   combinations.last
# end 

change(5, [1, 6])