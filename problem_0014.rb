require './collatz_chain'

while CollatzChain.current_chain < 1_000_001
    CollatzChain._consequent
end

num = (1..1_000_000).map { |k|
   CollatzChain[k][0..1]
}.sort { |a, b|
    b[1] <=> a[1]
}[0][0]
puts num
