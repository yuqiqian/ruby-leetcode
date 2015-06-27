def merge(nums1, m, nums2, n)
	last_1, last_2 = m-1, n-1
	last_2_write = m+n-1

	while last_1!=-1 && last_2!=-1
		if nums1[last_1] >=nums2[last_2]
			nums1[last_2_write] = nums1[last_1]
			last_1 -=1
		else
			nums1[last_2_write] = nums2[last_2]
			last_2 -= 1
		end
		last_2_write -=1
	end

	if last_2 != -1
	    0.upto(last_2) do |i|
	        nums1[i]  = nums2[i] ? nums2[i] : nums1[i]
		end
	end
	return
end