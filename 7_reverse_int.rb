# @param {Integer} x
# @return {Integer}
def reverse(x)
    if x < 0
        sym = "-"
        x = -x
    else
        sym = ""
    end
    x = x.to_s
    x = x+sym 
    temp = Array.new(x.length)
    index = x.length-1
    x.each_char do |char|
        temp[index] = char
        index -= 1
    end
    result = temp.join("").to_i
    if result >= -2147483648 && result <= 2147483648
        return result 
    else
        return 0
    end
    
end