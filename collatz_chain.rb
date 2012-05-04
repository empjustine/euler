require './infinite_iterator'

class CollatzChain

    extend InfiniteIterator

    @cache = { 1 => [1, 1, []], }
    @current_chain = 1

    class << self

        attr_reader :current_chain

        def [](n)

            return _chain_cache(n)
        end

        def _preview(n)

            return n.even? ? n / 2 :  3 * n + 1
        end

        def _chain_cache(n)
            return @cache[n] ||= [n,  _chain_cache(_preview(n))[1] + 1, _chain_cache(_preview(n))]
        end

        def _consequent
            return result = _chain_cache(@current_chain += 1)
        end
    end
end
