def maxDifference(prices)
  return 0 if prices.empty?
  max_profit = 0
  min_price = prices[0]
  prices.each do |p|
      if p < min_price
          min_price = p
      else
          if p-min_price > max_profit
              max_profit = p - min_price
          end
      end
  end
  max_profit
end