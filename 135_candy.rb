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

# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
    len = ratings.length
    return 0 if len == 0
    return 1 if len == 1
    candy = Array.new(len,1)
    (1..len-1).each do |i|
        if ratings[i] > ratings[i-1]
            candy[i] = candy[i-1] + 1
        else
            candy[i] = 1
        end
    end
    (len-2).downto(0) do |i|
        if ratings[i] > ratings[i+1]
            candy[i] = [candy[i+1]+1, candy[i]].max
        end
    end
    candy.inject(:+)             
end