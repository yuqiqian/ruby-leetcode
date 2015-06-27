# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
	accessed = Array.new(board.length){Array.new(board[0].length, false)}

	0.upto(board.length-1) do |i|
		0.upto(board[0].length-1) do |j|
			if board[i][j] == word[0]
				accessed[i][j] = true
				res = helper(board, i, j, accessed, word, 1)
				if res
					return true
				end
				accessed[i][j] = false
			end
		end
	end

	false
end


def helper(board, i, j, accessed, word, word_i)
	if word_i == word.length
		return true
	end

	if i != 0 && accessed[i-1][j] == false && board[i-1][j] == word[word_i]
		accessed[i-1][j] = true
		res = helper(board, i-1, j, accessed, word, word_i+1)
		if res
			return true
		end
		accessed[i-1][j] = false
	end

	if i!= board.length-1 && accessed[i+1][j] == false && board[i+1][j] == word[word_i]
		accessed[i+1][j] = true
		res = helper(board, i+1, j, accessed, word, word_i+1)
		if res
			return true
		end
		accessed[i+1][j] = false
	end

	if j!=0 && accessed[i][j-1] == false && board[i][j-1] == word[word_i]
		accessed[i][j-1] = true
		res = helper(board, i, j-1, accessed, word, word_i+1)
		if res
			return true
		end
		accessed[i][j-1] = false
	end

	if j!=board[0].length-1 && accessed[i][j+1] == false && board[i][j+1] == word[word_i]
		accessed[i][j+1] = true
		res = helper(board, i, j+1, accessed, word, word_i+1)
		if res
			return true
		end
		accessed[i][j+1] = false
	end
	false
end
