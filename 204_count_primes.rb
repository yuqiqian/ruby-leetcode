# @param {Integer} n
# @return {Integer}
def count_primes(n)
    return 0 if n < 2
    arr = Array.new(n+1,1)
    arr[0] = 0
    arr[1] = 0
    arr.each_with_index do |prime, i|
        next if prime == 0
        break if i*i > n
        (i*i..n).step(i) do |j|
            arr[j] = 0
        end
    end
    arr.inject(:+)
end