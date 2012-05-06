require './prime'

puts(
  Prime.upto(2000000).inject(&:+)
)

