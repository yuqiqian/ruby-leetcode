def my_pow(x, n)
	if n==0
		return 1
	elsif n < 0
		return 1.0/my_pow(x,-n)
	elsif n==1
		return x
	else
		if n%2==0
			return my_pow(x*x, n/2)
		else
			return my_pow(x*x, n/2)*x
		end
	end
end
			
			