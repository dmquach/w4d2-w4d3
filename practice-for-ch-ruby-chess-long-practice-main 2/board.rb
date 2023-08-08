require_relative "piece.rb"
require 'byebug'

class Board
    attr_accessor :rows
    def initialize()
        @board = Array.new(8) {Array.new(8, nil)}
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
        # TODO check if move valid
        self[end_pos] = self[start_pos] #overwrite ending position piece (nil or opposite color) with piece on start pos
        self[start_pos]= Piece.new("null", self, [start_pos]) #this now is a null piece
        self[end_pos].position = end_pos
        #If move not valid retry, get another move
    end

    # private
    def set
        #debugger
        row = 0 #creaet black pieces
        while row < 2
            col = 0
            while col < 8
                self[[row, col]] = Piece.new("black", self, [row, col])
                col += 1
            end
            row += 1
        end


        while row < 6 #creates null pieces
            col = 0
            while col < 8
                self[[row, col]]= Piece.new("null", self, [row, col])
                col += 1
            end
            row += 1
        end

        while row < 8 #creates null pieces
            col = 0
            while col < 8
                self[[row, col]] = Piece.new("white", self, [row, col])
                col += 1
            end
            row += 1
        end

    end

    def print
        @board.each do |row|
            arr = []
            row.each do |p|
                arr << p.to_s
            end
            puts arr.join(" ")
        end
        nil
    end
end
