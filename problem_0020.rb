require './factorial'
require './digits'

puts (
  Factorial[100].digits.inject(&:+)
)

