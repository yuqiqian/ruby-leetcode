# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
    return create(inorder,postorder,0,inorder.length-1,0,postorder.length-1)
end

def create(inorder,postorder,is,ie,ps,pe)
    return nil if ps>pe
    node = TreeNode.new(postorder[pe])
    pos =0
    (is..ie).each do |i|
        if inorder[i] == node.val
            pos = i
            break
        end
    end
    node.left = create(inorder,postorder,is,pos-1,ps,ps+pos-is-1)
    node.right = create(inorder,postorder,pos+1,ie,pe-ie+pos,pe-1)
    return node
end