# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
	return 0 if citations.empty?
	citations.sort!
	l = citations.length
	(0..l-1).each do |i|
		return l-i if citations[i] >= l-i
	end
	return 0
end