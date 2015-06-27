
def rotate(matrix)
	mlen = matrix.length
	ilen = mlen/2
	if mlen%2 == 0
		jlen = mlen/2
	else
		jlen = mlen/2+1
	end

	0.upto(ilen-1) do |i|
		0.upto(jlen-1) do |j|
			matrix[i][j], matrix[j][mlen-i-1], matrix[mlen-i-1][mlen-j-1], matrix[mlen-j-1][i] = matrix[mlen-j-1][i], matrix[i][j], matrix[j][mlen-i-1], matrix[mlen-i-1][mlen-j-1]
		end
	end
    return
end