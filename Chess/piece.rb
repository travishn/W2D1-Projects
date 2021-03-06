require_relative "move_module.rb"

class Piece
  attr_reader :symbol, :color, :pos
  
  def initialize(symbol, board, pos, color)
    @symbol = symbol
    @board = board
    @pos = pos
    @color = color
  end
  
end

class Rook < Piece
  include SlidingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
  
  def moves_dir
    [[0,1], [0,-1], [-1,0], [1,0]]
  end
  

end

class Bishop < Piece
  include SlidingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
  
  def moves_dir
    [[1,1], [-1,1], [-1,-1], [1,-1]]
  end
  
  
end

class Queen < Piece
  include SlidingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
  
  def moves_dir
    [[0,1], [0,-1], [-1,0], [1,0], [1,1], [-1,1], [-1,-1], [1,-1]]
  end
  
end

class Knight < Piece
  include SteppingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
  
  def moves_dir
    [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [1,-2], [2,-1]]
  end
end

class King < Piece
  include SteppingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
    
  def moves_dir
    [[0,1], [0,-1], [-1,0], [1,0], [1,1], [-1,1], [-1,-1], [1,-1]]
  end
end

class Pawn < Piece
  include SteppingPiece
  
  def initialize(symbol, board, pos, color)
    super(symbol, board, pos, color)
  end
    
  def moves_dir
    [[-1, -1], [-1, 0], [-1, 1]]
  end
end

class NullPiece < Piece
  attr_reader :color, :symbol
  include Singleton
  
  def initialize
    @color = nil
    @symbol = nil
  end
end