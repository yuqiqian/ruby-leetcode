# @param {Integer[]} preorder
# @return {Boolean}
def verify_preorder(preorder)
	low = 0-2**31
	path = []
	preorder.each do |p|
		return false if p < low
		while !path.empty? && p>path.last
			low = path.pop
		end
		path << p
	end
	true
end
