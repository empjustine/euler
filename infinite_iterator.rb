module InfiniteIterator
      
    def cache
        return @cache
    end
    
    def cache=(value)
        return @cache = value
    end
    
    def [](index)
        
        until @cache.size > index do
            _next
        end
        
        return @cache[index]
    end
    
    def upto(value)
        
        until @cache[-1] > value do
            _next
        end

        return @cache[0...-1]
    end
end

