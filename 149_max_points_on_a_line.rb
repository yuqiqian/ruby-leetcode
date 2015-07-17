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
	return 0 if points.length == 0
	max_count = 1
	(0..points.length-2).each do |i|
		p = points[i]
		this_count = 0
		vertical = 0
		horizontal = 0
		same_pos = 1
		slop = Hash.new(0)

		points[i+1..-1].each do |to_comp|
			diff_x = to_comp.x - p.x
			diff_y = to_comp.y - p.y
			if diff_x == 0 && diff_y == 0
				same_pos += 1
			elsif diff_x == 0
				vertical += 1
			elsif diff_y == 0
				horizontal += 1
			else
				if diff_x < 0 && diff_y < 0
					diff_x, diff_y = -diff_x, -diff_y
				elsif diff_x<0 || diff_y< 0
					diff_x, diff_y = -diff_x.abs, diff_y.abs
				end

				gcd = get_gcd(diff_x.abs, diff_y)
				diff_x /= gcd
				diff_y /= gcd

				slop[[diff_x, diff_y]] += 1 
			end
		end
		if slop.length != 0
		    temp = []
		    slop.each{|k, v| temp<< v}
			this_count = temp.max
		end
		this_count = [this_count, vertical, horizontal].max 
		this_count += same_pos

		max_count = [max_count, this_count].max
	end
	max_count
end
						
				
					

def get_gcd(a, b)
	a,b = b,a if a < b
	if a%b!= 0
		return get_gcd(b, a%b)
	else
		return b
	end
end
