module King_Moves
    def possible_king_moves
        row, col = self.position
        new_pos = []

        new_pos = [[row - 1, col],[row - 1, col - 1]] # up one, up one + left one
        new_pos += [[row - 1, col + 1], [row, col + 1]] # up one + right one, right one
        new_pos += [[row, col - 1], [row + 1, col]] #left one, down one
        new_pos += [[row + 1, col + 1], [row + 1, col - 1]] # down one + right one, down one + left one
        new_pos.select {|coordinate| valid?(coordinate)}
    end

    def valid?(pos) #[x,x]
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || col > 7
        return false if self.board[[row, col]].color == self.color
        true
    end
end
