# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def upside_down_binary_tree(root)
    return nil if root.nil?
    curr = root
    parent = nil
    prev_right = nil
    while !curr.nil?
        left = curr.left
        right = curr.right

        curr.left = prev_right
        curr.right = parent

        prev_right = right
        parent = curr
        curr = left
    end
    parent
end