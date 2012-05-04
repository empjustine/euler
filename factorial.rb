require './infinite_iterator'

class Factorial

    extend InfiniteIterator

    @cache = [1, 1]

    def self._consequent
        @cache << (@cache[-1] * @cache.size)
    end
end
