def plausible(str)
    dict = []
    return dict[str]
end

def p_recur(str, arr = nil, prev_i = 1)
    arr = Array.new(str.length, nil) if arr.nil?
    return 0 if str.empty?
    max_p, max_i = 0-2**31, nil
    (str.length-prev_i).downto(0) do |i|
        if arr[i].nil?
            p_recur(str, arr, i)
        end
        if max_p < arr[i]+plausible(str[i+1..-1])
            max_p, max_i = arr[i]+plausible(str[i+1..-1]), i
        end
    end
    return max_p
end

def p_iter(str)
    arr = Array.new(str.length, nil)
    max_p = 0-2**31
    (0..str.length-1).each do |i|
        if i == 0
            arr[i] = plausible(str[i])
        else
            (0..i-1).each do |j|
                max_p = [max_p, arr[j]].max
            end
            arr[i] = max_p + plausible(str[j+1..i])
        end
    end
    return arr[-1]
end

