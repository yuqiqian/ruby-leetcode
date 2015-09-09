# @param {String} s
# @return {Integer}
def calculate(s)
    stack = []
    res, number, sign = 0,0,1
    (0..s.length-1).each do |i|
        c = s[i]
        if is_number?(c)
            number = 10 * number + c.to_i
        elsif c=="+"
            res += sign * number
            number = 0
            sign = 1
        elsif c=="-"
            res += sign * number
            number = 0
            sign = -1
        elsif c=="("
            stack << res
            stack << sign
            sign = 1
            res = 0
        elsif c == ")"
            res += sign * number
            number = 0
            res *= stack.pop
            res += stack.pop
        end
    end
    res += sign*number if number!=0
    res
end

def is_number?(str)
    true if Float(str) rescue false
end



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


# @param {String} s
# @return {Integer}
def calculate(s)
	stack = []
	result, number, sign = 0, 0, 1
	(0..s.length-1).each do |i|
		c = s[i]
		if "0123456789".include?(c)
			number = 10*number + c.ord-"0".ord
		elsif c == "+"
			result += sign * number
			number = 0
			sign = 1
		elsif c =="-"
			result += sign * number
			number = 0
			sign = -1
		elsif c == "("
			stack << result
			stack << sign
			sign = 1
			result = 0
		elsif c == ")"
			result += sign * number
			number = 0
			result *= stack.pop
			result += stack.pop
		end
	end
	result += sign* number if number!= 0
	result
end

				
				
				
