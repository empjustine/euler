require './pythagorean_triplet'

puts(
    PythagoreanTriplet.warm_cache.select { |triplet|
        1000 == triplet[:a] + triplet[:b] + triplet[:c]
    }.select { |triplet|
        triplet[:a] > 0 and triplet[:b] > 0 and triplet[:c] > 0
    }.map { |triplet|
        [:a, :b, :c].map { |side|
            triplet[side]
        }.inject(&:*)
    }
)
