def compute_area(a, b, c, d, e, f, g, h)
	sums = (c-a)*(d-b) + (g-e)*(h-f)
	return sums - [[c, g].min - [a, e].max, 0].max * [0, [d,h].min-[b,f].max].max
end