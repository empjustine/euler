require './cardinal'

num = (1..1000).map { |number|
    Cardinal[number]
}.join(' ').gsub(/\s|-/, '').size

puts num
