require_relative 'piece.rb'
require_relative 'module.rb'

class Rook < Piece
    include Slideable_Straight
    # def initialize(color, board, pos)
    #     super
    # end

    def to_s(color)
        color == "black" ? "♜" : "♖"
    end

    def moves
        self.possible_moves
    end
end
