# Given weights and values of N items, put these items in a knapsack of max capacity W to get the max total value in the knapsack
# You can't split items up.
# EX: W = 6, items_wt = [1, 2, 3, 4], items_vl = [1, 3, 4, 6]

# -- Brainstorming --
# Could find a way to sort the items by most valuable per weight unit
# then, try to add the first item, then the second, third, etc until I can't add any more => O(nlgn)

# maybe there's a dp solution to this
# we know that every time we choose to use an item, we gain its value in our bag, but lose capacity in the bag
# if we don't choose an item, we can instead take the value we would get from choosing other items in our input
# so we want to ask at each choice- which is greater: the value we get from choosing to take this item, or from not choosing the item
# if we do choose an item, we need to make sure we have the capacity to do so first
# since we can make decisions based off subproblems we can code a dp solution to this
# our colums will go from 0 to the maximum, c, and the rows will be the weight/value of each item
# each cell

# if remaining_capacity >= current_item_weight
#   cell = [table[row-1][col - current_item_weight] + current_item_value, table[row - 1][col]].max  => we take whichever is bigger: the value of the current coin or the highest possible value when not using the coin
# else
#   cell = table[row - 1][col] => we don't use the current coin, taking the value of the row above, which represents the highest value possible when not using the current coin
# end
# return the last cell from the table

def knapsack(c, items)
  size = items[0].length
  table = []
  size.times do 
    table << Array.new(c + 1, 0)
  end
  (0..size - 1).each do |row|
    (0..c).each do |col|
      if col >= items[0][row]
        table[row][col] = [table[row - 1][col - items[0][row]] + items[1][row], table[row - 1][col]].max
      else
        table[row][col] = table[row-1][col]
      end
    end
  end
  table[size - 1][c]
end

p knapsack(5, [[5, 3, 4, 2], [60, 50, 70, 30]])