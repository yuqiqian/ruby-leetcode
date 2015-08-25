# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
	dict = {"0"=>"0", "1"=>"1", "6"=>"9", "8"=>"8","9"=>"6"}
	r_num = ""
	num.reverse.each_char do |c|
		binding.pry
		return false if !dict.has_key? c
		r_num << dict[c]
	end
	return r_num == num
end