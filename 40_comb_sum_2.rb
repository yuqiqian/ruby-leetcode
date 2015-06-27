def combination_sum2(candidates, target)
	candidates.sort!
	cand = []
	res = []
	combination_sum_helper(candidates, cand, target, res)
	res
end

def combination_sum_helper(candidates, cand, target, res)
	if target < 0
		return
	elsif target == 0
		res.push(Array.new(cand))
	else
		prev = nil
		candidates.each_with_index do |c, i|
			if i == 0
				prev = c 
			elsif prev == c
				next
			else
				prev = c
			end
			cand.push(c)
			combination_sum_helper(candidates[i+1..-1],cand,target-c, res)
			cand.pop
		end
	end
end

				
		