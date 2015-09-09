# @param {String} s
# @return {Boolean}
def can_permute_palindrome(s)
	x = s.chars.map{|c| 1 << c.ord}.reduce(0, :^)
	x & x-1 == 0
end