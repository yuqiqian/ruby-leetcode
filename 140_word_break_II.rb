# @param {String} s
# @param {Set<String>} word_dict
# @return {String[]}
def word_break(s, word_dict)
    words = []
    len = s.length
    (len-1).downto(0) do |i|
        last = s[i..-1]
        if word_dict.include? last
            if i==0
                words << last
            else
                remain = s[0..i-1]
                remain_words = word_break(remain, word_dict)
                remain_words.each{|item| words << item+" "+last} if !remain_words.empty?
            end

        end

    end
    words
end

# @param {String} s
# @param {Set<String>} word_dict
# @return {String[]}
def word_break(s, word_dict)
    mark = Array.new(s.length) {Array.new()}
    s.length.downto(0) do |stop|
        next if stop<s.length && mark[stop].empty?
        (stop-1).downto(0) do |start|
            if word_dict.include? s[start..stop-1]
                mark[start] << stop
            end
        end
    end
    res = []
    collect(mark,0,s,"",res)
    return res
end

def collect(mark, ind, s, path, res)
    mark[ind].each do |stop|
        sub = s[ind..stop-1]
        new_path = path + ind == 0 ? sub : " "+sub
        if stop==s.length
            res << new_path 
        else
            collect(mark,stop, s,new_path,res)
        end
    end
end
