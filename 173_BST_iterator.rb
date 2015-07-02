class BSTIterator
	attr_accessor :stack
    # @param {TreeNode} root
    def initialize(root)
        @stack = []
        current = root
        while current!= nil
        	@stack << current
        	current = current.left
        end
        return
    end

    # @return {Boolean}
    def has_next
    	@stack.length != 0        
    end

    # @return {Integer}
    def next
        next_node = @stack.pop
        current = next_node.right
        while current!= nil
        	@stack << current
        	current = current.left
        end
        next_node.val
    end
end