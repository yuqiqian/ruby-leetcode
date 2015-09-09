# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    return false if n < 0
    count = 0
    while n != 0
        count += 1 if n&1 == 1
        n >>= 1
    end
    count == 1
end