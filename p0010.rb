require 'prime'

# Summation of primes
# ===================
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
#
# Answer: 142913828922

print Prime.take_while { |n|
  n < 2_000_000
}.inject(&:+)
