module Gregorian
  class Day

    attr_accessor :days

    def initialize(days)

      @days = days
    end

    def ==(other)

      return self.day == other.day
    end
  end

  class Month

    attr_accessor :months

    def initialize(months)

      @months = months
    end

    class << self

      def days(month, leap_year=nil)

        return Day.new(
          case month
          when 4, 6, 9, 11
            30
          when 1, 3, 5, 7, 8, 10, 12
            31
          when 2
            leap_year.nil? ? nil : leap_year ? 29 : 28
          else
            nil
          end
        )
      end
    end

    def days(leap_year=nil)

      return Month.days(@months, leap_year)
    end

    def days_next(day, leap_year=nil)
      return Day.new(
        days(leap_year).days - day
      )
    end

    def ==(other, leap_year_1=nil, leap_year_2=nil)

      return(
        months == other.months &&
        days(leap_year_1) == other.days(leap_year_2)
      )
    end

    def before

      return Month.new(@months - 1)
    end

    def after

      return Month.new(@months + 1)
    end
  end

  class Year

    attr_accessor :years

    def initialize(years)

      @years = years
    end

    class << self

      def leap_year?(year)

        return (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
      end

      def days(year)

        return leap_year?(year) ? 366 : 365
      end

      def months

        return Month.new(12)
      end
    end

    def ==(other)

      return self.year == other.year
    end

    def leap_year?

      return Year.leap_year?(@years)
    end

    def days

      return Year.days(@year)
    end

    def months

      return Year.months
    end
  end

  class Date

    attr_accessor :year, :month, :day

    def initialize(year, month, day)

      @year  = Year.new(year)
      @month = Month.new(month)
      @day   = Day.new(day)
    end

    def ==(other)

      return(
        year  == other.year &&
        month == other.month &&
        day   == other.day
      )
    end

    def valid_month

      while @month.months < 1
        @year.years -= 1
        @month.months += @year.months.months
      end

      while @month.months > @year.months.months
        @year.years += 1
        @month.months -= @year.months.months
      end

      return self
    end

    def valid_day

      while @day.days < 1
        @month.months -= 1
        valid_month
        @day.days += @month.days(@year.leap_year?).days
      end

      while @day.days > @month.days(@year.leap_year?).days
        @day.days -= @month.days(@year.leap_year?).days
        @month.months += 1
        valid_month
      end

      return self
    end

    def inspect
      return "#{@year.years}:#{@month.months}:#{@day.days}"
    end

    def change(delta_days)

      @day.days += delta_days.days
      valid_day
    end

    def weekday
      Range.new(*[
        Date.reference_monday.year.years,
        year.years
      ].sort)
    end

    class << self

      def min

        return new(1582, 02, 24)
      end

      def reference_monday

        return new(1900, 01, 01)
      end
    end
  end
end
