# @param {Integer} n
# @return {Integer}
def num_squares(n)
	sqr = []
	i = 1
	while i*i <= n
		sqr << i*i
		i += 1
	end
	res = []
	return helper(n, sqr, res)
end

def helper(n, sqr, res)
	if n == 0
		return res.length
	else
		min_count = 2**31-1
		sqr.reverse.each do |s|
			next if s > n
			res << s
			#binding.pry
			this_count = helper(n-s, sqr, res)
			res.pop
			min_count = [min_count, this_count].min
			#binding.pry
		end
		return min_count
	end
end

# Above code has LTE
require 'prime'

def num_squares(n)
  n /= 4 while n % 4 == 0
  return 4 if n % 8 == 7
  return 3 if n.prime_division.any? { |p, e| p % 4 == 3 && e.odd? }
  (n**0.5).to_i**2 == n ? 1 : 2
end

