# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
	change = (0..gas.length-1).map{|i| gas[i]-cost[i]}
	change = change + change

	start = 0
	while start < gas.length
		left = 0
		station = 0

		while station < gas.length
			left += change[start+station]
			if left < 0
				break
			end
			station += 1
		end
		if station >= gas.length
			return start
		end

		start += station +1
	end
	return -1
end
