# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    if prices.length <= 1
        return 0 
    else
        k = 2
        mp = 0
        f = Array.new(k+1) {Array.new(prices.length,0)}
        (1..k).each do |kk|
            tmp_max = f[kk-1][0]-prices[0]
            (1..prices.length-1).each do |i|
                f[kk][i] = [f[kk][i-1], prices[i]+tmp_max].max
                tmp_max = [tmp_max, f[kk-1][i]-prices[i]].max
                mp = [mp, f[kk][i]].max
            end
        end
    end
    binding.pry
    mp
end