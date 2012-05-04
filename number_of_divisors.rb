require './prime_factorization'
require './histogram'

module IntegerExtensions

    def number_of_divisors

        factors = self.factorize
        return 0 if factors.size == 0
        return factors.histogram.values.map { |power| power + 1 }.inject(&:*)
    end
end

class Integer

    include IntegerExtensions
end
