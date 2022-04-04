# frozen_string_literal: true

require_relative '../lib/sorted_and_rotated'
require 'minitest/autorun'

# Test for SortedAndRotated.
class SortedAndRotatedTest < Minitest::Test
  def test_check
    checker = SortedAndRotated.new
    assert checker.check([3, 4, 5, 1, 2])
    refute checker.check([2, 1, 3, 4])
    assert checker.check([1, 2, 3])
    refute checker.check([6, 4, 7, 1, 3])
    refute checker.check([3, 2, 1])
  end
end
