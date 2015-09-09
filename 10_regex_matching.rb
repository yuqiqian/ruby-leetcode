# @param {Integer} x
# @return {Boolean}
def is_match(s, p)
    m, n = s.length, p.length
    dp = Array.new(m+1){Array.new(n+1, false)}
    dp[0][0] = true
    (0..m).each do |i|
        (1..n).each do |j|
            if p[j-1]!="*"
                dp[i][j] = i>0 && dp[i-1][j-1] && (s[i-1]==p[j-1] || p[j-1]===".")
            else
                dp[i][j] = dp[i][j-2] || (i>0 && dp[i-1][j] && (s[i-1]==p[j-2] || p[j-2]==="."))
            end
            binding.pry
        end
    end
    dp[m][n]
end