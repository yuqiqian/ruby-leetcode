# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
	require "set"
	return false if s1.length+s2.length != s3.length
	char_dis = Hash.new(0)
	s1.each_char{|char| char_dis[char] += 1}
	s2.each_char{|char| char_dis[char] += 1}
	s3.each_char{|char| char_dis[char] -= 1}
	char_dis.each{|k, v| return false if v != 0}
	return helper(s1, 0, s2, 0, s3, 0, Set.new())
end

def helper(s1, i, s2, j, s3, k, accessed)
	if accessed.include? [i,j]
		return false
	else
		accessed << [i,j]
	end

	if k == s3.length
		return true
	end

	if i != s1.length && s1[i] == s3[k]
		if helper(s1, i+1, s2, j, s3, k+1, accessed)
			return true
		end
	end

	if j != s2.length && s2[j] == s3[k]
		if helper(s1, i, s2, j+1, s3, k+1, accessed)
			return true
		end
	end
	false
end
# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
	require "set"
	return false if s1.length+s2.length != s3.length
	char_dis = Hash.new(0)
	s1.each_char{|char| char_dis[char] += 1}
	s2.each_char{|char| char_dis[char] += 1}
	s3.each_char{|char| char_dis[char] -= 1}
	char_dis.each{|k, v| return false if v != 0}
	return helper(s1, 0, s2, 0, s3, 0, Set.new())
end

def helper(s1, i, s2, j, s3, k, accessed)
	if accessed.include? [i,j]
		return false
	else
		accessed << [i,j]
	end

	if k == s3.length
		return true
	end

	if i != s1.length && s1[i] == s3[k]
		if helper(s1, i+1, s2, j, s3, k+1, accessed)
			return true
		end
	end

	if j != s2.length && s2[j] == s3[k]
		if helper(s1, i, s2, j+1, s3, k+1, accessed)
			return true
		end
	end
	false
end
