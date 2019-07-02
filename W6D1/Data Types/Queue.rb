class Queue

    attr_reader :fifo
    

    def initialize
      @fifo = []
    end

    def enqueue(el)
        @fifo << el
    end

    def dequeue
        @fifo.shift
    end

    def peek
        @fifo[0]
    end

    

end