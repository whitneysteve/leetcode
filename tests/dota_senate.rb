# frozen_string_literal: true

require_relative '../lib/dota_senate'
require 'minitest/autorun'

# Test for Dota senate.
class DotaSenateTest < Minitest::Test
  def test_predict_radiant
    assert_equal 'Radiant', DotaSenate.new.predict_party_victory('RD')
  end

  def test_predict_dire
    assert_equal 'Dire', DotaSenate.new.predict_party_victory('RDD')
  end

  def test_predict_radiant2
    assert_equal 'Radiant', DotaSenate.new.predict_party_victory('RDR')
  end

  def test_predict_dire2
    assert_equal 'Dire', DotaSenate.new.predict_party_victory('DDRRR')
  end

  def test_should_raise_error_for_nil_senate
    senate = DotaSenate.new
    error = assert_raises { senate.predict_party_victory(nil) }
    assert_equal 'IllegalSenate', error.message
  end

  def test_should_raise_error_for_blank_senate
    senate = DotaSenate.new
    error = assert_raises { senate.predict_party_victory(' ') }
    assert_equal 'IllegalSenate', error.message
  end

  def test_should_raise_error_for_empty_senate
    senate = DotaSenate.new
    error = assert_raises { senate.predict_party_victory(' ') }
    assert_equal 'IllegalSenate', error.message
  end
end
