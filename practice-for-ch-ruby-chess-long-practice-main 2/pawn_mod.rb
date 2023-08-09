module Pawn_Moves
    def possible_pawn_moves
        possible_moves = self.straight_move + self.capture_move
    end

    def straight_move
        row, col = self.position
        if self.color == "white"
            return [] if row - 1 < 0 || self.board[[row - 1, col]].class != NullPiece
            return [[row - 1, col]] + double_move([row, col])
        end

        if self.color == "black"
            return [] if row + 1 > 7 || self.board[[row + 1, col]].class != NullPiece
            return [[row + 1, col]] + double_move([row, col])
        end
    end

    def double_move(pos)
        row, col = pos
        if self.color == "white"
            return [] if row != 6 || self.board[[row - 2, col]].class != NullPiece
            return [[row - 2, col]]
        end

        if self.color == "black"
            return [] if row != 1 || self.board[[row + 2, col]].class != NullPiece
            return [[row + 2, col]]
        end
    end

    def capture_move
        moves = []
        row, col = self.position
        if self.color == "white"
            return [] if row - 1 < 0
            unless col - 1 < 0
                moves << [row - 1, col - 1] if self.board[[row - 1, col - 1]].color == "black"
            end

            unless col + 1 > 7
                moves << [row - 1, col + 1] if self.board[[row - 1, col + 1]].color == "black"
            end
            return moves
        end

        if self.color == "black"
            return [] if row + 1 > 7
            unless col - 1 < 0
                moves << [row + 1, col - 1] if self.board[[row + 1, col - 1]].color == "white"
            end

            unless col + 1 > 7
                moves << [row + 1, col + 1] if self.board[[row + 1, col + 1]].color == "white"
            end
            return moves
        end
    end

end
