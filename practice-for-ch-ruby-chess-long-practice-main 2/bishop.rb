require_relative 'piece.rb'
require_relative 'diagonal_mod.rb'
class Bishop < Piece
    include Slideable_Diagonal
    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♝" : "♗"
    end

    def moves
        self.possible_diagonal_moves
    end

    def threats
        self.possible_threat_diagonal
    end

end
