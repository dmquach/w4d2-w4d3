require_relative 'piece.rb'
require_relative 'pawn_mod.rb'
class Pawn < Piece
    include Pawn_Moves
    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♟︎" : "♙"
    end

    def moves
        self.possible_pawn_moves
    end

    def threats
        self.possible_threat
    end
end
