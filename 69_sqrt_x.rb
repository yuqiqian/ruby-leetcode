def my_sqrt(x)
	front, back = 0, x
	while front <= back
		mid = (front+back)/2
		temp = mid*mid
		if temp == x
			return mid
		elsif temp < x
			front = mid+1
		else
			back = mid -1
		end
	end
	back
end


