require './proper_divisors' 

puts(
  ProperDivisorSummation.upto(10_000).select { |k, v|
    ProperDivisorSummation[v||0] == k
  }
)
