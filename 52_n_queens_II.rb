# @param {Integer} n
# @return {Integer}
class QueenSolution
	attr_accessor :col, :diag_f, :diag_b
	def initialize(col, diag_f, diag_b)
		@col = col
		@diag_f = diag_f
		@diag_b = diag_b
	end
end

def total_n_queens(n)
	return 1 if n==1
	return 0 if n==2 or n==3

	result = [QueenSolution.new(0,0,0)]

	(0..n-1).each do |row|
		temp = []
		result.each do |pre_state|
			(0..n-1).each do |col|
				next if (1<<col)&pre_state.col != 0
				diag_f = (1<<(col-row+(n-1)))
				next if diag_f&pre_state.diag_f != 0
				diag_b = (1<<(col+row))
				next if diag_b&pre_state.diag_b != 0
				temp << QueenSolution.new((1<<col)|pre_state.col, diag_f|pre_state.diag_f, diag_b|pre_state.diag_b)
			end
		end
		result = temp
	end
	return result.length
end