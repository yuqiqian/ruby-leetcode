def simplify_path(path)
	path = path.split("/")
	stack = []
	path.each do |token|
		if token== ""
			next
		elsif token == "."
			next
		elsif token == ".."
			if stack.length != 0
				stack.pop
			else
				next
			end
		else
			stack << token
		end
	end
	"/" + stack.join("/")
end
				
				