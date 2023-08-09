require_relative 'piece.rb'
class NullPiece < Piece

    def initialize(color, board, pos)
        super
    end

    def to_s(color)
        return "N"
    end
end
