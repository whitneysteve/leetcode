# frozen_string_literal: true

require_relative '../lib/subrectangle_queries'
require 'minitest/autorun'

# Test for Rectangle.
class SubrectangleQueriesTest < Minitest::Test
  def test_get_value
    rect = SubrectangleQueries.new(test_rectangle)
    assert_equal 1, rect.get_value(0, 0)
    assert_equal 4, rect.get_value(1, 0)
    assert_equal 3, rect.get_value(1, 1)
    assert_equal 9, rect.get_value(3, 2)
  end

  def test_update_subrectangle
    rect = SubrectangleQueries.new(test_rectangle)
    assert_equal 1, rect.get_value(0, 2)
    rect.update_subrectangle(0, 0, 3, 2, 5)
    4.times.each do |row|
      3.times.each do |col|
        assert_equal 5, rect.get_value(row, col)
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def test_complex_scenario
    rect = SubrectangleQueries.new(
      [
        [6, 9, 6,  1, 2],
        [8, 8, 6,  5, 9],
        [7, 6, 10, 8, 2],
        [7, 7, 4,  9, 1]
      ]
    )
    rect.update_subrectangle(1, 4, 2, 4, 5)
    assert_equal 1, rect.get_value(3, 4)
    assert_equal 5, rect.get_value(2, 4)
    assert_equal 1, rect.get_value(3, 4)
    rect.update_subrectangle(3, 4, 3, 4, 8)
    assert_equal 7, rect.get_value(2, 0)
    rect.update_subrectangle(1, 3, 3, 4, 3)
    assert_equal 6, rect.get_value(0, 2)
  end
  # rubocop:enable Metrics/MethodLength

  def test_get_value_out_of_bounds
    rect = SubrectangleQueries.new(test_rectangle)
    assert_nil rect.get_value(-1, 0)
    assert_nil rect.get_value(0, -1)
    assert_nil rect.get_value(4, 0)
    assert_nil rect.get_value(0, 3)
  end

  def test_update_subrectangle_out_of_bounds
    rect = SubrectangleQueries.new(test_rectangle)
    invalid_points = [[-1, 0], [0, -1], [4, 0], [0, 3]]
    invalid_points.each do |invalid|
      error = assert_raises { rect.update_subrectangle(invalid[0], invalid[1], 3, 3, 10) }
      assert_equal 'InvalidSubrectangle', error.message

      error = assert_raises { rect.update_subrectangle(0, 0, invalid[0], invalid[1], 10) }
      assert_equal 'InvalidSubrectangle', error.message
    end
  end

  def test_should_raise_error_for_invalid_rectangle
    invalid_rectangles = [nil, [], [[1], [1, 2]]]
    invalid_rectangles.each do |invalid|
      error = assert_raises { SubrectangleQueries.new(invalid) }
      assert_equal 'InvalidRectangle', error.message
    end
  end

  private

  def test_rectangle
    [
      [1, 2, 1],
      [4, 3, 4],
      [3, 2, 1],
      [1, 1, 9]
    ].freeze
  end
end
