class Fibonacci

    @cache = [1, 2]

    def self.cache=(value)
        @cache = value
    end

    def self.cache
        return @cache
    end

    def self.[](index)
        until @cache.size > index do
            _next
        end

        return @cache[index]
    end

    def self._next
        @cache << (@cache[-2] + @cache[-1])
    end

    def self.upto(value)
        until @cache[-1] > value do
            _next
        end

        return @cache[0...-1]
    end
end

puts Fibonacci.upto(4_000_000).select { |number| number.even? }.inject(&:+)
