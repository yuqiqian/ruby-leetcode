# Definition for a point.
# class Point
#     attr_accessor :x, :y
#     def initialize(x=0, y=0):
#         @x = x
#         @y = y
#     end
# end

# @param {Point[]} points
# @return {Integer}
def max_points(points)
    res = 0
    len = points.length
    points.each_with_index do |p, i| 
        same = 1
        dict = Hash.new(0)
        local_max = 0
        points[i+1..-1].each do |q|
            if p.x==q.x && p.y==q.y
                same +=1
            elsif p.x==q.x
                dict[2**31-1] += 1
            else
                slop = (p.y-q.y).fdiv(p.x-q.x)
                if slop.zero?
                    slop = 0.0
                end
                dict[slop] += 1
            end
        end
        dict.each{|slop, n| local_max = [local_max, n].max}
        local_max += same
        res = [local_max,res].max
    end
    res
end