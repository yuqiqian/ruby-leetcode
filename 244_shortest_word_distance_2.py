class WordDistance:
    # initialize your data structure here.
    # @param {string[]} words
    def __init__(self, words):
    	import collections
        self.dict = collections.defaultdict(list)
        for i, w in enumerate(words):
        	self.dict[w].append(i)


    # @param {string} word1
    # @param {string} word2
    # @return {integer}
    # Adds a word into the dat satructure.
    def shortest(self, word1, word2):
        idx1 = self.dict[word1]
        idx2 = self.dict[word2]
        i=j=0
        diff = abs(idx1[0]-idx2[0])
        while i< len(idx1) && j<len(idx2):
        	if idx1[i] < idx2[j]:
        		i += 1
        	else:
        		j += 1

        	diff = min(diff, abs(idx1[i]-idx2[j]))

        return diff

# Your WordDistance object will be instantiated and called as such:
# wordDistance = WordDistance(words)
# wordDistance.shortest("word1", "word2")
# wordDistance.shortest("anotherWord1", "anotherWord2")