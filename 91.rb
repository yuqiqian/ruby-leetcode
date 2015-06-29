def num_decodings(s)
	if s=="" or s[0] == "0"
		return 0
	end

	ending = [0]*(s.length+1)
	ending[0] = 1

	i = 0
	while i<s.length-1
		if s[i] == "0"
			i+=1
			next
		end

		ending[i+1] += ending[i]

		if s[i] == "1" || (s[i]=="2" && ("0123456".include? s[i+1]))
			ending[i+2] += ending[i]
			if s[i+1] == "0"
				i+=1
			end
		end
		i += 1

	end
	if s[-1] != "0"
		ending[-1] += ending[-2]
	end

	ending[-1]
end
