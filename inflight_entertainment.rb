# Write a method that takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes) and returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length.

# -- Brainstorming --
# We can disregard duplicate movie lengths, and are checking if it includes a specific value, so can use a set rather than an array
# Iterate through movie lengths
# if the set includes the movie time, return true
# else, calculate the remaining time for each movie and add to the set

require 'set'

def inflight_entertainment(flight_length, movie_lengths)
  potential_times = Set.new
  movie_lengths.each do |movie_time|
    if potential_times.include?(movie_time)
      return true
    else
      potential_times.add(flight_length - movie_time)
    end
  end
  false
end

flight = 12
movies = [1, 2, 3, 4, 5, 6, 7]

p inflight_entertainment(flight, movies)