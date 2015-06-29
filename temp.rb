# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
    return help(root)[0]
end

def help(current)
    if current == nil
        return [true, 0]
    else
        left = help(current.left)
        
        if !left[0]
            return [false, -1]
        end
        right = help(current.right)
        if !right[0]
            return [false, -1]
        end
        binding.pry
        if (left[1] - right[1]).abs <= 1
            height = [left[1],right[1]].max +1
            return [true, height]
        else
            return [false, -1]
        end
    end
end
            