# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    dict = Hash.new(0)
    s.each_char do |c|
        dict[c] += 1
    end
    t.each_char do |c|
        dict[c] -= 1
    end
    dict.each do |key, value|
        return false if value != 0
    end
    return true
end