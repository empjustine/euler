class PythagoreanTriplet

    @cache = []

    def self.generate_triplet(m, n, k)
        return nil unless m > n or (m - n).odd?

        triplet = {
            :m => m,
            :n => n,
            :k => k,
            :a => (m**2 - n**2) * k,
            :b => (2 * m * n) * k,
            :c => (m**2 + n**2) * k,
        }

        triplet[:valid] = triplet[:a]**2 + triplet[:b]**2 == triplet[:c]**2

        return @cache << triplet
    end

    def self.warm_cache
        [0.5].concat((1..20).to_a).each do |k|
            (1..20).each do |n|
                (1..20).each do |m|
                    generate_triplet(m, n, k)
                end
            end
        end

        return @cache
    end

    def self.cache=(val)
        @cache = val
    end

    def self.cache
        return @cache
    end
end
