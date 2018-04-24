require 'Singleton'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new}
    place_board
  end
  
  def place_board
    grid.each_with_index do |row, idx|
      if idx == 0 || idx == grid.length - 1
        queen_pos = 3
        king_pos = 4
        
        8.times do |n|
          if n == 0 || n == 7
            row << Piece.new("Rook")
          elsif n == 3
            row << Piece.new("Queen")
          elsif n == 4
            row << Piece.new("King")
          else
            row << NullPiece.instance
          end
        end
        
      else
        8.times do |n|
          row << NullPiece.instance
        end
      end
    end
  end
  
  
  def move_piece(start_pos, end_pos)
    raise "There is no piece at start_pos" if self[start_pos].symbol == nil
    valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end
  
  def valid_pos?(pos)
    raise "This is not a valid position." unless pos.all? { |num| num.between?(0, 7) }
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, target)
    row, col = pos
    @grid[row][col] = target
  end
end

class Piece
  attr_reader :symbol
  
  def initialize(symbol = nil)
    @symbol = symbol
  end
end

class NullPiece < Piece
  include Singleton
  
  def initialize
    @color = nil
    @symbol = nil
  end
end





