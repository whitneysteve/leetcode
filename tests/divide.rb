# frozen_string_literal: true

require_relative '../lib/divide'
require 'minitest/autorun'

# Test for Divide.
class DivideTest < Minitest::Test
  def test_divide
    calculator = Divide.new
    assert_equal 3, calculator.divide(10, 3)
    assert_equal(-2, calculator.divide(7, -3))
  end
end
