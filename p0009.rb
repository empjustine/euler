require './lib/pythagorean_triples'

# Special Pythagorean triplet
# ===========================
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a² + b² = c²
#
# For example, 3² + 4² = 9 + 16 = 25 = 5².
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Answer: 31875000

print PythagoreanTriplesSequence.select { |triple|
  triple.inject(&:+) == 1000
}.next.inject(&:*)
