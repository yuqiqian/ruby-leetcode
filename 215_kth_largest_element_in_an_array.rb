def find_kth_largest(nums, k)
	pivot = nums.sample
	nums1, nums2 = [], []
	nums.each do |num|
		if num > pivot
			nums1 << num
		elsif
			nums2 << num
		end
	end
	if k <= nums1.length
		return find_kth_largest(nums1, k)
	end
	if k > nums.length - nums2.length
		return find_kth_largest(nums2, k-(nums.length-nums2.length))
	end
	return pivot
end