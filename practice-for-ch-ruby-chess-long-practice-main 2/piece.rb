class Piece
    attr_accessor :color, :board, :position
    def initialize(color, board, position)
        @color = color
        @board = board
        @position = position
    end

    def to_s
        if color == "black"
            return "♜"
        elsif color == "white"
            return "♖"
        else
            return "N"
        end
    end

    def empty?

    end

    def valid_moves
        moves = []
    end

    #def symbol
end

class NullPiece < Piece
    def initialize

    end
end




=begin
class Rook < Piece
    include Slideable
end

class Bishop
    include Slideable
end

class Queen
    include Slideable
end

=end
