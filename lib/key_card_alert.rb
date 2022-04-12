# frozen_string_literal: true

# A class alerting when key cards are used frequently.
# https://leetcode.com/problems/alert-using-same-key-card-three-or-more-times-in-a-one-hour-period/
class KeyCardAlert
  def alert_names(names, times)
    raise 'InvalidTimes' if !times.is_a?(Array) || times.empty?
    raise 'InvalidNames' if !names.is_a?(Array) || names.empty?
    raise 'MisalignedNamesTimes' if names.size != times.size

    check_for_alerts(split_usage_by_user(names, times)).sort.uniq
  end

  private

  def check_for_alerts(usage)
    alerts = []

    usage.each_key do |name|
      raise 'InvalidName' if name.nil? || name.strip.empty?

      user_usage = usage[name].sort
      events = []
      process_user_usage_event(user_usage, events) until user_usage.empty? || events.size > 2
      alerts << name if events.size > 2
    end

    alerts
  end

  def process_user_usage_event(user_usage, events)
    current_time = user_usage.shift
    events << current_time
    events.shift while more_than_60_mins(events[0], current_time)
  end

  def split_usage_by_user(names, times)
    usage = {}

    names.each_with_index do |name, index|
      current_time = parse_time(times[index])

      if usage.key?(name)
        usage[name] << current_time
      else
        usage[name] = [current_time]
      end
    end

    usage
  end

  def more_than_60_mins(prev_time, current_time)
    (current_time - prev_time).abs > 60
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def parse_time(time)
    raise 'InvalidTime' if time.nil? || time.strip.empty?

    hour_str, minutes_str = time.split(':')
    raise 'InvalidTime' if !/^\d{1,2}$/.match(minutes_str) || !/^\d{1,2}$/.match(hour_str)

    hour = hour_str.to_i
    minutes = minutes_str.to_i
    raise 'InvalidTime' if hour.nil? || minutes.nil? || hour.negative? || minutes.negative? || hour > 23 || minutes > 59

    (hour.to_i * 60) + minutes.to_i
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
end
