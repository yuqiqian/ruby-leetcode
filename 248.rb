# @param {String} low
# @param {String} high
# @return {Integer}
def strobogrammatic_in_range(low, high)
    return 0 if low.to_i > high.to_i || (low == high && !is_strobogrammatic(low))
    return 1 if low == high && is_strobogrammatic(low)
    dict = {"0"=>"0", "1"=>"1", "6"=>"9", "8"=>"8","9"=>"6"}
    low_s, high_s = low.to_s, high.to_s
    count = Array.new(high_s.length)
    count[0], count[1], count[2] = 3, 4, 12
    if high_s.length > 3
	    (3..count.length-1).each do |i|
	    	count[i] = count[i-2]*5
	    end
	end
    low_count = greater_than(low_s, dict)
    high_count = less_than(high_s, dict)
    #binding.pry
    if low_s.length != high_s.length
	    sum =low_count+high_count
	    if high_s.length > low_s.length+1
	    	(low_s.length..high_s.length-2).each do |i|
	    		sum += count[i]
	    	end
	    end
	else
		sum = low_count + high_count - count[high_s.length-1]
	end
	sum
end

def greater_than(num, dict)
	temp = helper(num.length, dict, num.length).map{|t| t.to_i}.sort!
	count = 0
	num = num.to_i
	temp.each{|t| count += 1 if t>=num}
	count
end

def less_than(num, dict)
	temp = helper(num.length, dict, num.length).map{|t| t.to_i}.sort!
	count = 0
	num = num.to_i
	temp.each{|t| count += 1 if t<=num}
	count
end

def helper(n, dict, bound)
	if n == 1
		return dict.map{|k,v| k if k==v}.compact
	elsif n == 0
		return [""]
	else	
		prev = helper(n-2, dict,bound)
		res = []
		prev.each do |str|
			dict.each do |k, v|
				next if n==bound && k == "0"
				res << k+str+v
			end
		end
		return res
	end
end

def is_strobogrammatic(num)
	dict = {"0"=>"0", "1"=>"1", "6"=>"9", "8"=>"8","9"=>"6"}
	r_num = ""
	num.reverse.each_char do |c|
		return false if !dict.has_key? c
		r_num << dict[c]
	end
	return r_num == num
end