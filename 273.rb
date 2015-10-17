# @param {Integer} num
# @return {String}
def number_to_words(num)
	ret = ""
	strarr = ["Thousand","Million","Billion"]
	ret = hundred_str(num%1000)
	(0..2).each do |i|
		num/=1000
		ret = num%1000!=0 ? hundred_str(num%1000) + " " + strarr[i] + " " + ret : ret
		#binding.pry
	end
	while ret[-1] == " "
		ret = ret[0..-2]
	end
	return ret.empty? ? "Zero" : ret
end

def hundred_str(num)	
	arr1 = ["","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten", "Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
	arr2 = ["","","Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety"]
	ret = num%100<20 ? arr1[num%100] : arr2[(num%100)/10] + (num%10!=0 ? " " + arr1[num%10] : "")
	if num>99
		ret = arr1[num/100] + " Hundred" + (num%100!=0 ? " " + ret : "")
	end
	#binding.pry
	return ret
end
