def find_ladders(head, tail, dict)
	require "set"
	sig, bucket = build_sig([head, tail] + dict)
	result = []
	accessed = {}
	dict.each{|string| accessed[string] = false}
	accessed[head] = true
	current_layer = [[start]]
	steps = 1
	while current_layer.length != 0 && result.length == 0
		steps += 1
		next_layer = []
		accessed_temp = []
		current_layer.each do |intermediate|
			signatures = sig[intermediate[-1]]
			signatures.each do |signature|
				bucket[signature].each do |candidate|
					if candidate == tail
						result << intermediate + [tail]
						next
					end
					if accessed[candidate]
						next
					end
					accessed_temp << candidate
					next_layer << intermediate + [candidate]
				end
			end
		end
		accessed_temp.each{|item| accessed[item] = true}
		current_layer = next_layer
	end
	result
end

def build_sig(contents)
	sig = Hash.new{|h,k|h[k] = []}
	bucket = Hash.new{|h,k|h[k] = []}
	contents.each do |word|
		(0..word.length-1).each do |i|
			temp_sig = word
			temp_sig[i] = "*"
			sig[word] << temp_sig
			bucket[temp_sig] << word
		end
	end
	return sig, bucket
end