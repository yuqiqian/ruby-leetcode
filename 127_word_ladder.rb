# @param {String} begin_word
# @param {String} end_word
# @param {Set<String>} word_dict
# @return {Integer}
def ladder_length(begin_word, end_word, word_dict)
	sig, bucket = build_sig([begin_word, end_word].to_set | word_dict)

	accessed = {}
	word_dict.each{|string| accessed[string] = false}
	accessed[begin_word] = true

	current_layer = [begin_word]
	steps = 1
	while current_layer.length != 0
		steps += 1
		next_layer = []
		current_layer.each do |intermediate|
			signatures = sig[intermediate]
			signatures.each do |signature|
				bucket[signature].each do |candidate|
					if candidate == end_word
						return steps
					end
					if accessed[candidate]
						next 
					end

					accessed[candidate] = true
					next_layer << candidate
				end
			end
		end
		current_layer = next_layer
	end
	return 0
end

def build_sig(content)
	sig = {}
	bucket = {}
	content.each do |string|
		sig[string] = []
		(0..string.length-1).each do |index|
		    if index == 0 && index == string.length-1
		        temp_sig = "*"
		    elsif index == 0
		        temp_sig = "*"+string[index+1..-1]
		    elsif index == string.length-1
		        temp_sig = string[0..index-1]+"*"
		    else
			    temp_sig = string[0..index-1] + "*" + string[index+1..-1]
			end
			sig[string] << temp_sig
			if !bucket.has_key? temp_sig
				bucket[temp_sig] = []
			end
			bucket[temp_sig] << string
		end
	end
	return sig, bucket
end