class Board
	COLOR_DICT = {
		"w" => :white,
		"b" => :black
	}

	PIECES_DICT = {
		"R" => "Rook",
		"Q" => "Queen",
		"B" => "Bishop",
		"H" => "Horse",
		"K" => "King",
		"P" => "Pawn"
	}

	def initialize(grid)
		@grid = grid
	end

	def occupied?(pos)
		!@grid[pos[0]][pos[1]].nil?
	end

	def empty?(pos)
		@grid[pos[0]][pos[1]].nil?
	end

	def piece_color(pos)
		return nil unless occupied?(pos)
		char_color = @grid[pos[0]][pos[1]][0]
		COLOR_DICT[char_color]
	end

	def get_piece(pos)
		return nil unless occupied?(pos)
		char_piece = @grid[pos[0]][pos[1]][1]
		eval(PIECES_DICT[char_piece]).new(piece_color(pos))
	end
end