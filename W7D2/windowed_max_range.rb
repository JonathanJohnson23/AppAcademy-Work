# def windowed_max_range(array, window_size)
#     current_max_range = nil
#     array.each_cons(window_size) do |range|
#         current_diff = range.max - range.min
#         current_max_range = current_diff if current_max_range.nil? || current_diff > current_max_range
#     end
#     current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
    def initialize
      @store = []
    end

    def peek
        @store.first
    end

    def size 
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(thing)
        @store += thing
    end

    def dequeue 
        @store.shift
    end
end


class MyStack
    def initialize
      @store = []
    end

    def peek
        @store.first
    end

    def size 
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(thing) 
        @store.push(thing)
    end
end


class StackQueue

    def initialize
        stack1 = MyStack.new
        stack2 = MyStack.new
    end



end