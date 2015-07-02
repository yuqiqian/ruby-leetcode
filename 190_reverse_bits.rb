def reverse_bits(n)
	transfer = {0b0000 => 0b0000, 0b0001 => 0b1000, 0b0010 => 0b0100, 0b0011 => 0b1100, 0b0100 => 0b0010, 0b0101 => 0b1010, 0b0110 => 0b0110, 0b0111 => 0b1110, 0b1000 => 0b0001, 0b1001 => 0b1001, 0b1010 => 0b0101, 0b1011 => 0b1101, 0b1100 => 0b0011, 0b1101 => 0b1011, 0b1110 => 0b0111, 0b1111 => 0b1111}
	result = 0
	(0..31).step(4).each do |shift|
		result = (result<< 4) | transfer[(n>>shift) & 0x0F]
	end
	result
end