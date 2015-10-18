# Encodes a list of strings to a single string.
#
# @param {string[]} strs
# @return {string}
def encode(strs)
	res = ""
	strs.each_with_index do |str|
		res << str.length.to_s << "$" << str
	end
	res
end

# Decodes a single string to a list of strings.
#
# @param {string} s
# @return {string[]}
def decode(s)
    i = 0
    res = []
    while i < s.length
    	div = s[i..-1].index("$")
    	count = s[i..i+div-1].to_i
    	start_pos = i+div+1
    	res << s[start_pos..start_pos+count-1]
    	binding.pry
    	i  = start_pos+count
    end
    res
end


# Your functions will be called as such:
# decode(encode(strs))