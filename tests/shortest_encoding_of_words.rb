# frozen_string_literal: true

require_relative '../lib/shortest_encoding_of_words'
require 'minitest/autorun'

# Test for ShortestEncodingOfWords.
class ShortestEncodingOfWordsTest < Minitest::Test
  def test_minimum_length_encoding
    encoder = ShortestEncodingOfWords.new
    assert_equal 10, encoder.minimum_length_encoding(%w[time me bell])
    assert_equal 2, encoder.minimum_length_encoding(['t'])
  end

  # nil, empty, nil value, empty value, blank value
  def test_invalid_input; end
end
