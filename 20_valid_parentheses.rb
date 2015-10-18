def is_valid(s)
	stack = []
	matchingTable = {"("=>")","["=>"]","{"=>"}"}
	s.each_char do |char|
		if char == "(" || char=="[" || char=="{"
			stack.push(char)
		elsif char == ")" || char == "]" || char=="}"
			if stack.length == 0 || char != matchingTable[stack.pop]
				return false
			end
		end
	end
	return stack.length == 0
end