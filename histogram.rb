module ArrayExtensions

    def naive_histogram

        hist = Hash.new
        self.each do |element|
            hist[element] ||= 0
            hist[element] += 1
        end

        return hist
    end

    def histogram
        naive_histogram
    end
end

class Array

    include ArrayExtensions
end
