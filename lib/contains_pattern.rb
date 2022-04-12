# frozen_string_literal: true

# Determine if a pattern of length m repeats k times in an array.
# https://leetcode.com/problems/detect-pattern-of-length-m-repeated-k-or-more-times/
class ContainsPattern
  # rubocop:disable Metrics/MethodLength
  def contains_pattern(arr, window_size, times)
    i = 0
    last_pattern = nil
    repeat_count = 1

    while i + window_size < arr.size
      next_window = arr[i, window_size]

      if next_window == last_pattern
        repeat_count += 1
        return true if repeat_count >= times

        i += window_size
      else
        last_pattern = next_window
        repeat_count = 1
        i += determine_increment(arr, i, window_size, last_pattern)
      end
    end

    false
  end
  # rubocop:enable Metrics/MethodLength

  private

  def determine_increment(arr, index, window_size, last_pattern)
    if arr[index + window_size, window_size] == last_pattern
      window_size
    else
      1
    end
  end
end
