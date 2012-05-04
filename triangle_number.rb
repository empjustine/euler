require_relative './infinite_iterator'

class TriangleNumber

    extend InfiniteIterator

    @cache = [3]

    def self._consequent
        new = @cache[-1] + @cache.size + 2
        @cache << new
        return new
    end
end
