# frozen_string_literal: true

require_relative '../lib/key_release_timer'
require 'minitest/autorun'

# Test for Key Release Timer.
class KeyReleaseTimerTest < Minitest::Test
  TESTS = [
    [[9, 29, 49, 50], 'cbcd', 'c'],
    [[12, 23, 36, 46, 62], 'spuda', 'a'],
    [[23, 34, 43, 59, 62, 80, 83, 92, 97], 'qgkzzihfc', 'q']
  ].freeze

  def test_longest_duration
    timer = KeyReleaseTimer.new
    TESTS.each do |test|
      release_times, keys_pressed, expected = test
      assert_equal expected, timer.slowest_key(release_times, keys_pressed)
    end
  end

  def test_should_raise_error_for_invalid_times
    timer = KeyReleaseTimer.new
    [nil, [], [nil], ['a'], [-1], [10, 9, 8]].each do |times|
      error = assert_raises { timer.slowest_key(times, (times&.size || 0).times.map { 'x' }.join) }
      assert_equal 'InvalidTimes', error.message
    end
  end

  def test_should_raise_error_for_invalid_keys
    timer = KeyReleaseTimer.new
    [nil, '', ' '].each do |keys|
      error = assert_raises { timer.slowest_key([0], keys) }
      assert_equal 'InvalidKeys', error.message
    end
  end

  def test_should_raise_error_for_mismatched_values
    timer = KeyReleaseTimer.new
    error = assert_raises { timer.slowest_key([1], '12') }
    assert_equal 'KeysTimesMismatch', error.message
    error = assert_raises { timer.slowest_key([1, 2], '1') }
    assert_equal 'KeysTimesMismatch', error.message
  end
end
