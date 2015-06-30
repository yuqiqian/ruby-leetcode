def read(buf, n)
	read_bytes = 0
	eof = false
	buffer = [""]*4
	while !eof && read_bytes < n
		size = read4(buffer)
		if size < 4
			eof = true
		end
		bytes = [n-read_bytes, size].min
		(0..bytes-1).each  do |i|
			buf[read_bytes+i] = buffer[i]
		end
		read_bytes += bytes
	end

	return read_bytes
end
