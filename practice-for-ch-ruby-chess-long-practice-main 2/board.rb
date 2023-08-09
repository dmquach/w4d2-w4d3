require_relative "piece.rb"
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Board
    attr_accessor :rows, :board
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
        self[end_pos] = self[start_pos] #overwrite ending position piece (nil or opposite color) with piece on start pos
        self[start_pos]= NullPiece.instance #this now is a null piece
        self[end_pos].position = end_pos
        #If move not valid retry, get another move
    end

    def valid_input(start_pos, end_pos, turn_color)
        if self[start_pos].color != turn_color
            raise RuntimeError "Invalid Start Piece"
        end

        unless self[start_pos].moves.include?(end_pos)
            raise RuntimeError "Invalid end position"
        end
        
        move_piece(start_pos)
    end

    # private
    def set
        #debugger
        row = 0 #creaet black pieces
        self[[0, 0]] = Rook.new("black", self, [0, 0])
        self[[0, 1]] = Knight.new("black", self, [0, 1])
        self[[0, 2]] = Bishop.new("black", self, [0, 2])
        self[[0, 3]] = Queen.new("black", self, [0, 3])
        self[[0, 4]] = King.new("black", self, [0, 4])
        self[[0, 5]] = Bishop.new("black", self, [0, 5])
        self[[0, 6]] = Knight.new("black", self, [0, 6])
        self[[0, 7]] = Rook.new("black", self, [0, 7])
        row += 1

        while row < 2
            col = 0
            while col < 8
                self[[row, col]] = Pawn.new("black", self, [row, col])
                col += 1
            end
            row += 1
        end

        # NullPiece.("null")
        while row < 6 #creates null pieces

            col = 0
            while col < 8
                self[[row, col]]= NullPiece.instance
                col += 1
            end
            row += 1
        end

        while row < 7 #creates null pieces
            col = 0
            while col < 8
                self[[row, col]] = Pawn.new("white", self, [row, col])
                col += 1
            end
            row += 1
        end

        self[[7, 0]] = Rook.new("white", self, [8, 0])
        self[[7, 1]] = Knight.new("white", self, [8, 1])
        self[[7, 2]] = Bishop.new("white", self, [8, 2])
        self[[7, 3]] = Queen.new("white", self, [8, 3])
        self[[7, 4]] = King.new("white", self, [8, 4])
        self[[7, 5]] = Bishop.new("white", self, [8, 5])
        self[[7, 6]] = Knight.new("white", self, [8, 6])
        self[[7, 7]] = Rook.new("white", self, [8, 7])
    end

    def print
        @board.each do |row|
            arr = []
            row.each do |p|
                arr << p.to_s(p.color)
            end
            puts arr.join(" ")
        end
        nil
    end

    def check_mate()
        # 
        # find king instance of current player, get pos of king
        #  one cond. check legal pos for king, if empty checkmate
    end
end
