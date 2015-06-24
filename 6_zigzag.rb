#require 'pry'
def convert(s, num_rows)
    if num_rows == 1
        return s
    end
    
    cache = []
    0.upto(num_rows-1) do |i|
        cache << [s[i]]
    end
    position = num_rows-2
    direction = position == 0 ? 1 : -1
    #binding.pry
    if s[num_rows..-1]
    s[num_rows..-1].each_char do |char|
        cache[position] << char
        if position == 0
            direction = 1
        elsif position == num_rows-1
            direction = -1
        end
        #binding.pry
        position += direction
    end
    end
    #binding.pry
    return cache.join("")
           
end