require 'byebug'

module Slideable_Straight
    def possible_moves
        arr = self.move_up + self.move_down + self.move_right + self.move_left
    end

    private
    def move_up
        #debugger
        possible_moves = []
        row, col = self.position #[3,3]
        stopped = false
        i = 1
        until stopped
            if (self.board[[row - i, col]]).color == self.color || row - i < 0 #hit own piece or edge of board
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
        return []
    end

    def move_right
        return []
    end

    def move_left
        return []
    end
end
=begin

module Slideable_Diagonal
    possible_moves = []

    def move_upright

    end

    def move_upleft

    end

    def move_downright

    end

    def move_downleft

    end
end
=end
