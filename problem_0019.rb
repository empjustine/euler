require './naive_weekday_calendar'

puts(NaiveWeekdayCalendar.upto(2000, 12).select { |k, v| v == 0 && k[0] >= 1901 }.size)