def calculate_minimum_hp(dungeon)
	return 1 if dungeon.length == 0 || dungeon[0].length == 0
	min_hp_from_here = [0xFFFF]*dungeon[0].length
	min_hp_from_here[-1] = 1

	(dungeon.length-1).downto(0) do |x_pos|
		binding.pry
		min_hp_from_here[-1] = [1, min_hp_from_here[-1]-dungeon[x_pos][-1]].max
		binding.pry

		(dungeon[0].length-2).downto(0) do |y_pos|
			
			to_right = [1, min_hp_from_here[y_pos+1]-dungeon[x_pos][y_pos]].max
			to_down = [1, min_hp_from_here[y_pos]-dungeon[x_pos][y_pos]].max
			min_hp_from_here[y_pos] = [to_right, to_down].min
			binding.pry
		end
	end
	min_hp_from_here[0]
end