def min_distance(word1, word2)
	del_cost = ins_cost = sub_cost = 1
	steps = Array(0..word1.length)
	(0..word2.length-1).each do |word2_i|
		diag = steps[0]
		steps[0] += 1
		(0..word1.length-1).each do |word1_i|
			temp = steps[word1_i+1]
			if word1[word1_i] == word2[word2_i]
				steps[word1_i+1] = diag
			else
				steps[word1_i+1] = [steps[word1_i+1]+ins_cost, steps[word1_i]+del_cost, diag+sub_cost].min
			end
			diag = temp
		end
	end
	steps[-1]
end

