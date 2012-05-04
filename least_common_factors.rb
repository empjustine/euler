require './prime_factorization.rb'
require './histogram'

module ArrayExtensions

    def least_common_factors
        return self.map do |n|
            n.factorize.histogram.to_a
        end.flatten.each_slice(2).sort.map do |number|
            Hash[*number]
        end.inject(&:merge)
    end
end

class Array

    include ArrayExtensions
end
