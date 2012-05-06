class NaiveWeekdayCalendar

  @cache = {
    [1900, 1, 1] => 1,
  }

  @year  = 1900
  @month = 1
  @day   = 1
  @week  = 1

  SUNDAY = 0
  MONDAY = 1

  class << self

    attr_accessor :cache

    def next_month

      days = @week + days(@month, @year)

      @month += 1

      if @month > 12
        @year += 1;
        @month  -= 12;
      end

      return @week = @cache[[@year, @month, @day]] = days % 7
    end

    def leap_year?(year)
      return (year % 100 == 0 ? year % 400 == 0 : year % 4 == 0)
    end

    def days(month, year)
      return (
        case month
        when 4, 6, 9, 11
          30
        when 1, 3, 5, 7, 8, 10, 12
          31
        when 2
          (leap_year?(year) ? 29 : 28)
        else
          nil
        end
      )
    end

    def upto(year, month)

      until @year == year && @month == month

        next_month
      end

      return cache
    end
  end
end
