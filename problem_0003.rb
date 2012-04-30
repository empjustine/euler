def fermat_factorization(n)
    return [-1, fermat_factorization(-n)] if n < 0
    return [0, 0] if n == 0
    return [1, 1] if n == 1

    return [1, 2] if n == 2
    return [2, fermat_factorization(n / 2)] if n.even?

    _x = Math.sqrt(n); x = _x.floor
    if _x == x
        response = [x, x]
        return response.map { |n| fermat_factorization(n) } if response.select { |n| 1 == n }.empty?
        return response
    end

    limit = (n + 1) / 2
    loop do
        x += 1
        _ys = Math.sqrt(x**2 - n); ys = _ys.floor
        if _ys == ys
            response = [x - ys, x + ys]
            return response.map { |n| fermat_factorization(n) } if response.select { |n| 1 == n }.empty?
            return response
        end
        break if x > limit
    end

    return [1, n]
end

puts fermat_factorization(600851475143).flatten.max
