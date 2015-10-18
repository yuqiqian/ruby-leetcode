# The knows API is already defined for you.
# @param {Integer} person a
# @param {Integer} person b
# @return {Boolean} whether a knows b
# def knows(a, b)

# @param {Integer} n
# @return {Integer}
def find_celebrity(n)
	return n if n<=1
	cand = 0
	(1..n-1).each do |i|
		cand = i if !knows(i, cand)
	end
	(0..n-1).each do |j|
		next if j == cand
		return -1 if !knows(j,cand) || knows(cand, j)
	end
	cand
end