require './triangle_number'
require './number_of_divisors'

number = TriangleNumber.each { |number|
    break number if number.number_of_divisors > 500
}
puts number
