# @param {Integer} n
# @return {String[]}
def find_strobogrammatic(n)
    dict = {"0"=>"0", "1"=>"1", "6"=>"9", "8"=>"8","9"=>"6"}
    if n > 1
	    res = []
	    prev = helper(n-2, dict)
	    prev.each do |str|
	    	dict.each do |k,v|
	    		next if k=="0"
	    		res << k+str+v
	    	end
	    end
	else
		return helper(n, dict)
	end
    #binding.pry
    res
end

def helper(n, dict)
	if n == 1
		return dict.map{|k,v| k if k==v}.compact
	elsif n == 0
		return [""]
	else	
		prev = helper(n-2, dict)
		res = []
		prev.each do |str|
			dict.each do |k, v|
				#next if k == "0"
				res << k+str+v
			end
		end
		return res
	end
end
	

					
