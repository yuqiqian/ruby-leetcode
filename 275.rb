# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
	l = citations.length
	left, right = 0, l-1
	while left <= right
		mid = (left+right)>>1
		return citations[mid] if citations[mid] == l-mid
		if citations[mid] > l-mid
			right = mid - 1
		else
			left = mid+1
		end
	end
	return l-(right+1)
end