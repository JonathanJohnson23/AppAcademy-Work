require "byebug"
class PolyTreeNode
    attr_accessor :children, :parent, :value
    def initialize(value)
        @value = value 
        @parent = nil 
        @children = []
    end

    def parent=(parent_node)
        # parent_node is an instance of Polytreenode class
        # checking if the parent_node has parent
        # if yes, delete itself from the children array
        if self.parent
            old_children = self.parent.children
            old_children.delete(self)
            @parent = parent_node
        else
            @parent = parent_node    # if self doesn't have parent attached, no need to deleted itself from the children array
        end

        # after assigning parent_node to @parent
        # if self.parent is nil, then it is at the top of the tree 
        if !self.parent.nil?
            parent_node.children << self if !parent_node.children.include?(self)
        end
    end

    def add_child(child)
        child.parent = self 
        if !self.children.include?(child)
            @children << child
        end
    end

    def remove_child(child)
        if self.children.include?(child)
            child.parent = nil
        else
            raise "this node is not a child"
        end
    end


    def dfs(value)
        return self if self.value == value
        return nil if self.children.empty?
        
        self.children.each do |child|
            result = child.dfs(value)    # => nil / target
            return result if !result.nil?
        end
        nil
    end

    
    def bfs(value)
        return self if self.value == value
        return nil if self.children.empty?
        
        queue = self.children.dup  
        
        until queue.empty?
            ele = queue.shift
            if ele.value == value  
                return ele         
            else
                ele.children.each { |child| queue << child }
            end
        end
        nil 
    end

end

