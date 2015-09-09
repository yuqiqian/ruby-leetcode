# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
	ugly = Array.new(n)
	ugly[0] = 1
	index2, index3, index5 = 0, 0, 0
	factor2, factor3, factor5 =2, 3, 5
	(1..n-1).each do |i|
		min = [factor5, factor2, factor3].min
		ugly[i] = min
		#binding.pry
		if factor2 == min
			index2+=1
			factor2 = 2*ugly[index2]
		end
		if factor3 == min
			index3 += 1
			factor3 = 3 * ugly[index3]
		end
		if factor5 == min
			index5 += 1
			factor5 = 5 * ugly[index5]
		end
		
	end	
	ugly[-1]
end