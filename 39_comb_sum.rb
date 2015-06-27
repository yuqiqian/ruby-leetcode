def combination_sum(candidates, target)
  candidates.sort!
  cand = []
  res = []
  combination_sum_helper(candidates, cand, target, res)
  res
end

def combination_sum_helper(candidates, cand, target, res)
  if target < 0
    return
  elsif target == 0
    res.push(Array.new(cand))
  else
    candidates.each_with_index do |c, i|
      cand.push(c)
      combination_sum_helper(candidates[i..-1], cand, target - c, res)
      cand.pop
    end
  end
end
