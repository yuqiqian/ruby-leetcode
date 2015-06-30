class MinStack
    attr_accessor :data, :min_data
    # Initialize your data structure here
    def initialize
        @data = []
        @min_data = []
    end

    # @param {Integer} x
    # @return {Void} nothing
    def push(x)
        @data << x
        if @min_data.length == 0 || x <= @min_data[-1]
            @min_data << x
        end
        return
    end

    # @return {Void} nothing
    def pop
        if @data.length == 0
            return
        else
            if @data[-1] == @min_data[-1]
                @min_data.pop
            end
            @data.pop
            return 
        end
    end

    # @return {Integer}
    def top
        if @data.length == 0
            return nil
        else
            return @data[-1]
        end
    end

    # @return {Integer}
    def get_min
        if @min_data.length == 0
            return nil
        else
            return @min_data[-1]
        end
    end
end