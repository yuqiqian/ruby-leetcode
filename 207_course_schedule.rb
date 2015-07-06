def can_finish(num_courses, prerequisites)
	degrees = [0] * num_courses
	children = Array.new(num_courses){Array.new()}
	prerequisites.each do |pair|
		degrees[pair[0]] += 1
		children[pair[1]] << pair[0]
	end
	courses = Array(0..num_courses-1)
	flag = true
	while flag && courses.length != 0
		flag = false
		remove_list = []
		courses.each do |x|
			if degrees[x] == 0
				children[x].each do |child|
					degrees[child]-= 1
				end
				remove_list << x
				flag = true
			end
		end
		remove_list.each do |x|
			courses = courses - [x]
		end
	end
	courses.length == 0
end
