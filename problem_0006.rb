require './finite_arithmetic_progression'
require './sum_of_squares'

puts FiniteArithmeticProgression.begin_end_step(0, 100, 1).summation_of_multiples**2 - 100.sum_of_squares
