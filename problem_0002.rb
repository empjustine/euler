require './fibonacci'

puts(
    Fibonacci.upto(4_000_000).select { |number| number.even? }.inject(&:+)
)
