require './least_common_factors'

module ArrayExtensions

    def least_common_multiple
        self.least_common_factors.map do |factor, power|
            factor**power
        end.inject(&:*)
    end
end

class Array
    
    include ArrayExtensions
end

