require './prime'

puts Prime.upto(2_000_000).inject(&:+)
