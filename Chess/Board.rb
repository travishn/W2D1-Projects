require 'byebug'
require 'Singleton'
require_relative "piece.rb"
require_relative "Display.rb"

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new}
    place_board
  end
  
  def place_board
    place_main(0, "black")
    place_pawns(1, "black")
    place_main(7, "white")
    place_pawns(6, "white")
    place_nulls
  end
  
  def place_nulls
    @grid[2..5].each do |row|
      8.times do |idx|
        row << NullPiece.instance
      end
    end
  end
  
  def place_pawns(row, color)
    8.times do |idx|
      @grid[row] << Pawn.new("P", self, [row, idx], color)
    end
  end
  
  def place_main(row, color)
    8.times do |idx|
      case idx
      when 0
        @grid[row] << Rook.new("R", self, [row, idx], color)
      when 1
        @grid[row] << Knight.new("N", self, [row, idx], color)
      when 2
        @grid[row] << Bishop.new("B", self, [row, idx], color)
      when 3
        @grid[row] << Queen.new("Q", self, [row, idx], color)
      when 4
        @grid[row] << King.new("K", self, [row, idx], color)
      when 5
        @grid[row] << Bishop.new("B", self, [row, idx], color)
      when 6
        @grid[row] << Knight.new("N", self, [row, idx], color)
      when 7
        @grid[row] << Rook.new("R", self, [row, idx], color)
      end
    end
  end
  
  def in_check?(color)
    king_pos = find_king(color)
    
  end
  
  def find_king(color)
    @grid.each_with_index do |row, idx|
      row.each_with_index do |piece, idx2|
        return [idx, idx2] if piece.class == King && piece.color == color
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
    pos.all? { |num| num.between?(0, 7) }
  end
  
  def valid_piece_move?(pos)
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

if __FILE__ == $PROGRAM_NAME
  test = Board.new
  test_display = Display.new(test)
  test_display.render
end




