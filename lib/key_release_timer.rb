# frozen_string_literal: true

# Time the performance of key presses.
# https://leetcode.com/problems/slowest-key/
class KeyReleaseTimer
  # rubocop:disable Metrics/MethodLength
  def slowest_key(release_times, keys_pressed)
    times, keys = validate_arguments(release_times, keys_pressed)

    longest_duration = -1
    longest_key = nil

    times.each_with_index do |time, i|
      raise 'InvalidTimes' if time.to_s.to_i != time || time.negative?

      key_pressed = keys[i]
      release_time = calculate_release_time(time, i, times)

      if release_time > longest_duration || (release_time == longest_duration && longest_key < key_pressed)
        longest_duration = release_time
        longest_key = key_pressed
      end
    end

    longest_key
  end
  # rubocop:enable Metrics/MethodLength

  private

  def calculate_release_time(time, index, times)
    if index.positive?
      last_release_time = times[index - 1]
      raise 'InvalidTimes' if last_release_time > time

      time - last_release_time
    else
      time
    end
  end

  def validate_arguments(release_times, keys_pressed)
    times = release_times&.compact
    keys = keys_pressed&.strip
    raise 'InvalidTimes' if times.to_a.empty?
    raise 'InvalidKeys' if keys.nil? || keys.empty?
    raise 'KeysTimesMismatch' if times.size != keys.size

    [times, keys]
  end
end
