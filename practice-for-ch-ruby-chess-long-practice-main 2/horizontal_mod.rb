require 'byebug'

module Slideable_Straight
    def possible_straight_moves
        arr = self.move_up + self.move_down + self.move_right + self.move_left
    end

    private
    def move_up
        possible_moves = []
        row, col = self.position #[7,0]
        stopped = false
        i = 1
        until stopped
            if row - i < 0 || (self.board[[row - i, col]]).color == self.color #hit own piece or edge of board
                stopped = true
            elsif (self.board[[row - i, col]]).class == NullPiece #no piece there
                possible_moves << [row - i, col]
            elsif (self.board[[row - i, col]]).color != self.color #opposite
                possible_moves << [row - i, col]
                stopped = true
            end
            i += 1
        end
        possible_moves
    end

    def move_down
        possible_moves = []
        row, col = self.position #[3,3]
        stopped = false
        i = 1
        until stopped
            if row + i > 7 || (self.board[[row + i, col]]).color == self.color #hit own piece or edge of board
                stopped = true
            elsif (self.board[[row + i, col]]).class == NullPiece #no piece there
                possible_moves << [row + i, col]
            elsif (self.board[[row + i, col]]).color != self.color #opposite
                possible_moves << [row + i, col]
                stopped = true
            end
            i += 1
        end
        possible_moves
    end

    def move_right
        possible_moves = []
        row, col = self.position #[3,3]
        stopped = false
        i = 1
        until stopped
            # debugger
            if  col + i > 7 || (self.board[[row, col + i]]).color == self.color #hit own piece or edge of board
                stopped = true
            elsif (self.board[[row, col + i]]).class == NullPiece #no piece there
                possible_moves << [row, col + i]
            elsif (self.board[[row, col +  i]]).color != self.color #opposite
                possible_moves << [row, col + i]
                stopped = true
            end
            i += 1
        end
        possible_moves
    end

    def move_left
        possible_moves = []
        row, col = self.position #[3,3]
        stopped = false
        i = 1
        until stopped
            if col - i < 0 || (self.board[[row, col - i]]).color == self.color  #hit own piece or edge of board
                stopped = true
            elsif (self.board[[row, col - i]]).class == NullPiece #no piece there
                possible_moves << [row, col - i]
            elsif (self.board[[row, col - i]]).color != self.color #opposite
                possible_moves << [row, col - i]
                stopped = true
            end
            i += 1
        end
        possible_moves
    end
end
