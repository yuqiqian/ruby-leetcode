=begin
# @param {String} s
# @return {String[]}
def generate_palindromes(s)
	return [] if s.nil? || s.empty?
	cand = Hash.new(0)
	s.each_char{|c| cand[c]+=1} 
	res = []
	helper(res, cand, "")
	res
end

def helper(res, cand, temp)
	if cand.empty?
		res << temp * 1
		return
	end

	cand.each do |k, count|
		if count == 1
			if temp.empty?
				temp << k
				new_cand = cand.clone
				new_cand.delete(k)
				helper(res, new_cand, temp)
				temp = ""
			else
				next
			end
		else
			new_cand = cand.clone
			new_cand[k] -= 2
			new_cand.delete(k) if new_cand[k] == 0
			temp = k + temp + k
			binding.pry
			helper(res, new_cand, temp)
			temp = temp[1..-2]
		end
	end
end
=end


# Above code has LTE Problem
# @param {String} s
# @return {String[]}
def generate_palindromes(s)
	mp = Hash.new(0)
	result =[]
	res_string = ""
	s.each_char{|c| mp[c] += 1}
	odd = 0
	mp.each do |k, count|
		if count%2 == 1
			odd += 1
			return result if odd == 2
			res_string << k
		end
	end
	dfs(result, res_string,mp, odd)
	result
end

def dfs(result, res_string, mp, odd)
	add = true
	mp.each do |k, count|
		if count > 1
			add = false
			mp[k] -= 2
			res_string << k
			
			dfs(result, res_string*1, mp, odd)
			res_string = res_string[0..-2]
			binding.pry
			mp[k] += 2
		end
	end
	if add
		#binding.pry
		t = res_string[odd..-1]
		result << t.reverse+res_string
	end
end

