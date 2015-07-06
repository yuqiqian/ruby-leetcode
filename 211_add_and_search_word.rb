class TrieNode
    attr_accessor :children, :is_word
    def initialize
        @children = {}
        @is_word = false
    end
end


class WordDictionary

    def initialize
        @root = TrieNode.new
    end

    # @param {string} word
    # @return {void}
    # Adds a word into the data structure.
    def add_word(word)
       node = @root
       word.each_char do |char|
            child =node.children[char]
            if child.nil?
                child = TrieNode.new
                node.children[char] = child
            end
            node = child
        end
        node.is_word = true
        return
    end

    # @param {string} word
    # @return {boolean}
    # Returns if the word is in the data structure. A word could
    # contain the dot character '.' to represent any one letter.
    def search(word)
        return find(@root, word)
    end

    private
    def find(node, word)
        if word == ""
            return node.is_word
        end
        if word[0] == "."
            node.children.each do |char, child|
                if find(child, word[1..-1])
                    return true
                end
            end
        else
            child = node.children[word[0]]
            if !child.nil?
                return find(child, word[1..-1])
            end
        end
        return false
    end
end

# Your WordDictionary object will be instantiated and called as such:
# word_dictionary = WordDictionary.new
# word_dictionary.add_word("word")
# word_dictionary.search("pattern")