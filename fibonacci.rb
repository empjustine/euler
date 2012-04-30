require_relative './infinite_iterator'

class Fibonacci

    extend InfiniteIterator
    
    @cache = [1, 2]

    def self._next
        
        return @cache << (@cache[-2] + @cache[-1])
    end
end
