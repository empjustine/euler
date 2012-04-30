require './fermat_factorization.rb'
require './histogram'

module ArrayExtensions

    def least_common_factors
        self.map do |n|
            n.fermat_factorization.flatten.select { |x| x > 1 }.histogram.to_a
        end.flatten.each_slice(2).sort.map do |number|
            Hash[*number]
        end.inject(&:merge)
    end
end

class Array
    
    include ArrayExtensions
end

