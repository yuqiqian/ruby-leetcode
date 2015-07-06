def combination_sum3(k, n)
	res = []
	if k > 0 && n > 0
		ans = []
		helper(res, k, n, ans, 1)
	end
	res
end

def helper(res, k, n, ans, start)
	if n < 0
		return
	end
	if k == ans.length
		if n == 0
			res << ans.clone
			return
		end
	end
	(start..9).each do |j|
		ans << j
		helper(res, k, n-j, ans, j+1)
		ans.pop
	end
end