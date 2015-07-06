def calculate(s)
	expression = s.delete(" ").scan(/\d+|\D+/)
	total = d = idx = 0
	func = "+"
	while idx < expression.length
		e = expression[idx]
		if "+-".include?(e)
			total = cal(total, d, func)
			func = e
		elsif "*/".include?(e)
			idx += 1
			d = cal(d, Integer(expression[idx]), e)
		else
			d = Integer(e)
		end
		idx += 1
	end
	return cal(total, d, func)
end

def cal(op1, op2, func)
	case func
	when "+"
		return op1 + op2
	when "-"
		return op1 - op2
	when "*"
		return op1 * op2
	when "/"
		return op1 / op2
	end
end
			

