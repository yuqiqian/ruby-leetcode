# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
    que = [root]
    wraplist = []
    return wraplist if root.nil?
    while que.length!=0
        level_num = que.length
        sublist = []
        level_num.times do
            que << que[0].left if !que[0].left.nil?
            que << que[0].right if !que[0].right.nil?
            sublist << que.shift.val
        end
        wraplist.unshift sublist
    end
    wraplist
end