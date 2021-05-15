# You have a map that marks the location of a treasure island. Some of the map area has jagged rocks and dangerous reefs. Other areas are safe to sail in. There are other explorers trying to find the treasure. So you must figure out a shortest route to the treasure island.

# Assume the map area is a two dimensional grid, represented by a matrix of characters. You must start from the top-left corner of the map and can move one block up, down, left or right at a time. The treasure island is marked as X in a block of the matrix. X will not be at the top-left corner. Any block with dangerous rocks or reefs will be marked as D. You must not enter dangerous blocks. You cannot leave the map area. Other areas O are safe to sail in. The top-left corner is always safe. Output the minimum number of steps to get to the treasure.

# Example:

# Input:
# [['O', 'O', 'O', 'O'],
#  ['D', 'O', 'D', 'O'],
#  ['O', 'O', 'O', 'O'],
#  ['X', 'D', 'D', 'O']]

# Output: 5
# Explanation: Route is (0, 0), (0, 1), (1, 1), (2, 1), (2, 0), (3, 0) The minimum route takes 5 steps.

# -- Brainstorming --
# Every time we look for a path, we can add 1 to our x or y value
# a valid path is any neighbor that doesn't have a value of 'D'
# could possibly keep track of the prev location each time we search so we don't make paths backwards
# increment the length of each path every time we search and store it when we reach x
# then return the min value of those results
# create an arr of same size, make each entry true as we traverse
# we also need to make sure our x and y values don't go beyond the max and and max y (number of rows and columns) or below 0


def treasure_search(map)

  return 0 if map.nil? || map.empty?

  rows = map.length
  cols = map.first.length
  visited = [] 
  rows.times{ visited << Array.new(cols, false) }

  x = y = 0
  queue = [[x, y, 0]]
  visited[0][0] = true

  until queue.empty?
    x, y, steps = queue.shift
    return steps if map[x][y] == 'X'

    if x+1 <= cols-1 && !visited[x+1][y] && map[x+1][y] != 'D' 
      visited[x+1][y] = true
      queue << [x+1, y, steps+1]
    end
    if x-1 >= 0 && !visited[x-1][y] && map[x-1][y] != 'D'
      visited[x-1][y] = true
      queue << [x-1, y, steps+1]
    end
    if y+1 <= rows-1 && !visited[x][y+1] && map[x][y+1] != 'D'
      visited[x][y+1] = true
      queue << [x, y+1, steps+1]
    end
    if y-1 >= 0 && !visited[x][y-1] && map[x][y-1] != 'D'
      visited[x][y-1] = true
      queue << [x, y-1, steps+1]
    end
    
  end

  -1 # no treasure found
end


testcase = [
  ['O', 'O', 'O', 'O'],
  ['D', 'O', 'D', 'O'],
  ['O', 'O', 'O', 'O'],
  ['X', 'D', 'D', 'O']
]

p treasure_search(testcase)