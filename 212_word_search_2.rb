# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
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


def find_words(board, words)
	t = Trie.new
	words.each{|w| t.insert(w)}
	m = board.length
	n = board[0].length
	res = []
	visited = Array.new(m){Array.new(n)}
	(0..m-1).each do |i|
		(0..n-1).each do |j|
			dfs(board, visited, "", i,j,t,res)
		end
	end
	res.uniq
end

def dfs(board, visited, str, x, y, trie, res)
	return if x<0 || x>=board.length || y<0 || y>=board[0].length
	return if visited[x][y]

	str += board[x][y]
	return if !trie.starts_with(str)
	if trie.search(str)
		res << str
	end
	visited[x][y] = true
	dfs(board, visited, str, x-1, y, trie, res)
	dfs(board, visited, str, x+1, y, trie, res)
	dfs(board, visited, str, x, y-1, trie, res)
	dfs(board, visited, str, x, y+1, trie, res)
	visited[x][y] = false
end
