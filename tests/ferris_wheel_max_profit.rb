# frozen_string_literal: true

require_relative '../lib/ferris_wheel_max_profit'
require 'minitest/autorun'

# Test for FerrisWheelMaxProfit.
class FerrisWheelMaxProfitTest < Minitest::Test
  def test_min_operations_max_profit
    wheel = FerrisWheelMaxProfit.new
    assert_equal 3, wheel.min_operations_max_profit([8, 3], 5, 6)
    assert_equal 7, wheel.min_operations_max_profit([10, 9, 6], 6, 4)
    assert_equal(-1, wheel.min_operations_max_profit([3, 4, 0, 5, 1], 1, 92))
    assert_equal(-1, wheel.min_operations_max_profit([2], 2, 4))
  end
end
