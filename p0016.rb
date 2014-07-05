# Power digit sum
# ===============
#
# 2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2¹⁰⁰⁰?

print (2**1000).to_s.each_char.map(&:to_i).inject(&:+)
