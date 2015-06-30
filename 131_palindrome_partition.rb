# @param {String} s
# @return {String[][]}
def partition(s)
	if s.length == 0
		return []
	elsif s.length == 1
		return[[s]]
	end

	result = []
	if is_palindrome(s)
		result << [s]
	end

	(1..s.length-1).each do |i|
		head = s[0..i-1]
		if !is_palindrome(head)
			next
		end
		tail_partition = partition(s[i..-1])
		tail_partition.each{|item| result.concat [[head]+item]}
	end
	return result
end

def is_palindrome(s)
	head, tail = 0, s.length-1
	while head < tail
		if s[head]!=s[tail]
			return false
		else
			head += 1
			tail -=1
		end		
	end
	true
end
