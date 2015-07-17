class RandomListNode
	attr_accessor :label, :next, :random
	def initialize(x)
		@label = x
		@next = nil
		@random = nil
	end
end

def copy_random_list(head)
	old_2_new = {nil => nil}
	current = head
	while !current.nil?
		old_2_new[current] = RandomListNode.new(current.label)
		current = current.next
	end

	current = head
	while !current.nil?
		old_2_new[current].next = old_2_new[current.next]
		old_2_new[current].random = old_2_new[current.random]
		current = current.next
	end

	old_2_new[head]
end