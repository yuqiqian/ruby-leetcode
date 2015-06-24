def longest_palindrome(s)
    if s==nil || s.length == 1 || s.length == 0
        return s
    end
    startIndex=0 
    len = 0
    0.upto(s.length-1) do |i|
        if s[i]==s[i+1]
            sI = i
            eI = i+1
            startIndex, len = search(s,sI,eI,len,startIndex)
        end
        sI = i
        eI = i
        startIndex, len = search(s,sI,eI,len,startIndex)
    end
    return s[startIndex..(startIndex+len-1)]
end

def search(s,sI,eI,len,startIndex)
    step = 1
    while (sI-step>=0) && (eI+step)<s.size() do
        if s[sI-step] != s[eI+step]
            break
        end
        step+=1
    end
    
    wid = eI-sI+2*step-1
    if wid > len
        len = wid
        startIndex = sI-step+1
    end
    return startIndex, len
end
