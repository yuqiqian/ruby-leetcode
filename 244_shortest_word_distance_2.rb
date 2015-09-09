class WordDistance
	def init()
		@dict = Hash.new {|h,k| h[k] = []}
	end

	def word_distance(words)
		words.each_with_index do |w, i|
			@dict[w] << i
		end
	end

	def shortest(word1, word2)
		list1 = @dict[word1]
		list2 = @dict[word2]
		ret = 2**31 - 1
		i = j = 0
		while i < list1.size && j < list2.size
			idx1, idx2 = list1[i], list2[j]
			if idx1 < idx2
				ret = [ret, idx2-idx1].min
				i += 1
			else
				ret = [ret, idx1 - idx1].min
				j += 1
			end
		end
		ret
	end
end
					


