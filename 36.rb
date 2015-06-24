def is_valid_sudoku(board)
	char2int = {"."=>0, "1"=>1, "2"=>2, "3"=>4, "4"=>8, "5"=>16, "6"=>32, "7"=>64, "8"=>128, "9"=>256}
	newboard = []
	board.each do |line|
		newline = []
		line.each do |char|
			newline << char2int[char]
		end
		newboard << newline
	end
	board = newboard
	
	#binding.pry
	0.upto(8) do |i|
		sum = 0
		board[i].each do |value|
			if sum & value != 0
				return false
			end
			sum = sum | value
		end
	end

	0.upto(8) do |i|
		sum = 0
		0.upto(8) do |row|
			if sum & board[row][i] != 0
				return false
			end
			sum = sum | board[row][i]
		end
	end

	0.upto(2) do |iblock|
		0.upto(2) do |jblock|
			sum = 0
			0.upto(2) do |i|
				0.upto(2) do |j|
					if sum & board[iblock*3+i][jblock*3+j] != 0
						return false
					end
					sum = sum | board[iblock*3+i][jblock*3+j]
				end
			end
		end
	end

	true
end


