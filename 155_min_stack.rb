class MinStack
    # Initialize your data structure here
    def initialize
        @data = []
        @min_data = []
    end

    # @param {Integer} x
    # @return {Void} nothing
    def push(x)
        @data << x
        if @min_data.empty?
            @min_data << x
        else
            @min_data << [@min_data[-1], x].min
        end
        return
    end

    # @return {Void} nothing
    def pop
        res = @data.pop
        @min_data.pop
        return        
    end

    # @return {Integer}
    def top
        @data[-1]
    end

    # @return {Integer}
    def get_min
        @min_data[-1]
    end
end