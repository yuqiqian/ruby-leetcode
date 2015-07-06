# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
class State
	attr_accessor :board, :row, :col, :used_row, :used_col, :used_block
	def initialize(board, row, col, used_row, used_col, used_block)
		@board = board.map{|row| row*1}
		@row = row
		@col = col 
		@used_row = used_row
		@used_col = used_col
		@used_block = used_block
	end
end


def solve_sudoku(board)
	char2int = {"1"=>1, "2"=>2, "3"=>4, "4"=>8, "5"=>16, "6"=>32, "7"=>64, "8"=>128, "9"=>256}
	board_matrix = []

	board.each do |line|
		temp_row = []
		line.each do |char|
			temp_row << (char2int[char].nil? ? 0 : char2int[char])
		end
		board_matrix << temp_row
	end

	stack = []
	used_row, used_col, used_block = [0]*9,[0]*9,[]

	(0..8).each do |i|
		used_row[i] = board_matrix[i].inject(:+)
		used_col[i] = board_matrix.map{|row| row[i]}.inject(:+)
	end

	(0..2).each do |i_block|
		(0..2).each do |j_block|
			used_block << 0
			(0..2).each do |i|
				(0..2).each do |j|
					used_block[-1] = used_block[-1] | board_matrix[i_block*3 + i][j_block*3+j]
				end
			end
		end
	end

	stack << State.new(board_matrix, 0, 0, used_row, used_col, used_block)
	current = nil

	while stack.length != 0
		current = stack.pop
		while current.row != 9 && current.board[current.row][current.col] != 0
			current.col += 1
			if current.col == 9
				current.row += 1
				current.col = 0
			end
		end

		if current.row == 9
			break
		end

		char2int.each do |key, to_add|
			if to_add & current.used_row[current.row] != 0
				next
			end
			if to_add & current.used_col[current.col] != 0
				next
			end
			if to_add & current.used_block[(current.row/3)*3 + current.col/3] != 0
				next
			end
			current.board[current.row][current.col] = to_add
			new_used_row = current.used_row * 1
			new_used_row[current.row] |= to_add
			new_used_col = current.used_col * 1
			new_used_col[current.col] |= to_add
			new_used_block = current.used_block * 1
			new_used_block[(current.row/3)*3 + current.col/3] |= to_add
			stack << State.new(current.board, current.row, current.col, new_used_row, new_used_col, new_used_block)
		end
	end

	board.clear
	int2char = {0=>".", 1=>"1", 2=>'2', 4=>'3', 8=>"4", 16=>"5", 32=>"6", 64=>"7", 128=>"8", 256=>"9"}
	result = current.board.map{|row| row.map{|i| int2char[i] }}
	result.each{|line| board << line}
	return
end