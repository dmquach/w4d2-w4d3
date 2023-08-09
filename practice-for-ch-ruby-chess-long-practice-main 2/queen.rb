require_relative 'piece.rb'
require_relative 'horizontal_mod.rb'
require_relative 'diagonal_mod.rb'

class Queen < Piece
    include Slideable_Diagonal
    include Slideable_Straight

    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♛" : "♕"
    end
    def moves
        self.possible_diagonal_moves + self.possible_straight_moves
    end

    def threated_spaces
        #possible moves + moves with own pieces
    end
end
