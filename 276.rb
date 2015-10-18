# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def num_ways(n, k)
	return 0 if n == 0
	return k if n == 1
	same = k
	not_same = k*(k-1)
	(n-2).times do 
		new_same = not_same
		not_same = (same+not_same)*(k-1)
		same = new_same
	end
	return same+not_same
end