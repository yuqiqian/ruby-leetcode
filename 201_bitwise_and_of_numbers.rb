def range_bitwise_and(m, n)
	p = 0
	while m!= n
		m >>= 1
		n >>= 1
		p += 1
	end
	m << p
end