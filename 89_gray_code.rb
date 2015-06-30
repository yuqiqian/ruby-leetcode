# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  result = []
  (0..(1<< n)-1).each do |item|
    result << (item ^ item>>1)
    end
    result
end