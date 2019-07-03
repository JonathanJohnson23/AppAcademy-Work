require_relative "polytreenode"
require "byebug"
require 'set'
class KnightPathFinder
    attr_accessor :parent, :children, :root_node, :considered_positions
    attr_reader :start_position
    POSSIBLE_MOVES =  [
                        [2, 1], [1, 2],
                        [-2, -1], [-1, -2],
                        [2, -1], [1, -2],
                        [-2, 1], [-1, 2] ]


    def self.valid_moves(pos)
        next_moves = []
        x, y = pos
        POSSIBLE_MOVES.each do |ele|
            new_pos = [x + ele[0], y + ele[1]]
            if new_pos.all? { |i| i >= 0 && i < 8 }
                next_moves << new_pos
            end 
        end
        next_moves
    end
 
    def initialize(pos) 
        self.root_node = PolyTreeNode.new(pos) 
        @start_position = pos    # => pos = [0,0]
        @considered_positions = [@start_position]      # => [[0,0],[2,1],[3,4]]
        self.build_move_tree
    end

    def new_move_positions(pos)
        arr_valid = KnightPathFinder.valid_moves(pos)
        remaining_positions = arr_valid.select{ |ele| ele if !@considered_positions.include?(ele) }
        @considered_positions.concat(remaining_positions)
        return remaining_positions
    end

    def build_move_tree
        queue = [root_node.dup]
        until queue.empty?
            ele = queue.shift
            new_move_positions(ele.value).each do |move|
                new_node = PolyTreeNode.new(move)
                ele.add_child(new_node)
                queue << new_node
            end
        end
    end

    def find_path(destination)
        final_point = root_node.dfs(destination)     # => destination / nil  

        follow_path_back(final_point)
    end


    def follow_path_back(bottom)
        nodes = []
        
        current_node = bottom
        until current_node.nil?
            nodes << current_node
            current_node = current_node.parent
        end
        value_arr = nodes.map(&:value) 
        value_arr.reverse
    end

end

if $PROGRAM_NAME == __FILE__
    game = KnightPathFinder.new([0,0])
    print game.find_path([7,6])
end