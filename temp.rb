# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
    arr = Array(1..n)
    res = ""
    total = 1
    k -= 1
    n.downto(1) do |multiplier|
        total*=multiplier
    end
    remaining = total
    n.downto(1) do |pos|
        remaining /= pos
        i = k/remaining
        res << arr[i].to_s
        arr.delete(arr[i])
        k %= remaining
    end
    res
end