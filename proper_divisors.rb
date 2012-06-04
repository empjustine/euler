require './prime_factorization'
require './each_interpolated_slice'
require './summation'
require './lazy_enumerator'

module IntegerExtensions

  def proper_divisors
    factors = prime_factorization.map { |n| [1, n] }
    return [*factors[0]].product(*[*factors[1..-1]]).map { |f|
      f.inject(&:*)
    }.select { |n|
      n != self
    }.uniq.sort
  end
end

class ProperDivisorSummation

  @cache = {}

  class << self

    attr_accessor :cache

    def [](n)

      return @cache[n] ||= n.proper_divisors.to_a.summation
    end

    def upto(n)
      (1..n).map { |k|
        self[k]
      }
    end
  end
end

module IntegerExtensions

  def proper_divisors_summation
    return ProperDivisorSummation[self]
  end

  def perfect
    return self == proper_divisors_summation
  end

  def deficient
    return self < proper_divisors_summation
  end

  def abundant
    return self > proper_divisors_summation
  end
end

class Integer

  include IntegerExtensions
end
