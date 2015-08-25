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

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
    pre2ready = Array.new(num_courses) {Array.new(num_courses, 0)}
    in_degree = Array.new(num_courses, 0)
    prerequisites.each do |ready, pre|
        in_degree[ready] += 1 if pre2ready[pre][ready] == 0
        pre2ready[pre][ready] = 1
    end
    que = []
    count = 0
    in_degree.each_with_index do |id, i|
        que << i if id==0
    end
    while !que.empty?
        course = que.shift
        count += 1
        pre2ready[course].each_with_index do |req, ready_course|
            if req != 0
                in_degree[ready_course] -= 1
                que << ready_course if in_degree[ready_course] == 0
            end
        end
    end
    count == num_courses
end