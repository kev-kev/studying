# Write an efficient method that takes stock_prices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.

# For example:

#   stock_prices = [10, 7, 5, 8, 11, 9]

# get_max_profit(stock_prices)
# returns 6 (buying for $5 and selling for $11)


# -- Brainstorming -- 
# First thought is to keep track of max and min values as we iterate through the arr
# but just because we find those values doesn't mean we can max a max profit buying at the min or selling at the max, as they may not be in order
# So, it makes sense to find the max possible profit by buying at each index of stock_prices and get the max value of that 

# def get_max_profit(stock_prices)
#   max_profits, i = [], 1
#   stock_prices.each do |price|
#     max_profits << stock_prices[i..-1].max - price
#   end
#   max_profits.max
# end

# By checking the max profit at each price, though, we have to iterate through the stock_prices[i..-1] for every price ==>  n + (n - 1) + (n - 2) ... + 2 + 1n+(n−1)+(n−2)... + 2 + 1 ==> O(n^2), so maybe there's a better way
# could also just keep a running int of the max_profits and replace it greedily
# by keeping track of the min price so far, we can calculate the max profit possible for each price by subtracting

# keep track of the min price and max profit as we go
# look at each number in stock_prices
# subtract as we go to get the max profit for that price (4 - 5 = -1)
# profit = (price - min_price); max_profit = profit if profit > max_profit; min_price = price if price < min_price

# -- Edge cases --
# what if the max profit isnt a positive number? ex: stock_prices = [5, 4, 2, 0] => max profit would be -1 (buying at 5, selling at 4)
# could we then choose not to trade at all, defaulting to a max profit of 0? for this problem, ill assume at least one buy/sell is required

def get_max_profit(stock_prices)
  max_profit, min_price = nil, stock_prices[0]
  stock_prices[1..-1].each do |price|
    profit = price - min_price
    max_profit = profit if !max_profit || profit > max_profit
    min_price = price if price < min_price 
  end
  max_profit
end

stock_prices = [5, 4, 2, 0]
p get_max_profit(stock_prices)