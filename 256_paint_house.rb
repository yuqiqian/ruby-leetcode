# @param {Integer[][]} costs
# @return {Integer}
def min_cost(costs)
	return 0 if costs.nil? || costs.empty?
	(1..costs.length-1).each do |i|
		costs[i][0] += [costs[i-1][1], costs[i-1][2]].min
		costs[i][1] += [costs[i-1][0], costs[i-1][2]].min
		costs[i][2] += [costs[i-1][0], costs[i-1][1]].min
	end
	return costs[-1].min
end