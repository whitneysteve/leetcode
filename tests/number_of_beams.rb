# frozen_string_literal: true

require_relative '../lib/number_of_beams'
require 'minitest/autorun'

# Test for NumberOfBeams
class NumberOfBeamsTest < Minitest::Test
  def test_number_of_beams
    detector = NumberOfBeams.new
    assert_equal 8, detector.number_of_beams(%w[011001 000000 010100 001000])
  end

  def test_invalid_bank
    invalid_grids = [nil, [], %w[1 11], ['a10']]
    detector = NumberOfBeams.new
    invalid_grids.each do |invalid|
      error = assert_raises { detector.number_of_beams(invalid) }
      assert_equal 'InvalidBank', error.message
    end
  end
end
