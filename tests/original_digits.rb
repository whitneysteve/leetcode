# frozen_string_literal: true

require_relative '../lib/original_digits'
require 'minitest/autorun'

# Test for Strings functions.
class OriginalDigitsTest < Minitest::Test
  def test_original_digits
    strs = OriginalDigits.new
    assert_equal '012', strs.original_digits('owoztneoer')
    assert_equal '45', strs.original_digits('fviefuro')
    assert_equal '16', strs.original_digits('soINxe')
    assert_equal '00', strs.original_digits('zerozero')
    assert_equal '0123456789', strs.original_digits('zeroonetwothreefourfivesixseveneightnine')
  end

  def test_original_digits_with_invalid_inputs
    strs = OriginalDigits.new
    [nil, '', '   '].each do |invalid|
      error = assert_raises { strs.original_digits(invalid) }
      assert_equal 'InvalidInput', error.message
    end
  end
end
