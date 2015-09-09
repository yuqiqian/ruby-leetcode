# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
    ones, m = 0, 1
    while m <= n
        ones += (n/m+8)/10*m + ((n/m)%10==1 ? (n%m+1) : 0)
        m *= 10
    end
    ones
end