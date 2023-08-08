module Slideable_Straight
    possible_moves = self.move_up + self.move_down + self.move_right + self.move_left

    private
    def move_up
        row, col = self.position #[3,3]
        stopped = false
        i = 1
        until stopped
            if (self.board[[row - i, col]]).class == NulPiece #no piece there
                possible_moves << [row - i, col]
                i += 1
            elsif (self.board[[row - i, col]]).color != self.color #opposite
                possible_moves << [row - i, col]
                stopped = true
            elsif (self.board[[row - i, col]]).color == self.color || row - i < 0 #hit own piece or edge of board
                stopped = true
            end
        end
    end

    def move_down

    end

    def move_right

    end

    def move_left
end

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
