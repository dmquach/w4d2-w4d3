require_relative 'piece.rb'
require 'Singleton'
class NullPiece < Piece
    include Singleton

    def initialize()
        
    end

    def to_s(color = "null")
        return "N"
    end
end
