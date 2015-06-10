require_relative './piece.rb'

class Queen < Piece

	def valid_move?(board, origin, destination)
		return false if board.piece_color(destination) == @color
		return false unless freeway?(board, origin, destination)
		horizontal_move?(origin, destination) || vertical_move?(origin, destination) ||
		diagonal_move?(origin, destination)
	end

end