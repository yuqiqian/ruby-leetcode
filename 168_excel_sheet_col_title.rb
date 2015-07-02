# @param {Integer} n
# @return {String}
def convert_to_title(n)
	 result = []
	 while n!= 0
	 	n -= 1
	 	result<< ("A".ord + n%26).chr
	 	n /= 26
	 end

	 return result.reverse.join("")
end