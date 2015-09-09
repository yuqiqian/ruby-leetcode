# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
	len = prices.length
	return 0 if len < 2
	mp = 0
	if k>= len/2
		(1..len-1).each do |i|
			mp += [0, prices[i]-prices[i-1]].max
		end
		return mp
	end

	t = Array.new(k+1){Array.new(len,0)}
	(1..k).each do |i|
		temp_max = -prices[0]
		(1..len-1).each do |j|
			t[i][j] = [ t[i][j-1], prices[j] + temp_max].max
			temp_max = [temp_max, t[i-1][j-1]-prices[j]].max
		end
	end
	return t[k][len-1]
end
