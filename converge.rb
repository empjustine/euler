# http://spin.atomicobject.com/2011/03/31/enumerating-ruby-lazy-chains/

module Enumerable
  def lazy_select(&block)
    Enumerator.new do |yielder|
      self.each do |element|
        yielder << element if yield(element)
      end
    end
  end

  def lazy_map(&block)
    Enumerator.new do |yielder|
      self.each do |element|
        yielder << yield(element)
      end
    end
  end
end
