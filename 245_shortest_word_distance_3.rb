# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_word_distance(words, word1, word2)
	p1 = p2 = -1
	dis = 2**31-1
	words.each_with_index do |w, i|
		if w == word1
			if word1==word2
				dis = i-p1 if p1!= -1 && i-p1 < dis
				p1 = i
			else
				p1 = i
				dis = p1-p2 if p2!=-1 && p1-p2 < dis
			end
		elsif w == word2
			p2 = i
			dis = p2-p1 if p1!= -1 && p2-p1 < dis
		end
	end
	dis
end