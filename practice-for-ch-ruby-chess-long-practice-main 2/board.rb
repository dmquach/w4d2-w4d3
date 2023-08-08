require_relative "piece.rb"

class Board
    attr_accessor :rows
    def initialize(
    )
        @board = Array.new(8) {Array.new(8, Piece.new("P"))}
        # self.set
    end

    def [](pos) # [2,2]
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        self[end_pos]= self[start_pos]
        self[start_pos]= nil
    end

    # private
    def set

        row = 2
        while row < 6
            col = 0
            while col < 8
                @board[row][col]= nil
                col += 1
            end
            row += 1
        end
    end

    def print
        @board.each do |row|
            
        end
    end
end
