# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    m = matrix.size
    return false if m==0
    n = matrix[0].size
    i, j = 0, n-1
    while i < m && j >= 0
        if matrix[i][j] == target
            return true
        elsif matrix[i][j] > target
            j -= 1
        else
            i += 1
        end
    end
    false                
end