def int_to_roman(num)
   result = "" 
   transTable = {1=>"I", 5=>"V",10=>"X", 50=>"L", 100 =>"C", 500=>"D", 1000 => "M"}
   reverseTable = transTable.sort.reverse
   reverseTable.each do |k,v|
   		while num != 0 && num >= k
   			num -= k
   			#binding.pry
   			result << v
   		end
   		if num == 0
   			break
   		end
   	end

   	simplifyTable = {"DCCCC"=>"CM", "CCCC"=>"CD", "LXXXX"=>"XC", "XXXX"=>"XL", "VIIII"=>"IX", "IIII"=>"IV"}
   	simplifyContent = ["DCCCC", "CCCC", "LXXXX", "XXXX", "VIIII", "IIII"]
   	simplifyContent.each do |item|
   		#binding.pry
   		if result.include? item
   			result = result.sub(item, simplifyTable[item])
   		end
   	end
   	return result
end