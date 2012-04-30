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

def histogram(array)
    hist = Hash.new
    array.each do |element|
      hist[element] ||= 0
      hist[element] += 1
    end

    return hist
end

def least_common_factors(multiples)
    multiples.map do |n|
        histogram(fermat_factorization(n).flatten.select { |x| x > 1 }).to_a
    end.flatten.each_slice(2).sort.map do |number|
        Hash[*number]
    end.inject(&:merge)
end

def least_common_multiples(multiples)
    least_common_factors(multiples).map do |factor, power|
        factor**power
    end.inject(&:*)
end

least_common_multiples(0..20)
