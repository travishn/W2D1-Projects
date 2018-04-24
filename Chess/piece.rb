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