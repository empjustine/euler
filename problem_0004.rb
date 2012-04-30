def reverse_uniq_top_product_iterator(min, max)
    distance = 0
    delta = 0

    loop do
        break unless max - distance - delta >= min && max - distance + delta >= min
        yield(max - distance - delta, max - distance + delta)
        delta += 1
        if delta > distance
            distance += 1
            delta = 0
        end
    end
end

reverse_uniq_top_product_iterator(0, 999) { |x, y|
    original = (x * y).to_s
    if original == original.reverse
        puts x, y
        break
    end
}
