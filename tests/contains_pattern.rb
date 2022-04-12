# frozen_string_literal: true

require_relative '../lib/contains_pattern'
require 'minitest/autorun'

# Test for ContainsPattern
class ContainsPatternTest < Minitest::Test
  def test_contains_pattern
    pattern = ContainsPattern.new
    assert pattern.contains_pattern([1, 2, 4, 4, 4, 4], 1, 3)
    assert pattern.contains_pattern([1, 2, 1, 2, 1, 1, 1, 3], 2, 2)
    assert pattern.contains_pattern([3, 2, 1, 2, 1, 2, 1, 1, 1, 3], 2, 3)
    refute pattern.contains_pattern([1, 2, 1, 2, 1, 3], 2, 3)
  end

  # invalid arr = nil, []
  # negative/0/> len m
  # negative/0/ k
end
