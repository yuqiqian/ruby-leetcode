def my_atoi(str)
    max = 2147483647
    min = -2147483648
    i = 0
    result = 0
    symbol = 1

    if str.length == 0
        return 0
    end

    while str[i] == " " do 
        i+=1
    end

    if str[i] == "-" 
        symbol = -1
         i += 1
    elsif str[i] == "+"
        symbol = 1
         i += 1
    elsif "0".ord > str[i].ord || str[i].ord > "9".ord
        return 0
    end
   
    #binding.pry
    while str[i]!=nil && "0".ord <= str[i].ord && str[i].ord <= "9".ord do
        result = result*10 + str[i].ord - "0".ord
        i += 1
        #binding.pry
    end
    result = result*symbol
    if  result < min
        return min
    elsif result > max
        return max
    else
        return result
    end
        
end