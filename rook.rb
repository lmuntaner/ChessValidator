require_relative './piece.rb'

class Rook < Piece

	def valid_move?(board, origin, destination)
		return false if board.piece_color(destination) == @color
		p freeway?(board, origin, destination)
		return false unless freeway?(board, origin, destination)
		horizontal_move?(origin, destination) || vertical_move?(origin, destination)
	end

end