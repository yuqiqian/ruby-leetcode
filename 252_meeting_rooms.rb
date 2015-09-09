# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Boolean}
def can_attend_meetings(intervals)
	return true if intervals.length < 2
	intervals = intervals.sort_by{|itv| itv.start}
	prev_end = intervals[0].end
	intervals[1..-1].each do |itv|
		return false if itv.start < prev_end
		prev_end = itv.end
	end
	return true
end