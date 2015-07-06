def is_isomorphic(s, t)
	source_map = {}
	target_map = {}
	(0..s.length-1).each do |x|
		source, target = source_map[t[x]], target_map[s[x]]
		if source.nil? && target.nil?
			source_map[t[x]], target_map[s[x]] = s[x], t[x]
		elsif target != t[x] || source != s[x]
			return false
		end
	end
	true
end
			