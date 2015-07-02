def read(buf, n)
    empty = [""]*4
    read = 0
    eof = false
    while !eof && read < n
        this_read = read4(buf)
        if this_read < 4
            eof = true
        end
        byte = [m-read, this_read].min
        (0..byte-1).each do |i|
            buf[read + i] = empty[i]
        end
        read += i
    end
    read
end