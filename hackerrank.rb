# Stair Case
# Enter your code here. Read input from STDIN. Print output to STDOUT
def stair_case(n)
  (1..n).each do |i|
    puts " "*(n-i) + "#"*i
  end
end

n = gets.to_i
stair_case(n)

#Extra Long Factorials
n = gets.to_i
arr = Array(1..n)
puts arr.inject(:*)

#Pangrams
def pangrams(str)
  dict = Array.new(26, 0)
  str.each_char do |c|
    next if c.ord < "a".ord || c.ord > "z".ord
    idx = c.ord-"a".ord
    dict[idx] += 1
  end
  dict.each do |count|
    if count == 0
      puts "not pangram"
      return
    end
  end
  puts "pangram"
end

str = gets.strip.split(" ").join.downcase
pangram(str)

#GOT I

string = gets.chomp 
dict = Hash.new(0)
string.each_char do |c|
  dict[c] += 1
end
flag = false
found = 1
dict.each do |c, count|
  next if count%2 == 0
  if flag
    found = 0
  else
    flag = true
  end
end
# Assign found a value of 1 or 0 depending on whether or not you found what you were looking for.

if found == 1
    puts "YES"
else
    puts "NO"
end

#Stock
def max_profit(prices)
  return 0 if prices.empty?
  max_profit = 0
  min_price = prices[0]
  prices.each do |p|
    max_profit = [max_profit, p-min_price].max
    min_price = [min_price, p].min 
  end
  puts max_profit
end

prices = gets.strip.split(" ").map!{|s| s.to_i}
max_profit(prices)