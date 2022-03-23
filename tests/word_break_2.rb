# frozen_string_literal: true

require_relative '../lib/word_break_2'
require 'minitest/autorun'

# Test for Word Break 2.
class WordBreak2Test < Minitest::Test
  def test_word_break
    word_break = WordBreak2.new
    assert_equal ['cats and dog', 'cat sand dog'].sort,
                 word_break.word_break('catsanddog', %w[cat cats and sand dog]).sort
    assert_equal ['pine apple pen apple', 'pineapple pen apple', 'pine applepen apple'].sort,
                 word_break.word_break('pineapplepenapple', %w[apple pen applepen pine pineapple]).sort
    assert_equal [], word_break.word_break('catsandog', %w[cats dog sand and cat])
  end
end
