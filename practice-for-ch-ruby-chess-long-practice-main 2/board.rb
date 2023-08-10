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

        self[[7, 0]] = Rook.new("white", self, [7, 0])
        self[[7, 1]] = Knight.new("white", self, [7, 1])
        self[[7, 2]] = Bishop.new("white", self, [7, 2])
        self[[7, 3]] = Queen.new("white", self, [7, 3])
        self[[7, 4]] = King.new("white", self, [7, 4])
        self[[7, 5]] = Bishop.new("white", self, [7, 5])
        self[[7, 6]] = Knight.new("white", self, [7, 6])
        self[[7, 7]] = Rook.new("white", self, [7, 7])
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

    def find_king(curr_color)
        king_pos = []

        board.each do |row|
            row.each do |piece|
                king_pos = piece.position if (piece.color == curr_color && piece.class == King)
            end
        end
        king_pos
    end

    def get_op_pieces(curr_color)
        op_pieces = []

        board.each do |row|
            row.each do |piece|
                op_pieces << piece if (piece.color != curr_color && piece.class != NullPiece)
            end
        end
        op_pieces
    end

    def get_own_pieces(curr_color)
        own_pieces = []

        board.each do |row|
            row.each do |piece|
                own_pieces << piece if (piece.color == curr_color && piece.class != King)
            end
        end
        own_pieces
    end


    def in_check?(curr_color) #check if we are being under attack
        king_pos = find_king(curr_color)
        op_pieces = get_op_pieces(curr_color)

        op_moves = []
        op_pieces.each do |piece|
            arr = piece.threats  #threated_space
            arr.each do |move|
                unless op_moves.include?(move)
                    op_moves << move
                end
            end
        end

        op_moves.include?(king_pos)
    end

    def king_can_move?(color)
        king_pos = find_king(color)
        return false if self[king_pos].moves.empty?
        true
    end

    def attackers(color)
        attackers = []
        king_pos = find_king(color)
        op_pieces = get_op_pieces(color)

        op_pieces.each do |piece|
            arr = piece.moves  #threated_space
            arr.each do |move|
                attackers << piece if king_pos == move
            end
        end
        attackers
    end

    def attacker_unremovable?(op_piece)
        pos = op_piece.position
        own_pieces = op_piece.color == "black" ? get_own_pieces("white") : get_own_pieces("black")

        #iterate through own pieces.moves to find move that takes piece.pos
        all_moves = []
        own_pieces.each do |piece|
            all_moves += piece.moves
        end
        !all_moves.include?(pos) # returns true if no move matches pos
    end

    def defender_unblockable?(op_piece)
        op_row, op_col = op_piece.position
        king_row, king_col = (op_piece.color == "black" ? find_king("white") : find_king("black"))
        own_pieces = (op_piece.color == "black" ? get_own_pieces("white") : get_own_pieces("black"))

        if op_piece.class == Knight || op_piece.class == Pawn
            return true
        elsif op_piece.class == Bishop || op_piece.class == Queen
            row_direction = op_row - king_row # if negative, bishop moving down (add to opponent piece row)
            col_direction = op_col - king_col # if negative, bishop moving right (add to opponent piece col)
            path = []
            if row_direction < 0 && col_direction < 0 #down right
                path = op_piece.move_downright
            elsif row_direction > 0 && col_direction < 0  #up right
                path = op_piece.move_upright
            elsif row_direction < 0 && col_direction > 0  #down left
                path = op_piece.move_downleft
            elsif row_direction > 0 && col_direction > 0 #up left
                path = op_piece.move_upleft
            end

            all_moves = []
            own_pieces.each do |piece|
                all_moves += piece.moves
            end
            path.each do |pos|
                return false if all_moves.include?(pos)
            end
        end
        if op_piece.class == Rook || op_piece.class == Queen
            row_direction = op_row - king_row # if negative, bishop moving down (add to opponent piece row)
            col_direction = op_col - king_col # if negative, bishop moving right (add to opponent piece col)
            path = []
            if row_direction < 0 #down
                path = op_piece.move_down
            elsif row_direction > 0 #up
                path = op_piece.move_up
            elsif col_direction > 0  #left
                path = op_piece.move_left
            elsif col_direction < 0 #right
                path = op_piece.move_right
            end

            all_moves = []
            own_pieces.each do |piece|
                all_moves += piece.moves
            end
            path.each do |pos|
                return false if all_moves.include?(pos)
            end
        end
        true
    end


    def checkmate(color)
        att = attackers(color)
        # no place to move
        if in_check?(color) && !king_can_move?(color) && att.length > 1
            puts "Checkmate"
            return true
        end

        if in_check?(color) && !king_can_move?(color) && attacker_unremovable?(att.first) && defender_unblockable?(att.first)
            puts "Checkmate"
            return true
        end


        # no way to remove all defenders or impede path

        #who is attacking us? (get everyone threatening king) -> if multiple attackers then lose,

        #iterate through op_pieces and select the pieces with possible move of taking king, store that in attacking_king
        #if the attacking_king array has multiple attackers, checkmate
        #if just one attacker
        #

        #if one attacker, can we capture the attacker with a legal move
        #if not, can we block the path?
        false

    end
end
