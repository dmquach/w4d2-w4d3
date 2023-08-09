require 'byebug'
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
        return false if get_op_move.include? pos
        true

        # king.color based on curr pos
        # iterate through board and store all opo. pieces pos
        # iterate through opo. pos arr and store all their vaild moves
        # compare king pos/curr pos against opo. piece's valid moves


    end

    def get_op_move
        op_pieces = []
        # debugger
        self.board.board.each do |row|
            row.each do |piece|
                op_pieces << piece if (piece.color != self.color && piece.class != NullPiece)
            end
        end

        op_moves = []

        #debugger
        op_pieces.each do |piece|
            arr = piece.moves  #threated_spaced
            unless arr.empty?
                arr.each do |move|
                    unless op_moves.include?(move)
                        op_moves << move
                    end
                end
            end
        end
        puts


        op_moves
    end
end
