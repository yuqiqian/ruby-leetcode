# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
    left = 1
    right = x-1
    while left <= right
        mid = (left+right)/2
        if mid*mid < x
            left = mid+1
        elsif mid*mid > x
            right = mid-1
        else
            return mid
        end
    end
    left-1        
end