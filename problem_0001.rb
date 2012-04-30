require './finite_arithmetic_progression'

puts [
    [[0, 999,  3], [0, 999,  5]],
    [[0, 999, 15]],
].map { |rangesets|
    rangesets.map { |ranges|
        FiniteArithmeticProgression.begin_end_step(*ranges).summation_of_multiples
    }.inject(&:+)
}.inject(&:-)