module IntegerExtensions

    def _digits
        temp = self
        digits = []
        while temp > 0 do
            digits << temp % 10
            temp /= 10
        end
        return digits
    end

    def digits
        _digits.reverse
    end
end

class Integer

    include IntegerExtensions
end
