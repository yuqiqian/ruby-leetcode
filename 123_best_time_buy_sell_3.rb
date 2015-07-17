def max_profit(prices)
	return 0 if prices.length <= 1
	profits = [0] * prices.length
	lowests = prices[0]
	(1..prices.length-1).each do |i|
		lowests = [lowests, prices[i]].min 
		max_profit[i] = [max_profit[i-1], prices[i]-lowests].max
	end
	start = [0]*prices.length
	highest = prices[-1]
	(prices.length-2).downto(0) do |i|
		highest = [highest, prices[i]].max
		start[i] = [start[i+1], highest-prices[i]].max
	end

	max_profit = profits[-1]
	(0..prices.length-1).each do |i|
		p = profits[i] + start[i+1]
		max_profit = [max_profit, p].max
	end
	max_profit
end