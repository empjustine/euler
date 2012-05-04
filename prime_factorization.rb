require './prime'

module IntegerExtensions

    def prime_factorization

        return [-1, -self.prime_factorization] if self < 0
        return [] if self == 0 || self == 1

        value = self
        factors = []

        limit = Math.sqrt(self).ceil
        Prime.each do |prime|
            while value % prime == 0
                value /= prime
                factors << prime
            end
            break if value == 1
        end
        return factors

    end

    def factorize
        self.prime_factorization
    end
end


class Integer

    include IntegerExtensions
end
