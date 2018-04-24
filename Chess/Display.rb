require "colorize"
require_relative "Board"
require_relative "cursor.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, idx|
      current_row = ""

      row.each_with_index do |piece, idx2|
        if @cursor.cursor_pos == [idx, idx2]
         current_row << " ".colorize(:background => :white) if piece.symbol.nil?
         current_row << piece.symbol.colorize(:color => :green, :background => :white) unless piece.symbol.nil?
        elsif piece.symbol.nil?
          current_row << " "
        else
          current_row << piece.symbol
        end

        current_row << "  " unless idx2 == 7
      end

      puts current_row
    end
  end
  
  def test_cursor
    loop do
      system("clear")
      render
      @cursor.get_input
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  test = Display.new(board)
  test.test_cursor
end

