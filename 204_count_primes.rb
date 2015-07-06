# @param {Integer} n
# @return {Integer}
def count_primes(n)
	is_prime = [1]*[n,2].max
	is_prime[0] = is_prime[1] = 0
	x = 2
	while x*x < n
		if is_prime[x] == 1
			p = x*x
			while p < n
				is_prime[p] = 0
				p += x
			end
		end
		x += 1
	end
	is_prime.inject(0, :+)
end