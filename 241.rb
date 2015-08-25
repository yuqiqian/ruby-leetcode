# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
    ret = []
    (0..input.length-1).each do |i|
        if "+-*".include? input[i]
            part1, part2 = input[0..i-1], input[i+1..-1]
            part1_ret = diff_ways_to_compute(part1)
            part2_ret = diff_ways_to_compute(part2)
            part1_ret.each do |x|
                part2_ret.each do |y|
                    c = 0
                    case input[i]
                    when "+"
                        c = x+y
                    when "-"
                        c = x-y
                    when "*"
                        c = x*y
                    end
                    ret << c    
                end
            end
        end
    end
    ret << input.to_i if ret.size == 0
    ret
end