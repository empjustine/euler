require './infinite_iterator'
require './digits'

class Cardinal

    extend InfiniteIterator

    @digits = {
        0  =>  'zero',
        1  =>   'one',
        2  =>   'two',
        3  => 'three',
        4  =>  'four',
        5  =>  'five',
        6  =>   'six',
        7  => 'seven',
        8  => 'eight',
        9  =>  'nine',
    }

    @cache = @digits.merge({
        10 =>    'ten',
        11 => 'eleven',
        12 => 'twelve',
    })

    {
                        'teen' => {
            13 => 'thir',
            14 =>         false,
            15 =>  'fif',
            16 =>         false,
            17 =>         false,
            18 => 'eigh',
            19 =>         false,
        },
                        'ty' => {
            20 => 'twen',
            30 => 'thir',
            40 =>  'for',
            50 =>  'fif',
            60 =>         false,
            70 =>         false,
            80 => 'eigh',
            90 =>         false,
        },
    }.each do |suffix, ruleset|
        ruleset.each do |number, prefix|
            @cache[number] = "#{prefix || (number >= 20 ? @cache[number / 10] : @cache[number % 10])}#{suffix}"
            (1..9).each { |offset|
                @cache[number + offset] = "#{@cache[number]}-#{@cache[offset]}"
            } if number >= 20
        end
    end

    (1..9).each { |hundred|
        @cache[hundred * 100] = "#{@cache[hundred]} hundred"
        (1..99).each { |number|
            @cache[hundred * 100 + number] = "#{@cache[hundred]} hundred and #{@cache[number]}"
        }
    }

    @powers = [
        '',
        'thousand',
    ].concat(
        [
                'm',
                'b',
               'tr',
            'quadr',
            'quint',
             'sext',
             'sept',
              'oct',
              'non',
            *[
                        '',
                      'un',
                     'duo',
                     'tre',
                'quattuor',
                    'quin', # 10**48, should be enough. So I hope.
            ].map { |prefix|
                "#{prefix}dec"
            },
        ].map { |prefix|
            "#{prefix}illion"
        }
    )

    @current = 20

    def self._consequent
        return self[@current += 1]
    end

    def self.[](number)
        return "minus #{self[-number]}" if number < 0

        return @cache[number] ||= number._digits.each_slice(3).map { |digits|
            digits.reverse.join.to_i
        }.zip(@powers).map { |number, power|
            "#{@cache[number]} #{power}" if number > 0
        }.reverse.compact.join(' and ').strip
    end
end
