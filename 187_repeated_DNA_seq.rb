def find_repeated_dna_sequences(s)
	occur = Hash.new(0)
	(0..s.length-10).each do |start|
		piece = s[start..start+9]
		occur[piece] +=1
	end
	result = []
	occur.each{|piece, occur| result << piece if occur > 1}
	result
end