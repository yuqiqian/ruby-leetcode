# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
    max = [2**31 * (-1)]
    helper(root, max)
    return max
end

def helper(root, max)
    return 0 if root.nil?
    l = helper(root.left, max)
    r = helper(root.right, max)
    l = 0 if l < 0
    r = 0 if r < 0
    max[0] = l+r+root.val if l+r+root.val > max[0]
    binding.pry
    return root.val + [l,r].max
end