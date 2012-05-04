require './infinite_iterator'

class Prime

    extend InfiniteIterator

    @cache = [2, 3]
    load_cache('prime.cache')

    def self.sieve(num)
        _sieve = 3.step(num, 2).to_a
        primes = [2]
        while _sieve.size > 0 do
            print "/"
            primes << _sieve.shift
            _sieve.select! { |n| n % primes.last != 0 }
        end

        return primes
    end

    def self._consequent

        current = @cache[-1]
        loop do

            current += 2
            limit = Math.sqrt(current).ceil + 1
            @cache.map { |prime|
                break false if current % prime == 0
                break true if prime > limit
            } and return @cache << current
        end
    end
end
