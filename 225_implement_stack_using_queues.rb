class Stack
    # Initialize your data structure here.
    def initialize
        @queue = []
    end

    # @param {Integer} x
    # @return {void}
    def push(x)
        @queue << x
    end

    # @return {void}
    def pop
        (@queue.length-1).times do
            @queue << @queue.shift
        end
        @queue.shift
        return
    end

    # @return {Integer}
    def top
        top = nil
        (@queue.length).times do
            top = @queue.shift
            @queue << top
        end
        top
    end

    # @return {Boolean}
    def empty
        return @queue == []
    end
end