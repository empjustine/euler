require './lib/integer_extensions'

# Largest palindrome product
# ==========================
#
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609

THREE_DIGIT_NUMBERS = 999.downto(100).select { |n|
  !n.multiple?(10)
}

print THREE_DIGIT_NUMBERS.product(THREE_DIGIT_NUMBERS).map { |factor1, factor2|
  factor1 * factor2
}.select(&:palindrome?).max
