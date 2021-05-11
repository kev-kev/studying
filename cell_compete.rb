require 'pry'

def cellCompete(states, days)
  size = states.length - 1
  days.times do
    result = Array.new(size)
    p states
    prev = -1
    post = 1
    left, right = nil, nil
    (0..size).each do |i|
      if prev.negative?
        left = 0
        right = states[post]
      elsif post > size
        left = states[prev]
        right = 0 
      else
        left = states[prev]
        right = states[post]
      end
      if left.zero? && right.zero?
        result[i] = 0
      elsif left == 1 && right == 1
        result[i] = 0
      else
        result[i] = 1
      end
      prev += 1
      post += 1
    end
    states = result
  end
  states
end

p cellCompete([1, 1, 1, 0, 1, 1, 1, 1], 2)
# 01001010
