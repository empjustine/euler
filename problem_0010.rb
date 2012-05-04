require './prime'

num = Prime.upto(2000000).inject(&:+)
puts num
