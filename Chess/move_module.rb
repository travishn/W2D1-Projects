module SlidingPiece
  def moves_dir
    raise "You're using the wrong moves_dir! Check your current piece if it has its own to overwrite this one."
  end
  
  def moves
    valid_moves = []
    
    moves_dir.each do |dir|
      next_pos = [@pos[0]+dir[0], @pos[1]+dir[1]]
      
      while next_pos.all? { |coordinate| coordinate.between?(0, 7) }
        break if @board[next_pos].color == self.color
        valid_moves << next_pos
        next_pos = [next_pos[0]+dir[0], next_pos[1]+dir[1]]
        break if @board[next_pos].color != self.color
      end
    end
    
    valid_moves
  end
  
end

module SteppingPiece
  def moves_dir
    raise "You're using the wrong moves_dir! Check your current piece if it has its own to overwrite this one."
  end
  
  def moves
    valid_moves = []
  
    @moves_dir.each do |dir|
      next_pos = [@pos[0]+dir[0], @pos[1]+dir[1]]
      next if @board[next_pos].color == self.color
      valid_moves << next_pos
    end
    
    valid_moves
  end
  
end


# def moves
#   if @direction.include?("straight")
#     (0..7).each do |coordinate|
#       @moves << [@pos[0], coordinate]
#       @moves << [coordinate, @pos[1]]
#     end
#   end
# 
#   if @direction.include?("diagonal") #Could refactor this to iterate through [[1,1], [-1,1], [-1,-1], [1,-1]]
#                                       #where it would use @pos and add the current index until any coordinate has a number thats bigger than 7,
#                                       #(pushing along the way), then move onto the next diagonal direction index
#     rd_pos_up = [@pos[0]-1, @pos[1]+1]
#     rd_pos_down = [@pos[0]+1, @pos[1]+1]
#     ld_pos_up = [@pos[0]-1, @pos[1]-1]
#     ld_pos_down = [@pos[1], @pos[0]]
# 
#     while rd_pos_up.all? { |coordinate| coordinate.between?(0, 7) }
#       @moves << rd_pos_up
#       rd_pos_up = [rd_pos_up[0]-1, rd_pos_up[1]+1]
#     end
# 
#     while ld_pos_down.all? { |coordinate| coordinate.between?(0, 7) }
#       @moves << ld_pos_down
#       ld_pos_down = [ld_pos_down[0]+1, ld_pos[1]-1]
#     end
# 
#     while rd_pos_down.all? { |coordinate| coordinate.between?(0, 7) }
#       @moves << rd_pos_down
#       rd_pos_down = [rd_pos_down[0]+1, rd_pos_down[1]+1]
#     end
# 
#     while ld_pos_up.all? { |coordinate| coordinate.between?(0, 7) }
#       moves << ld_pos_up
#       ld_pos_up = [ld_pos_up[0]-1, ld_pos_up[1]-1]
#     end
# 
#   end
# end


# def moves
#   if @directions == "L"
#     valid_positions = []
# 
#     valid_positions[0] = [@pos[0] + 2, @pos[1] + 1]
#     valid_positions[1] = [@pos[0] + 1, @pos[1] + 2]
#     valid_positions[2] = [@pos[0] - 1, @pos[1] + 2]
#     valid_positions[3] = [@pos[0] - 2, @pos[1] + 1]
#     valid_positions[4] = [@pos[0] - 2, @pos[1] - 1]
#     valid_positions[5] = [@pos[0] - 1, @pos[1] - 2]
#     valid_positions[6] = [@pos[0] + 1, @pos[1] - 2]
#     valid_positions[7] = [@pos[0] + 2, @pos[1] - 1]
# 
#     valid_positions.each do |pos|
#       @moves << pos if pos.all? { |coordinate| coordinate.between?(0, 7) }
#     end
# 
#   else
# 
#     (@pos[0]-1..@pos[0]+1).each do |coord1|
#       (@pos[1]-1..@pos[1]+1).each do |coord2|
#         potential_move = [coord1, coord2]
#         @moves << potential_move if potential_move.all? { |coordinate| coordinate.between?(0, 7) }
#       end
#     end
# 
#   end
# end





