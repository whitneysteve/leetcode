# frozen_string_literal: true

require_relative '../lib/mountain_detection'
require 'minitest/autorun'

# Test for MountainDetection.
class MountainDetectionTest < Minitest::Test
  def test_longest_mountain
    detector = MountainDetection.new
    assert_equal 5, detector.longest_mountain([2, 1, 4, 7, 3, 2, 5])
    assert_equal 11, detector.longest_mountain([0, 1, 2, 3, 4, 5, 4, 3, 2, 1, 0])
    assert_equal 3, detector.longest_mountain([0, 1, 0])
    assert_equal 3, detector.longest_mountain([2, 3, 1, 2, 3, 4, 5, 6])
  end

  def test_no_mountains
    detector = MountainDetection.new
    assert_equal 0, detector.longest_mountain([2, 2, 2])
    assert_equal 0, detector.longest_mountain([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    assert_equal 0, detector.longest_mountain([0, 2, 2])
    assert_equal 0, detector.longest_mountain([3, 3, 1])
  end
end
