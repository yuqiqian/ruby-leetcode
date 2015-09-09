# @param {String} s
# @return {Integer}
def min_cut(s)
    len = s.size
    is_palin = Array.new(len+1) {Array.new(len+1, false)}
    dp = []
    (0..len).each{|i| dp << i-1}
    (1..len).each do |j|
        (j-1).downto(0) do |i|
            if (s[i]==s[j-1] && (j-i < 3 || is_palin[i+1][j-1]))
                is_palin[i][j] = true
                cuts = dp[i] + 1
                dp[j] = cuts if cuts < dp[j]
                binding.pry
            end
        end
    end
    dp[len]
end

