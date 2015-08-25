def bubble_sort(array)
	n = array.length
	loop do
		swapped = false
		(n-1).times do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end

		break if not swapped
	end

	array
end

def mergesort(arr)
	def merge(left_sorted, right_sorted)
		res = []
		l, r = 0, 0
		loop do
			break if r >= right_sorted.length and l >= left_sorted.length

			if r >= right_sorted.length || (l < left_sorted.length && left_sorted[l] < right_sorted[r]) 
				res << left_sorted[l]
				l += 1
			else
				res << right_sorted[r]
				r += 1
			end
		end
		res
	end

	def mergesort_iter(array_sliced)
		return array_sliced if array_sliced.length <= 1

		mid = array_sliced.length/2-1
		left_sorted = mergesort_iter(array_sliced[0..mid])
		right_sorted = mergesort_iter(array_sliced[mid+1..-1])
		return merge(left_sorted, right_sorted)
	end

	mergesort_iter(arr)
end

def selection_sort(arr)
	n = arr.size-1
	n.times do |i|
		index_min = i
		(i+1).upto(n) do |j|
			index_min = j if a[j] < a[index_min]
		end

		a[i], a[index_min] = a[index_min], a[i] if index_min != i
	end
end

def insertion_sort(arr)
	i = 0
	until i == arr.length-1 do
		if arr[i] <= arr[i+1]
			i += 1 unless i == arr.length
		else
			arr[i], arr[i+1] = arr[i+1], arr[i]
			j = i
			until arr[j-1] <= arr[j] || j == 0 do
				if arr[j-1]	> arr[j]
					arr[j], arr[j-1] = arr[j-1], arr[j]
					j -= 1 unless j==1
				end
			end
		end
		puts i.to_s + " " + j.to_s + arr.to_s
	end
	arr
end