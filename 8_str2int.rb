def my_atoi(str)
    max = 2147483647
    min = -2147483648
    index = 0
    result = 0
    sign = 1
    
    if str.length == 0
        return 0
    end
    
    while str[index] == ' ' do
        index += 1
    end
    
    if str[index] == "-"
        sign = -1
        index += 1
    elsif str[index] == "+"
        index += 1
    end
    
    while index < str.length && str[index].ord >= "0".ord && str[index].ord <= "9".ord do
        result = result*10 + (str[index].ord - "0".ord)*sign
        index += 1
        if sign == 1 && result >= max
            return max
        elsif sign == -1 && result <= min
            return min
        end
    end
    return result
end