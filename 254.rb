# @param {Integer} n
# @return {Integer[][]}
def get_factors(n)
	res = helper(n)
	return res 
end

def helper(n)
	return [] if n <= 3
	res = []
	sqrt = Math.sqrt(n).to_i
	(2..sqrt).each do |fac|
		if n%fac == 0
			res << [fac, n/fac] 
			combs = helper(n/fac)
			combs.each do |c|
				new_comb = [fac].concat(c).sort
				res <<  new_comb if !c.nil? && !res.include?(new_comb)
			end
		end
	end
	return res
end