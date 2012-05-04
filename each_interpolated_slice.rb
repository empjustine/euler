module SliceExtensions

    def _each_interpolated_slice(slice)

        (0..self.size - slice).each do |start|
            yield(self[start...start + slice])
        end
    end

    def each_interpolated_slice(slice, &block)
        return block_given? ? _each_interpolated_slice(slice,&block) : enum_for(:_each_interpolated_slice, slice)
    end
end

class String

    include SliceExtensions
end

class Array

    include SliceExtensions
end
