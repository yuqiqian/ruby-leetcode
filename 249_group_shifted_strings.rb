# @param {String[]} strings
# @return {String[][]}
def group_strings(strings)
	 res = []
	 map = Hash.new()
	 strings.each do |str|
	 	offset = str[0].ord-"a".ord
	 	key = ""
	 	(0..str.length-1).each do |i|
	 		c = str[i].ord-offset > "a".ord ? (str[i].ord-offset).chr : (str[i].ord-offset + 26).chr
	 		key << c
	 	end

	 	if !map.has_key? key
	 		list = []
	 		map[key] = list
	 	end
	 	map[key] << str
	 end

	 map.each do |key, list|
	 	res << list.sort
	 end

	 res

end