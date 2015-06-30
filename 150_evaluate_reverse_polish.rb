# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens, method = "Ite")
	if method == "Ite"
		return eval_rpn_ite(tokens)
	elsif method = rec
		return eval_rpn_rec(tokens)
	else
		raise "Invalid method"
	end
end

def eval_rpn_ite(tokens)
	waiting = []
	while tokens.length != 0
		token = tokens.pop
		if !"+-*/".include? token
			token = token.to_i
			while waiting.length != 0 && waiting[-1].is_a?(Integer)
				other_operand = waiting.pop
				operator = waiting.pop
				case operator
					when "+"
						token += other_operand
					when "-"
						token -= other_operand
					when "*"
						token *= other_operand
					when "/"
						if (token > 0 && other_operand > 0) || (token < 0 && other_operand < 0)
							token = token.abs / other_operand.abs
						else
							token = -(token.abs / other_operand.abs)
						end
					else
						raise "Unknown Token"
				end
			end
			waiting << token
		else
			waiting << token
		end
	end
	waiting[-1]
end

def eval_rpn_rec(tokens)
	token = tokens.pop
	if !"+-*/".include? token
		return token.to_i
	else
		second_parameter = eval_rpn_rec(tokens)
		first_parameter = eval_rpn_rec(tokens)

		case token
		when "+"
			return first_parameter + second_parameter
		when "-"
			return first_parameter - second_parameter
		when "*"
			return first_parameter * second_parameter
		when "/"
			if second_parameter == 0
				raise "Zero Division Error"
			elsif first_parameter > 0 && second_parameter > 0
				return first_parameter/second_parameter
			elsif first_parameter < 0 && second_parameter < 0
				return (-first_parameter)/(-second_parameter)
			elsif first_parameter > 0 && second_parameter < 0
				return  -(first_parameter/(-second_parameter))
			else
				return -((-first_parameter)/second_parameter)
			end
		else
			raise "Unknown Token"
		end
	end
end