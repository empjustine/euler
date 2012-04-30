module IntegerExtensions

    # Sum of squares of the first n natural numbers
    def sum_of_squares
        return self * (self + 1) * (2 * self + 1) / 6
    end
end

class Integer
    
    include IntegerExtensions
end
