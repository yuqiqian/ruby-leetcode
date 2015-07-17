class Solution
	def initialize
		@buf_size, @offest = 0, 0
		@buffer = [nil]*4
	end

	def read(buf, n)
		read_bytes = 0
		eof = false
		while !eof && read_bytes < n
			if @buf_size == 0
				size = read4(@buffer)
			else
				size = @buf_size
			end
			if @buf_size == 0 && size < 4
				eof = true
			end
			bytes = [n-read_bytes, size].min
			(0..bytes-1).each do |i|
				buf[read_bytes+i] = @buffer[offest+i]
			end
			@offest = (@offest+bytes)%4
			@buf_size = size-bytes
			read_bytes += bytes
		end
		return read_bytes
	end
end

def read4(buf)
	file_content = ""
	i = 0
	while i<file_content.length && i<4
		buf[i] = file_content[i]
		i+=1
	end
	if file_content.length > 4
		file_content = file_content[4..-1]
	else
		file_content = ""
	end
	return i
end