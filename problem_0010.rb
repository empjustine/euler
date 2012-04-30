class Prime

    def self.sieve(num)
        _sieve = 3.step(num, 2).to_a
        primes = [2]
        while _sieve.size > 0 do
            primes << _sieve.shift
            _sieve.select! { |n| n % primes.last != 0 }
        end
        return primes
    end

    @cache = sieve(10)

    def self.cache
        return @cache
    end

    def self.cache=(val)
        @cache = val
    end

    def self._next
        current = @cache[-1]
        loop do
            current += 2
            limit = Math.sqrt(current).ceil + 1

            new_prime = true
            @cache.each { |prime|
                if current % prime == 0
                    new_prime = false
                    break
                elsif prime > limit
                    break
                end
            }

            if new_prime
                @cache << current
                return @cache[-1]
            end
        end
    end

    def self.[](index)
        until @cache.size > index do
            _next
        end

        return @cache[index]
    end

    def self.upto(value)
        until @cache[-1] > value do
            _next
        end

        return @cache[0...-1]
    end
end

puts Prime.upto(2_000_000).inject(&:+)
