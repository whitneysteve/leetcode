# frozen_string_literal: true

# Determine if a pattern of length m repeats k times in an array.
# https://leetcode.com/problems/detect-pattern-of-length-m-repeated-k-or-more-times/
class ContainsPattern
  # rubocop:disable Metrics/MethodLength
  def contains_pattern(arr, window_size, times)
    validate(arr, window_size, times)

    i = window_size
    last_pattern = arr[0, window_size]
    repeat_count = 1

    while i + window_size <= arr.size
      next_window = arr[i, window_size]

      if next_window == last_pattern
        repeat_count += 1
        return true if repeat_count >= times

        i += window_size
      else
        repeat_count = 1
        last_pattern = arr[i - window_size + 1, window_size]
        i += 1
      end
    end

    false
  end
  # rubocop:enable Metrics/MethodLength

  private

  def validate(arr, window_size, times)
    validate_array(arr)

    len = arr.size
    raise 'InvalidM' if window_size.nil? || window_size < 1 || window_size > len
    raise 'InvalidK' if times.nil? || times < 1 || times * window_size > len
  end

  def validate_array(arr)
    raise 'InvalidArray' if !arr.is_a?(Array) || arr.empty?
  end
end
