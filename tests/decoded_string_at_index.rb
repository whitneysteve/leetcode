# frozen_string_literal: true

require_relative '../lib/decoded_string_at_index'
require 'minitest/autorun'

# Test for DecodedStringAtIndex.
class DecodedStringAtIndexTest < Minitest::Test
  def test_decode_at_index
    decoder = DecodedStringAtIndex.new
    assert_equal 'o', decoder.decode_at_index('leet2code3', 10)
    assert_equal 'h', decoder.decode_at_index('ha22', 5)
    assert_equal 'a', decoder.decode_at_index('a2345678999999999999999', 1)
    assert_equal 'c', decoder.decode_at_index('abc', 3)
  end

  def test_handles_invalid_string
    decoder = DecodedStringAtIndex.new
    [nil, '', ' '].each do |invalid|
      error = assert_raises { decoder.decode_at_index(invalid, 0) }
      assert_equal 'InvalidEncodedStr', error.message
    end
  end

  def test_handles_invalid_index
    decoder = DecodedStringAtIndex.new
    [nil, -1, 5].each do |invalid|
      error = assert_raises { decoder.decode_at_index('test', invalid) }
      assert_equal 'InvalidIndex', error.message
    end
  end
end
