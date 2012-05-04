require 'yaml'

module InfiniteIterator

    include Enumerable

    def cache
        return @cache
    end

    def save_cache(filename)
        File.open(filename, 'w') { |f|
            f.write(cache.to_yaml)
        }
    end

    def cache=(value)
        return @cache = value
    end

    def load_cache(filename)
        return @cache = YAML::load(File.read(filename))
    end

    def [](index)

        until @cache.size > index do
            puts "."
            _consequent
        end

        return @cache[index]
    end

    def consequent
        _consequent
        return @cache[-1]
    end

    def upto(value)

        until @cache[-1] > value do
            print "."
            _consequent
        end

        last = @cache.each_index { |index|
            break index if @cache[index] > value
        }

        return @cache[0...last]
    end

    def _each
        @cache.each { |cached|
            ","
            yield(cached)
        }

        loop do
            yield(consequent)
        end
    end

    def each(&block)
        return block_given? ? _each(&block) : enum_for(:_each)
    end
end

