class Piece
	def initialize(color)
		@color = color
	end

	def diagonal_move?(origin, destination)
		origin[0] - destination[0] == origin[1] - destination[1]
	end

	def freeway?(board, origin, destination)
		inbetween_cells = set_way(origin, destination)
		inbetween_cells.all? do |cell|
			board.empty?(cell)
		end
	end

	def horizontal_move?(origin, destination)
		origin[0] == destination[0]
	end

	def set_way(origin, destination)
		row_diff = destination[0] - origin[0]
		col_diff = destination[1] - origin[1]
		row_direction = row_diff == 0 ? 0 : row_diff / row_diff.abs
		col_direction = col_diff == 0 ? 0 : col_diff / col_diff.abs
		num_cells = [row_diff.abs - 1, col_diff.abs - 1].max
		(1..num_cells).map do |num_cell|
			[origin[0] + (row_direction * num_cell), origin[1] + (col_direction * num_cell)]
		end
	end

	def vertical_move?(origin, destination)
		origin[1] == destination[1]
	end
end