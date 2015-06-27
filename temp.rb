def spiral_order(matrix)
    row = matrix.length
    if row == 0
        return matrix
    end
    col = matrix[0].length
    result = []
    bound = [row,col].min
    0.upto(bound/2-1) do |layer|
        result = result + matrix[layer][layer..col-layer-2]
        layer.upto(row-layer-2){|i|result<< matrix[i][col-layer-1]}
        result = result + matrix[row-layer-1][layer+1..col-layer-1].reverse
        (row-layer-1).downto(layer+1){|i| result << matrix[i][layer]}
    end
    
    if bound%2 == 1
        if bound == row
            result = result + matrix[bound/2][bound/2..col-bound/2-1]
        else
            (bound/2).upto(row-bound/2-1){|i| result<< matrix[i][bound/2]}
        end
    end
    result
end