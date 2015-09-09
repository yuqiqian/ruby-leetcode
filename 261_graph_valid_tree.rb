# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
def valid_tree(n, edges)
	nums = Array.new(n, -1)
	edges.each do |n1, n2|
		x = find(n1, nums)
		y = find(n2, nums)
		return false if x==y
		nums[x] = y
	end
	return edges.length == n-1
end

def find(x, parent)
	return x if parent[x] == -1
	find(parent[x], parent)
end