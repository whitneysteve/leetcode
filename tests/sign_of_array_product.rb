# frozen_string_literal: true

require_relative '../lib/sign_of_array_product'
require 'minitest/autorun'

# Test for SignOfArrayProduct.
class SignOfArrayProductTest < Minitest::Test
  def test_array_sign
    calculator = SignOfArrayProduct.new
    assert_equal 1, calculator.array_sign([-1, -2, -3, -4, 3, 2, 1])
    assert_equal 0, calculator.array_sign([1, 5, 0, 2, -3])
    assert_equal(-1, calculator.array_sign([-1, 1, -1, 1, -1]))
  end
end
