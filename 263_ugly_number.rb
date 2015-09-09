# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
	return false if num < 1
	ugly_prime = [2,3,5]
	while num != 1
		flag = false
		ugly_prime.each do |u|
			if num%u==0
				num /= u 
				flag = true
			end
		end
		#binding.pry
		return false if !flag
	end
	true
end