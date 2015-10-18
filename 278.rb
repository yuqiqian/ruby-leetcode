# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
	left, right = 1, n
	while left < right
		mid = (left+right)/2
		if !is_bad_version(mid)
			left = mid+1
		else
			right = mid
		end
	end
	return left
end