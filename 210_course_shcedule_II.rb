def find_order(num_courses, prerequisites)
	degree = [0] * num_courses
	children = Array.new(num_courses){Array.new()}
	prerequisites.each do |pair|
		degree[pair[0]] += 1
		children[pair[1]] << pair[0]
	end

	courses = Array (0..num_courses-1)
	flag = true
	ans = []
	while flag && courses.length != 0
		flag = false
		remove_list = []
		courses.each do |x|
			if degree[x] == 0
				children[x].each do |child|
					degree[child] -= 1
				end
				remove_list << x
				flag = true
			end
		end
		remove_list.each do |x|
			ans << x
			courses = courses - [x]
		end
	end
	courses.length == 0 ? ans : []
end