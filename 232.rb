class Queue
    # Initialize your data structure here.
    def initialize
        @s1 = []
        @s2 =[]
    end

    # @param {Integer} x
    # @return {void}
    def push(x)
        @s1 << x
        return
    end

    # @return {void}
    def pop
        peek
        @s2.pop
    end

    # @return {Integer}
    def peek
        @s2 << @s1.pop until @s1.empty? if @s2.empty?
        @s2.last
    end

    # @return {Boolean}
    def empty
        @s1.empty? && @s2.empty?
    end
end