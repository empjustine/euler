require './factorial'

class Binomial

    class << self

        def [](n, k)

            raise RangeError, 'k > n' if k > n
            return 1 if 0 == k || k == n
            return n if 1 == k || 1 == n - k

            return Factorial[n] / Factorial[k] / Factorial[n - k]
        end
    end
end
