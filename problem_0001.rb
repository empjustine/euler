def summation_of_multiples(range_min, range_max, multiple)
    floor = range_min + (range_min % multiple)
    ceiling = range_max - (range_max % multiple)
    count = (ceiling - floor) / multiple + 1
    gauss_summation = (floor + ceiling) * count / 2
end

puts summation_of_multiples(0, 999, 3) + summation_of_multiples(0, 999, 5) - summation_of_multiples(0, 999, 15)