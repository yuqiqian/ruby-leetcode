# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
    solutions = []
    helper(s, solutions, 0, "", 0)
    return solutions
end

def helper(ip, solutions, i, stored, count)
    #binding.pry
    return  if count > 4
    solutions << stored if (count == 4 && i == ip.length)
    (0..2).each do |j|
        #binding.pry
        break if (i+j) > ip.length
        s = ip[i..i+j]
        next if ((s.size > 1 && s[0] == "0") || (j==2 && s.to_i > 255))
        #binding.pry
        helper(ip, solutions, i+j+1, stored+s+(count==3 ? "" : "."), count+1)
    end
end
        
