require_relative "piece.rb"

class Board
    attr_accessor :rows
    def initialize()
        @board = Array.new(8) {Array.new(8, Piece.new)}
        @board.set
    end

    def [](pos) # [2,2]
        row, column = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, column = pos
        @board[row][column] = val
    end

    def move_piece(start_pos, end_pos)
        @board[end_pos] = @board[start_pos]
        @board[start_pos] = nil
    end

    private
    def set
        
    end
end
