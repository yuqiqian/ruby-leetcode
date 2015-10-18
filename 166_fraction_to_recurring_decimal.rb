# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(n, d)
	return "0" if n.zero?
	res = ""
	res << "-" if (n<0 && d>0) || (n>0 && d<0)
	n = n.abs
	d = d.abs
	res += (n/d).to_s
	return res if n%d == 0
	res << "."
	dict =Hash.new(-1)
	r = n%d
	while !r.zero?
		if dict[r] >= 0
			res.insert(dict[r],'(')
			res << ")"
			break
		end
		dict[r] = res.size
		r *= 10
		res << (r/d).to_s
		r %= d
	end
	res
end