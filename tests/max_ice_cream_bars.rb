# frozen_string_literal: true

require_relative '../lib/max_ice_cream_bars'
require 'minitest/autorun'

# Test for MaxIceCreamBars.
class MaxIceCreamBarsTest < Minitest::Test
  def test_max_ice_cream
    shop = MaxIceCreamBars.new
    assert_equal 4, shop.max_ice_cream([1, 3, 2, 4, 1], 7)
    assert_equal 0, shop.max_ice_cream([10, 6, 8, 7, 7, 8], 5)
    assert_equal 6, shop.max_ice_cream([1, 6, 3, 1, 2, 5], 20)
  end
end
