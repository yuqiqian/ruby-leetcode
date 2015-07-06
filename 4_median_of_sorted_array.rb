# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
	len1, len2 = nums1.length, nums2.length
	if (len1+len2)%2 == 1
		return find_kth_item(nums1, nums2, (len1+len2)/2+1) * 1.0
	else
		return (find_kth_item(nums1, nums2, (len1+len2)/2+1) + find_kth_item(nums1, nums2, (len1+len2)/2) )/2.0
	end
end


def find_kth_item(nums1, nums2, k)
	if nums1.length > nums2.length
		nums1, nums2 = nums2, nums1
	end
	steps1 = ([nums1.length, k].min-1)/2
	steps2 = k-steps1-2

	if nums1.length == 0
		return nums2[k-1]
	elsif k==1
		return [nums1[0], nums2[0]].min
	elsif nums1[steps1] == nums2[steps2]
		return nums1[steps1]
	elsif nums1[steps1] > nums2[steps2]
		return find_kth_item(nums1, nums2[steps2+1..-1], k-steps2-1)
	else
		return find_kth_item(nums1[steps1+1..-1], nums2, k-steps1-1)
	end
end