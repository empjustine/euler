class FiniteArithmeticProgression
    
    attr_accessor :begin, :end, :step
    
    def self.begin_end_step(_begin, _end, _step)

        ap = FiniteArithmeticProgression.new
        ap.begin = _begin
        ap.end   = _end
        ap.step  = _step

        return ap
    end

    def summation_of_multiples

        floor = @begin + (@begin  % @step)
        ceiling = @end - (@end % @step)
        count = (ceiling - floor) / @step + 1
        return gauss_summation = (floor + ceiling) * count / 2
    end
end

