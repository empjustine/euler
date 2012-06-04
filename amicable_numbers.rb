require './proper_divisors'

module IntegerExtensions

  def amicable
    return not(perfect) && (proper_divisors_summation.proper_divisors_summation == self)
  end
end

class Integer

  include IntegerExtensions
end
