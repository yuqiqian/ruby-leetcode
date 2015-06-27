def generate_matrix(n)
	if n == 0
		return []
	end

	result = Array.new(n){Array.new(n, 0)}

	current = 1
	0.upto(n/2-1) do |layer|
		layer.upto(n-layer-2) do |i|
			result[layer][i] = current
			current += 1
		end

		layer.upto(n-layer-2) do |i|
			result[i][n-layer-1] = current
			current += 1
		end

		(n-layer-1).downto(layer+1) do |i|
			result[n-layer-1][i] = current
			current += 1
		end

		(n-layer-1).downto(layer+1) do |i|
			result[i][layer] = current
			current += 1
		end
	end

	if n%2 == 1
		result[n/2][n/2] = current
	end

	result

end