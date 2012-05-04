require './binomial'

class PascalTriangle

    class << self

        def [](n)

            return (0..n).map do |k|
                Binomial[n, k]
            end
        end
    end
end
