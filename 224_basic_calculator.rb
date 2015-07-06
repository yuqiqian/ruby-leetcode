# @param {String} s
# @return {Integer}
def calculate(s)
	tokens = to_rpn(s)
	return eval_rpn(tokens)
end

def to_rpn(s)
	tokens, stack = [], []
	number = ""
	s.each_char do |c|
		if "0123456789".include?(c)
			number = number + c
		else
			if number.length != 0
				tokens << number
				number = ""
			end
			if "+-*/".include? c
				while stack.length!= 0 && get_priority(stack[-1]) >= get_priority(c)
					tokens << stack.pop
				end
				stack << c
			elsif c == "("
				stack << c
			elsif c == ")"
				while stack.length!= 0 && stack[-1] != "("
					tokens << stack.pop
				end
				stack.pop
			end
		end
	end
	if number.length != 0
		tokens << number
	end
	while stack.length != 0
		tokens << stack.pop
	end
	tokens
end

def eval_rpn(tokens)
	operands = []
	tokens.each do |token|
		if "+-*/".include?(token)
			y, x = operands.pop, operands.pop
			operands << get_val(x, y, token)
		else
			operands << Integer(token)
		end
	end
	operands[0]
end

def get_val(x,y, operator)
    result = 0
	case operator
	when "+" 
	    result =  x+y
	when "-" 
	    result =  x-y
	when "*" 
	    result = x*y
	when "/" 
	    result = x/y
	else
	end
	return result
end

def get_priority(operator)
    result = 0
	case operator
    when "+" 
    	result = 1
    when "-" 
        result = 1
    when "*" 
        result = 2
    when "/" 
        result = 2
    else
	end
	return result
end