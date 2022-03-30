# frozen_string_literal: true

require_relative '../lib/number_of_substrings'
require 'minitest/autorun'

# Test to find the number of substrings that contain a set of characters.
class NumberOfSubstringsTest < Minitest::Test
  def test_number_of_substrings
    num_substr = NumberOfSubstrings.new
    assert_equal 10, num_substr.number_of_substrings('abcabc')
    assert_equal 3, num_substr.number_of_substrings('aaacb')
    assert_equal 1, num_substr.number_of_substrings('abc')
    # nil, '', ' ', 'a', 'ab', 'cb', 'xyz'
  end
end
