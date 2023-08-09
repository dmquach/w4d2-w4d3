require_relative 'piece.rb'
class Knight < Piece
    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        color == "black" ? "♞" : "♘"
    end
end
