module Slideable_Diagonal
    def possible_diagonal_moves
        arr = self.move_upright + self.move_upleft + self.move_downright + self.move_downleft
    end
  

    def move_upright
        possible_moves = []

        row, col = self.position
        stopped = false
        i = 1
        until stopped
            if (row - i < 0 || col + i > 7) || (self.board[[row - i, col + i]]).color == self.color
                stopped = true
            elsif (self.board[[row - i, col + i]]).class == NullPiece #no piece there
                possible_moves << [row - i, col + i]
            elsif (self.board[[row - i, col + i]]).color != self.color #opposite
                possible_moves << [row - i, col + i]
                stopped = true
            end

            i += 1
        end
        possible_moves
    end

    def move_upleft
        possible_moves = []

        row, col = self.position
        stopped = false
        i = 1
        until stopped
            if (row - i < 0 || col - i > 7) || (self.board[[row - i, col - i]]).color == self.color
                stopped = true
            elsif (self.board[[row - i, col - i]]).class == NullPiece #no piece there
                possible_moves << [row - i, col - i]
            elsif (self.board[[row - i, col - i]]).color != self.color #opposite
                possible_moves << [row - i, col - i]
                stopped = true
            end

            i += 1
        end
        possible_moves

    end

    def move_downright
        possible_moves = []

        row, col = self.position
        stopped = false
        i = 1
        until stopped
            if (row + i < 0 || col + i > 7) || (self.board[[row + i, col + i]]).color == self.color
                stopped = true
            elsif (self.board[[row + i, col + i]]).class == NullPiece #no piece there
                possible_moves << [row + i, col + i]
            elsif (self.board[[row + i, col + i]]).color != self.color #opposite
                possible_moves << [row + i, col + i]
                stopped = true
            end

            i += 1
        end
        possible_moves

    end

    def move_downleft
        possible_moves = []

        row, col = self.position
        stopped = false
        i = 1
        until stopped
            if (row + i < 0 || col - i > 7) || (self.board[[row + i, col - i]]).color == self.color
                stopped = true
            elsif (self.board[[row + i, col - i]]).class == NullPiece #no piece there
                possible_moves << [row + i, col - i]
            elsif (self.board[[row + i, col - i]]).color != self.color #opposite
                possible_moves << [row + i, col - i]
                stopped = true
            end

            i += 1
        end
        possible_moves

    end
end