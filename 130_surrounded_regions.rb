# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
	if board.length == 0
		return
	end

	to_keep = Array.new(board.length){Array.new(board[0].length, false)}

	layer = []

	(0..board[0].length-1).each do |column|
		if board[0][column] == "O"
			to_keep[0][column] = true
			layer << [0, column]
		end
		if board[-1][column] == "O"
			to_keep[-1][column] = true
			layer << [board.length-1, column]
		end
	end

	(0..board.length-1).each do |row|
		if board[row][0] == "O"
			to_keep[row][0] =true
			layer << [row, 0]
		end
		if board[row][-1] == "O"
			to_keep[row][-1] = true
			layer <<[row, board[0].length-1]
		end
	end

	while layer.length != 0
		temp = []
		layer.each do |kept|
			if kept[0] != 0 && board[kept[0]-1][kept[1]] == "O" && to_keep[kept[0]-1][kept[1]] == false
				to_keep[kept[0]-1][kept[1]] = true
				temp << [kept[0]-1, kept[1]]
			end

			if kept[0] != board.length-1 && board[kept[0]+1][kept[1]] == "O" && to_keep[kept[0]+1][kept[1]]==false
				to_keep[kept[0]+1][kept[1]] = true
				temp <<[kept[0]+1,kept[1]]
			end

			if kept[1]!=0 && board[kept[0]][kept[1]-1] == "O" && to_keep[kept[0]][kept[1]-1] == false
				to_keep[kept[0]][kept[1]-1] = true
				temp << [kept[0], kept[1]-1]
			end

			if kept[1]!= board[0].length-1 && board[kept[0]][kept[1]+1] == "O" && to_keep[kept[0]][kept[1]+1] == false
				to_keep[kept[0]][kept[1]+1] = true
				temp << [kept[0], kept[1]+1]
			end
		end
		layer = temp
	end

	(0..board.length-1).each do |row|
		(0..board[0].length-1).each do |col|
			if board[row][col] == "X"
				next
			end
			if to_keep[row][col] == false
				board[row][col] = "X"
			end
		end
	end
	return		
end