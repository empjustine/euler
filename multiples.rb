module RangeExtensions

    def multiples(n)

        this = self
        _begin = this.begin - this.begin % n
        _last = (this.exclude_end? ? (this.last - 1 - (this.last - 1) % n) : (this.last - this.last % n))

        _range = Range.new(_begin, _last)
        enumerator = _range.step(n)

        enumerator.define_singleton_method(:step) { n }
        enumerator.define_singleton_method(:range) { _range }

        _count = (_last - _begin) / n + 1
        enumerator.define_singleton_method(:count) { _count }
        enumerator.define_singleton_method(:summation) { (_begin + _last) * _count / 2 }

        return enumerator
    end
end

class Range

    include RangeExtensions
end
