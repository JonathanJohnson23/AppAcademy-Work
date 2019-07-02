require_relative "polytreenode"
require "byebug"
class KnightPathFinder
    attr_reader :parent, :children, :start_position
    attr_writer :children
    POSSIBLE_MOVES =  [
                        [2, 1], [1, 2],
                        [-2, -1], [-1, -2],
                        [2, -1], [1, -2],
                        [-2, 1], [-1, 2] ]

#                      Proc.new = {|r,c| [2, 1], [1, 2],      
#                      [-2, -1], [-1, -2],                         
#                      [+2,-1], [+1, -2],                          
#                      [-2, +1], [-1, +2]
#                     }

    def self.valid_moves(pos)
        next_moves = []

        x, y = pos

        POSSIBLE_MOVES.each do |ele|
            new_pos = [x + ele[0], y + ele[1]]
            if new_pos.all? { |i| i >= 0 && i < 9 }
                next_moves << new_pos
            end 
        end
        next_moves
    end
    
            
    def self.root_node(pos)
        @initial_position = PolyTreeNode.new(pos)
    end

    def initialize(pos)
        knight = KnightPathFinder.root_node(pos)   # => pos = [0,0]
        @parent = knight.parent
        @children = knight.children
        @start_position = knight.start_position
    end

    
end


if $PROGRAM_NAME == __FILE__
    game = KnightPathFinder.new([0,0])
end