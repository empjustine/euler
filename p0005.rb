require 'prime'
require './lib/integer_extensions'

# Smallest multiple
# =================
#
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible (divisible with
# no remainder) by all of the numbers from 1 to 20?
#
# Answer: 232792560

print (2..20).inject(&:least_common_multiple)
