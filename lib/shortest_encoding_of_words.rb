# frozen_string_literal: true

require 'set'

# Find the minimum length of a reference string that encodes all the words in an array.
# https://leetcode.com/problems/short-encoding-of-words/
class ShortestEncodingOfWords
  def minimum_length_encoding(words)
    longest_words = Set.new(words)
    words.each do |word|
      (1..word.size - 1).each do |start_idx|
        longest_words.delete(word[start_idx, word.size])
      end
    end

    return longest_words.to_a.map(&:size).sum + longest_words.size
  end
end
