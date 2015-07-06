def is_match(s, p)
    return match(s, compile(p))
end

def compile(p)
    result =""
    while p.length != 0
        if p.length >= 2 && p[1] == "*"
            if result.length < 2 || result[-1] != "*"
                result = result + p[0..1]
            elsif result[-2] == p[0] || result[-2] == "."
            elsif p[0] == "."
                while result.length >= 2 && result[-1] == "*"
                    result = result[0..-3]
                end
                result = result + p[0..1]
            else
                result = result + p[0..1]
            end
            p = p[2..-1]
        else
            result = result+p[0]
            p = p[1..-1]
        end
    end
    result
end

def match(s, p)
    if s.length == 0 && p.length == 0
        return true
    elsif p.length == 0
        return false
    elsif p.length >= 2 && p[1] == "*"
        return match_start(s, p[2..-1], p[0])
    elsif s.length == 0
        return false
    elsif s[0] == p[0] || p[0] == "."
        return match(s[1..-1], p[1..-1])
    else
        return false
    end
end

def match_start(s, p, ch)
    while true
        if match(s, p)
            return true
        elsif s.length == 0
            return false
        elsif s[0] == ch || ch == "."
            s = s[1..-1]
        else
            return false
        end
    end
end     