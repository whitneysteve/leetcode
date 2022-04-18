# frozen_string_literal: true

require_relative '../lib/all_as_before_bs'
require 'minitest/autorun'

# Test for all as before bs.
class AllAsBeforeBsTest < Minitest::Test
  def test_check_string
    checker = AllAsBeforeBs.new
    assert checker.check_string('aaabbb')
    refute checker.check_string('abab')
    assert checker.check_string('bbbb')
  end

  def test_edges
    checker = AllAsBeforeBs.new
    assert checker.check_string('')
    assert checker.check_string(' ')
    assert checker.check_string('cdsfdsfd')
  end

  # nil
  def test_invalid; end
end
