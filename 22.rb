def generate_parenthesis(n)
	return helper(n,n)
end

def helper(n,m)
	if n==0
		return [")"*m]
	elsif n==m
		paren = []
		helper(n-1, m).each do |i|
			paren << ("("+i)
		end
		return paren
	else
		paren = []
		helper(n-1, m).each do |i|
			paren <<("("+i)
		end
		helper(n,m-1).each do |i|
			paren<<(")"+i)
		end
		return paren
	end
end
		

