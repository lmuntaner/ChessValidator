require_relative './board.rb'
require_relative './rook.rb'
require_relative './queen.rb'

class ChessValidator

	def initialize
		grid = [
			[nil, nil, nil, nil, nil, nil, nil, nil],
			[nil, nil, nil, nil, nil, nil, nil, nil],
			[nil, nil, nil, nil, nil, nil, nil, nil],
			[nil, nil, nil, :bR, nil, nil, nil, nil],
			[nil, nil, nil, :wR, nil, nil, nil, nil],
			[nil, nil, nil, nil, nil, nil, nil, nil],
			[nil, nil, nil, nil, nil, nil, nil, nil],
			[nil, nil, nil, nil, nil, nil, nil, nil]
		]
		@board = Board.new(grid)
	end

	def check_move(move_string)
		origin = convert_to_position(move_string.split(" ")[0])
		destination = convert_to_position(move_string.split(" ")[1])
		piece = @board.get_piece(origin)
		return false if piece.nil?
		piece.valid_move?(@board, origin, destination)
	end

	def convert_to_position(string)
		position = []
		position[0] = (string[1].to_i - 8).abs
		position[1] = ("a".."h").to_a.index(string[0])
		position
	end
end
