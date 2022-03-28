# frozen_string_literal: true

# Determine the length of the longest mountain.
# https://leetcode.com/problems/longest-mountain-in-array/
class MountainDetection
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def longest_mountain(arr)
    return  0 if arr.to_a.size <= 2

    longest = 0
    mountain_detected = false
    asc = arr[1] > arr[0]

    i = 1
    len = 1

    while i < arr.size
      going_down = arr[i] < arr[i - 1]
      going_up = arr[i] > arr[i - 1]

      if asc && going_down
        mountain_detected = true
        len += 1
      elsif (asc && going_up) || (!asc && going_down)
        len += 1
      elsif !asc && going_up
        len = 2
        mountain_detected = false
      else
        len = 1
        mountain_detected = false
      end

      longest = len if len > longest && mountain_detected
      asc = going_up
      i += 1
    end

    longest
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
