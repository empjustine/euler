module ArrayExtensions

    def summation
        return self.inject(&:+)
    end
end

class Array

    include ArrayExtensions
end
