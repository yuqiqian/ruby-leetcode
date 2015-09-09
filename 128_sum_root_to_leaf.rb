# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
    nums.uniq!
    return 1 if nums.length == 1
	seg = {}
	rev_seg = {}
	nums.each do |item|
		if seg.has_key?(item) && rev_seg.has_key?(item)
			new_end = seg[item]
			seg.delete(item)
			
			new_begin = rev_seg[item]
			rev_seg.delete(item)
			
			seg[new_begin-1] = new_end
			rev_seg[new_end+1] = new_begin
		elsif seg.has_key? item
			old_end = seg[item]
			seg.delete(item)
			seg[item-1] = old_end
			rev_seg[old_end+1] = item
		elsif rev_seg.has_key? item
			old_begin = rev_seg[item]
			rev_seg.delete(item)

			seg[old_begin-1] = item
			rev_seg[item+1] = old_begin
		else
			seg[item-1] = item
			rev_seg[item+1] = item
		end
	end

	max_len = 0
	seg.each do |seg_begin, seg_end|
		max_len = [max_len, seg_end-seg_begin].max
	end
	max_len
end
				