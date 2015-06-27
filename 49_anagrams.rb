def anagrams(strs)
	records = {}
	strs.each do |str|
		signature = str.split("").sort!.join("")
		bucket = records[signature] ? records[signature] : []
		bucket << str
		records[signature] = bucket
	end

	result = []
	records.each do |k,bucket|
		if bucket.length > 1
			result = result+bucket
		end
	end

	result
end
