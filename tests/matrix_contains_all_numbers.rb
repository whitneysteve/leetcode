# frozen_string_literal: true

require_relative '../lib/matrix_contains_all_numbers'
require 'minitest/autorun'

# Test for MatrixContainsAllNumbers.
class MatrixContainsAllNumbersTest < Minitest::Test
  def test_check_valid
    checker = MatrixContainsAllNumbers.new
    assert checker.check_valid([[1, 2, 3], [3, 1, 2], [2, 3, 1]])
    refute checker.check_valid([[1, 1, 1], [1, 2, 3], [1, 2, 3]])
    refute checker.check_valid([[1, 2, 3], [1, 2, 3], [1, 2, 3]])
  end

  def test_raises_error_for_nil_matrix; end
  def test_raises_error_for_matrix_with_nil_row; end
  def test_raises_error_for_matrix_with_nil_value; end
  def test_raises_error_for_rectangle_matrix; end
end
