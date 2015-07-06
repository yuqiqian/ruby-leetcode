class TrieNode
    attr_accessor :children, :is_word
    # Initialize your data structure here.
    def initialize
        @children = {}
        @is_word = false
    end
end

class Trie
    def initialize
        @root = TrieNode.new
    end

    # @param {string} word
    # @return {void}
    # Inserts a word into the trie.
    def insert(word)
        node = @root
        word.each_char do |c|
            child = node.children[c]
            if child.nil?
                child = TrieNode.new
                node.children[c] = child
            end
            node = child
        end
        node.is_word = true
        return
    end

    # @param {string} word
    # @return {boolean}
    # Returns if the word is in the trie.
    def search(word)
        node = @root
        word.each_char do |c|
            node = node.children[c]
            if node.nil?
                return false
            end
        end
        node.is_word
    end

    # @param {string} prefix
    # @return {boolean}
    # Returns if there is any word in the trie
    # that starts with the given prefix.
    def starts_with(prefix)
        node = @root
        prefix.each_char do |c|
            node = node.children[c]
            if node.nil?
                return false
            end
        end
        true
    end
end

# Your Trie object will be instantiated and called as such:
# trie = Trie.new
# trie.insert("somestring")
# trie.search("key")