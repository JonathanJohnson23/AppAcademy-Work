class Stack
    attr_reader :the_stack
    def initialize
      # create ivar to store stack here!
      @the_stack = []
    end

    def push(el)
      # adds an element to the stack
      @the_stack << el
    end

    def pop
      # removes one element from the stack
      @the_stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @the_stack[-1]
    end
  end


  