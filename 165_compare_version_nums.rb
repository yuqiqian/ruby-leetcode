def compare_version(version1, version2)
	list1 = version1.split(".").map{|ver| ver.to_i}
	while list1.length > 1 && list1[-1] == 0
		list1.pop
	end

	list2 = version2.split(".").map{|ver| ver.to_i}
	while list2.length > 1 && list2[-1] == 0
		list2.pop
	end

	shorter = [list1.length, list2.length].min 
	(0..shorter-1).each do |i|
		if list1[i] > list2[i]
			return 1
		elsif list1[i] < list2[i]
			return -1
		end
	end

	if list1.length != shorter
		return 1
	elsif list2.length != shorter
		return -1
	else
		return 0
	end
end
			
			