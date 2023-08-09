require_relative 'piece.rb'
require_relative 'horizontal_mod.rb'

class Rook < Piece
    include Slideable_Straight
    # def initialize(color, board, pos)
    #     super
    # end

    def to_s(color)
        color == "black" ? "♜" : "♖"
    end

    def moves
        self.possible_straight_moves
    end

    def threats
        self.possible_threat_horizontal
    end
end
