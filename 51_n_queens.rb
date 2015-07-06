# @param {Integer} n
# @return {String[][]}
class QueenSolution
	attr_accessor :board, :col, :diag_f, :diag_b
	def initialize(board, col, diag_f, diag_b)
		@board = board
		@col = col 
		@diag_f = diag_f
		@diag_b = diag_b
	end

	def to_form
		res = []
		size = @board.length
		@board.each do |i|
			if i== -1
				res << "."*size
			else
				res << ("."*i + "Q" + "."*(size-i-1))
			end
		end
		res
	end
end

def solve_n_queens(n)
	if n==1
		return [["Q"]]
	end
	if n==2 or n==3 
		return []
	end
	result = [QueenSolution.new([-1]*n, 0,0,0)]

	(0..n-1).each do |row|
		temp = []
		result.each do |pre_state|
			(0..n-1).each do |col|
				if (1<< col)&pre_state.col != 0
					next
				end
				diag_f = (1<<(col - row + (n-1)))
				if diag_f & pre_state.diag_f != 0
					next
				end
				diag_b = (1<<(row+col))
				if diag_b & pre_state.diag_b != 0
					next
				end
				pre_state.board[row] = col
				temp << QueenSolution.new(pre_state.board*1, (1<< col)|pre_state.col, diag_f|pre_state.diag_f, diag_b|pre_state.diag_b)
			end
		end
		result = temp
	end
	return result.map{|record| record.to_form}
end