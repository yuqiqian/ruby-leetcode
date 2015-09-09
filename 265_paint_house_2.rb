# @param {Integer[][]} costs
# @return {Integer}
def min_cost_ii(costs)
    return 0 if costs.empty?
	return costs[0].min if costs.length == 1
    (1..costs.length-1).each do |i|
    	(0..costs[0].length-1).each do |j|
    	    temp = costs[i-1] * 1
    	    temp.delete_at(j)
    		costs[i][j] = temp.min + costs[i][j]
    	end
    end
    return costs[-1].min
end