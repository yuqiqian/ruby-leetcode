# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0):
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
	return[new_interval] if intervals.length == 0
	head, tail = 0, intervals.length-1
	while head <= tail
		mid = (head+tail)/2
		if new_interval.start > intervals[mid].start
			head = mid +1
		elsif new_interval.start < intervals[mid].start
			tail = mid-1
		else
			head = mid
			break
		end
	end
    if head == 0
        intervals = [new_interval]+intervals[0..-1]
    else
	    intervals = intervals[0..head-1] + [new_interval] + intervals[head..-1]
	end
	prev = Interval.new(intervals[0].start, intervals[0].end)
	result = []
	intervals[1..-1].each do |interval|
		if interval.start > prev.end
			result << prev
			prev = Interval.new(interval.start, interval.end)
		else
			prev.end = [interval.end, prev.end].max
		end
	end
	result << prev

	result
end