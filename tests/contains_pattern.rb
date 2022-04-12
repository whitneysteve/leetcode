# frozen_string_literal: true

require_relative '../lib/contains_pattern'
require 'minitest/autorun'

# Test for ContainsPattern
class ContainsPatternTest < Minitest::Test
  # rubocop:disable Metrics/AbcSize
  def test_contains_pattern
    pattern = ContainsPattern.new
    assert pattern.contains_pattern([1, 2, 4, 4, 4, 4], 1, 3)
    assert pattern.contains_pattern([1, 2, 1, 2, 1, 1, 1, 3], 2, 2)
    assert pattern.contains_pattern([3, 2, 1, 2, 1, 2, 1, 1, 1, 3], 2, 3)
    refute pattern.contains_pattern([1, 2, 1, 2, 1, 3], 2, 3)
    assert pattern.contains_pattern([2, 2], 1, 2)
    refute pattern.contains_pattern([2, 2, 1, 2, 2, 1, 1, 1, 2, 1], 2, 2)
    refute pattern.contains_pattern([1, 2], 1, 2)
    refute pattern.contains_pattern([6, 3, 5, 5, 5, 5, 1, 5, 6, 2, 5, 1, 2, 5, 3, 5, 1, 3, 5, 5, 6, 4, 1, 2], 1, 5)
    assert pattern.contains_pattern([3, 2, 2, 1, 2, 2, 1, 1, 1, 2, 3, 2, 2], 3, 2)
  end
  # rubocop:enable Metrics/AbcSize

  def test_invalid_array
    pattern = ContainsPattern.new
    invalid_inputs = [nil, []]
    invalid_inputs.each do |invalid|
      error = assert_raises { pattern.contains_pattern(invalid, 1, 1) }
      assert_equal 'InvalidArray', error.message
    end
  end

  def test_invalid_m
    pattern = ContainsPattern.new
    invalid_inputs = [nil, -1, 0, 10]
    invalid_inputs.each do |invalid|
      error = assert_raises { pattern.contains_pattern([1, 2], invalid, 1) }
      assert_equal 'InvalidM', error.message
    end
  end

  def test_invalid_k
    pattern = ContainsPattern.new
    invalid_inputs = [-1, 0, 10]
    invalid_inputs.each do |invalid|
      error = assert_raises { pattern.contains_pattern([1, 2], 1, invalid) }
      assert_equal 'InvalidK', error.message
    end
  end
end
