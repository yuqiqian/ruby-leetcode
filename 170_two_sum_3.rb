class TwoSum
    attr_accessor :table
    # Initialize your data structure here
    def initialize
        @table = {}
    end

    # @param {Integer} number
    # @return {Void} nothing
    def add(number)
        @table[number] = @table.has_key?(number) ? @table[number]+1 : 1
        return
    end

    # @param {Integer} value
    # @return {Boolean}
    def find(value)
        @table.each do |key, val|
            j = value - key
            if (key == j && @table[key] > 1) || (key != j && @table.has_key?(j))
                return true
            end
        end
        false
    end
end