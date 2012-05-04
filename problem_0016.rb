require './digits'

num = (2**1000).digits.inject(&:+)
puts num