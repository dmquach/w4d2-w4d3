module Jump_Moves
    def possible_jump_moves
        row, col = self.position
        new_pos = []

        new_pos = [[row - 2, col + 1],[row - 2, col - 1]] # up two, right and left one
        new_pos += [[row - 1, col + 2], [row - 1, col - 2]] # up one, right and left two
        new_pos += [[row + 1, col + 2], [row + 1, col - 2]] #down one, right and left two
        new_pos += [[row + 2, col + 1], [row + 2, col - 1]] # down two, right and left one
        new_pos.select {|coordinate| valid?(coordinate)}
    end

    def valid?(pos) #[x,x]
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || col > 7
        return false if self.board[[row, col]].color == self.color
        true
    end

    def possible_threats
        row, col = self.position
        new_pos = []

        new_pos = [[row - 2, col + 1],[row - 2, col - 1]] # up two, right and left one
        new_pos += [[row - 1, col + 2], [row - 1, col - 2]] # up one, right and left two
        new_pos += [[row + 1, col + 2], [row + 1, col - 2]] #down one, right and left two
        new_pos += [[row + 2, col + 1], [row + 2, col - 1]] # down two, right and left one
        new_pos.reject do |coordinate|
            row, col = (coordinate)
            row < 0 || row > 7 || col < 0 || col > 7
        end
    end
end
