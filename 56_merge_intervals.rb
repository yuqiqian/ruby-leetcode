def merge(intervals)
	return [] if intervals.length == 0
	intervals = intervals.sort_by{|x| x.start}
	prev = Interval.new(intervals[0].start, intervals[0].end)
	result =[]
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