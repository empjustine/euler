require './multiples'
require './sum_of_squares'

puts(
  (0..100).multiples(1).summation**2 - 100.sum_of_squares
)
