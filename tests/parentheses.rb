# frozen_string_literal: true

require_relative '../lib/parentheses'
require 'minitest/autorun'

# Test for Parentheses.
class ParenthesesTest < Minitest::Test
  def test_matching_parentheses
    parentheses = Parentheses.new
    assert_equal 2, parentheses.longest_valid_parentheses('(()')
    assert_equal 4, parentheses.longest_valid_parentheses(')()())')
    assert_equal 0, parentheses.longest_valid_parentheses('')
  end
end
