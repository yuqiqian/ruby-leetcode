
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    return b if a.nil? || a.empty?
    return a if b.nil? || b.empty?
    a_arr = a.split("")
    b_arr = b.split("")
    i, j = a_arr.length-1, b_arr.length-1
    a_byte, b_byte = 0, 0
    carry = 0
    temp = 0
    result = ""
    while i > -1 || j > -1 || carry == 1
        a_byte = (i>-1)? a_arr[i].to_i : 0
        b_byte = (j > -1)? b_arr[j].to_i : 0
        temp = a_byte ^ b_byte ^ carry
        carry = (a_byte+b_byte+carry) >= 2 ? 1 : 0
        result << temp.to_s
        binding.pry
        i -= 1
        j -= 1
    end
    result.reverse
end