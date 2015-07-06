class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def convert_array_trees(array)
	result = []
	0.upto(array.length-1){|i|result << TreeNode.new(i+1)}
	root = nil
	binding.pry
	0.upto(array.length-1) do |i|
		if array[i] == -1
			root = result[i]
		else
			if array[i] > i
				result[array[i]].left = result[i]
			else
				result[array[i]].right = result[i]
			end
		end
	end
	root
end

def generate_array(array, current, left, right)
	result =[]
	result_temp = []
	if left >= current && current >= right
		return [array]
	end

	if left >= current
		result_temp = [array]
	else
		left.upto(current-1) do |son|
			temp = array * 1
			temp[son] = current
			result_temp = result_temp + generate_array(temp, son, left, current-1)
		end
	end

	if current >=right
		result = result_temp
	else
		result_temp.each do |temp_status|
			(current+1).upto(right) do |son|
				temp = temp_status * 1
				temp[son] = current
				result = result + generate_array(temp, son, current+1, right)
			end
		end
	end
	result
end

def generate_trees(n)
	if n == 0
		return [nil]
	end

	result = []
	0.upto(n-1) do |root|
		temp = [-1]*n
		temp_res = generate_array(temp, root, 0, n-1)
		result = result + temp_res
	end

	[result.each{|array|convert_array_trees(array)}]
end

