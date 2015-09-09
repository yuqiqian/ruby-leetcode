# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
   return create(preorder,inorder,0,preorder.length-1, 0, inorder.length-1) 
end

def create(preorder,inorder, ps,pe,is,ie)
    return nil if ps > pe
    node = TreeNode.new(preorder[ps])
    pos = 0
    (is..ie).each do |i|
        if inorder[i] == node.val
            pos = i
            break
        end
    end
    node.left = create(preorder, inorder, ps+1, ps+pos-is, is, pos-1)
    node.right =create(preorder,inorder, pe-ie+pos+1, pe,pos+1,ie)
    return node
end