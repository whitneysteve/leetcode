# frozen_string_literal: true

require_relative '../lib/key_card_alert'
require 'minitest/autorun'

# Test for key card alerting.
class KeyCardAlertTest < Minitest::Test
  # rubocop:disable Metrics/MethodLength
  def test_alert_names
    alerter = KeyCardAlert.new
    assert_equal ['daniel'], alerter.alert_names(
      %w[daniel daniel daniel luis luis luis luis],
      ['10:00', '10:40', '11:00', '09:00', '11:00', '13:00', '15:00']
    )
    assert_equal ['bob'], alerter.alert_names(
      %w[alice alice alice bob bob bob bob],
      ['12:01', '12:00', '18:00', '21:00', '21:20', '21:30', '23:00']
    )
    assert_equal %w[alice bob], alerter.alert_names(
      %w[alice alice alice alice bob bob bob bob],
      ['12:01', '12:15', '12:00', '18:00', '21:00', '21:20', '21:30', '23:00']
    )
  end
  # rubocop:enable Metrics/MethodLength

  def test_time_boundaries
    alerter = KeyCardAlert.new
    assert_equal [], alerter.alert_names(
      %w[john john john],
      ['23:58', '23:59', '00:01']
    )
  end

  def test_invalid_inputs
    invalid_inputs = [nil, []]
    alerter = KeyCardAlert.new
    invalid_inputs.each do |invalid|
      error = assert_raises { alerter.alert_names(%w[john], invalid) }
      assert_equal 'InvalidTimes', error.message
      error = assert_raises { alerter.alert_names(invalid, ['12;00']) }
      assert_equal 'InvalidNames', error.message
    end
  end

  def test_misaligned_arrays
    error = assert_raises { KeyCardAlert.new.alert_names(%w[john], ['12:00', '13:00']) }
    assert_equal 'MisalignedNamesTimes', error.message
  end

  def test_invalid_timestamps
    invalid_times = [nil, '', ' ', 'aa', 'aa:00', '00:aa', '25:00', '-1:00']
    alerter = KeyCardAlert.new
    invalid_times.each do |invalid|
      error = assert_raises { alerter.alert_names(%w[john], [invalid]) }
      assert_equal 'InvalidTime', error.message
    end
  end

  def test_invalid_names
    invalid_names = [nil, '', ' ']
    alerter = KeyCardAlert.new
    invalid_names.each do |invalid|
      error = assert_raises { alerter.alert_names([invalid], ['12:00']) }
      assert_equal 'InvalidName', error.message
    end
  end
end
