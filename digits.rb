module IntegerExtensions

    def digits
        temp = self
        digits = []
        while temp > 0 do
            digits << temp % 10
            temp /= 10
        end
        return digits.reverse
    end
end

class Integer
    
    include IntegerExtensions
end
