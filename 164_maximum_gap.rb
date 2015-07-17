# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
	distinct_input_len = nums.uniq.length
	return 0 if distinct_input_len < 2
	max_num = nums.max
	min_num = nums.min

	bucket_size = [1, (max_num-min_num+1)/distinct_input_len].max
	bucket_count = (max_num-min_num+1)/bucket_size
	if bucket_count * bucket_size < max_num-min_num+1
		bucket_count += 1
	end
	buckets = Array.new(bucket_count) {[max_num+1, min_num-1] }

	nums.each do |x|
		pos = (x-min_num)/bucket_size
		buckets[pos][0] = [x, buckets[pos][0]].min
		buckets[pos][1] = [x, buckets[pos][1]].max
	end

	max_gap = -1
	curr_bucket = 0
	while curr_bucket < bucket_count
		if buckets[curr_bucket][0] == max_num+1
			curr_bucket += 1
			next
		end

		next_bucket = curr_bucket+1
		while next_bucket < bucket_count && buckets[next_bucket][0] == max_num+1
			next_bucket += 1
		end
		if next_bucket == bucket_count
			break
		else
			max_gap = [max_gap, buckets[next_bucket][0] - buckets[curr_bucket][1]].max
			curr_bucket = next_bucket
		end
	end
	max_gap
end