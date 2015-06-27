def unique_paths(m, n)
	result = 1
	total = m+n-2
	chosen = ([m,n].min)-1
	total.downto(total-chosen+1){|i| result *= i}
	0.upto(chosen-1){|i| result /= i+1}

	result
end