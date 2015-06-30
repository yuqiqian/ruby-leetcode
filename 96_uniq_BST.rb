def num_trees(n)
	num_trees = [1,1,2]
	next_try = num_trees.length

	while next_try <= n
		count = 0
		0.upto(next_try) do |center|
			count += num_trees[center] * num_trees[next_try-center-1]
		end
		num_trees << count
		next_try += 1
	end
	
	num_trees[n]
end