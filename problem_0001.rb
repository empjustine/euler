require './multiples'

puts(
    [[3, 5], [15]].map { |sets|
        sets.map { |member|
            (0...1000).multiples(member).summation
        }.inject(&:+)
    }.inject(&:-)
)
