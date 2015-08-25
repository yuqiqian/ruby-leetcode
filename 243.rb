# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words, word1, word2)
	dict = Hash.new(-1)
	dis = 2^31-1
	words.each_with_index do |w, i| 
		if [word1,word2].include? w
			dict[w] = i
			binding.pry
			if dict[word1]!= -1 && dict[word2]!= -1
				dis = [dis, (dict[word1]-dict[word2]).abs].min 
			end
		end
	end
	dis
end