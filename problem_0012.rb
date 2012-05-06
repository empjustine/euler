require './triangle_number'
require './number_of_divisors'

puts(
    TriangleNumber.each { |number|
        break number if number.number_of_divisors > 500
    }
)
