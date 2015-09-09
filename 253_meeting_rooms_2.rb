# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
	changes = Hash.new(0)
	intervals.each do |itv| 
		changes[itv.start] += 1
		changes[itv.end] -= 1
	end
	rooms = 0 
	max_rooms = 0
	changes.sort.each do |k, e|
		rooms += e
		max_rooms = [max_rooms, rooms].max
	end
	max_rooms
end