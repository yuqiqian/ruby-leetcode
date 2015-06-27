def climb_stairs(n)
	steps = [1,1]
	while steps.length < n+1
		steps << (steps[-1] + steps[-2])
	end
	steps[n]
end