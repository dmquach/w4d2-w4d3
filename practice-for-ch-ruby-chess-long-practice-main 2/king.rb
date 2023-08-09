require_relative 'piece.rb'
require_relative 'king_mod.rb'
class King < Piece
    include King_Moves
    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♚" : "♔"
    end

    def moves
        self.possible_king_moves
    end

    def threats
        self.possible_threat
    end
end
