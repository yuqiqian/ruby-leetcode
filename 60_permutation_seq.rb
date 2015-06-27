def get_permutation(n, k)
	raise "error" unless n<=9 && n >= 0

	total = 1
	0.upto(n-1){|i| total *= i+1} 
	k = k-1
	raise "error" unless 0<=k && k<total

	result = []
	candidates = Array(1..n)
	remaining = total
	(n).downto(1) do |pos|
		remaining = remaining/pos
		result << candidates[k/remaining]
		candidates.delete(candidates[k/remaining])
		k %= remaining
	end

	result.join("")
end