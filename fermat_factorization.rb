module IntegerExtensions

    def fermat_factorization
        
        return [-1, -self.fermat_factorization] if self < 0
        return [0, 0] if self == 0
        return [1, 1] if self == 1
    
        return [1, 2] if self == 2
        return [2, (self / 2).fermat_factorization] if self.even?
    
        _x = Math.sqrt(self); x = _x.floor
        if _x == x
            response = [x, x]
            return response.map { |k| k.fermat_factorization } if response.select { |k| 1 == k }.empty?
            return response
        end
    
        limit = (self + 1) / 2
        loop do
            x += 1
            _ys = Math.sqrt(x**2 - self); ys = _ys.floor
            if _ys == ys
                response = [x - ys, x + ys]
                return response.map { |k| k.fermat_factorization } if response.select { |k| 1 == k }.empty?
                return response
            end
            break if x > limit
        end
    
        return [1, self]
    end
end

class Integer
    
    include IntegerExtensions
end
