def candy(ratings)
	return 0 if ratings.length == 0
	sorted = []
	ratings.each_with_index{|val, i| sorted << [i, val]}
	sorted = sorted.sort_by{|x| x[1]}
	candy_count = [-1] * ratings.length

	sorted.each do |child|
		position = child[0]
		candy = 1
		if position!= 0 && ratings[position-1] < ratings[position]
			candy = [candy, candy_count[position-1]+1].max
		end
		if position!=ratings.length-1 && ratings[position+1] < ratings[position]
			candy = [candy, candy_count[position+1]+1].max
		end
		candy_count[position] = candy
	end
	candy_count.inject(0, :+)
end