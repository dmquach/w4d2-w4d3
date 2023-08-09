require_relative 'piece.rb'
require_relative 'knight_mod.rb'

class Knight < Piece
    include Jump_Moves
    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♞" : "♘"
    end

    def moves
        self.possible_jump_moves
    end
end
