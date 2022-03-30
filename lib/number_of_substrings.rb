# frozen_string_literal: true

require 'set'

# Find the number of substrings that contain the letters a, b and c
# https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/
class NumberOfSubstrings
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def number_of_substrings(str)
    last_a = -1
    last_b = -1
    last_c = -1
    result = 0
    len = str.size

    i = len - 1
    while i >= 0
      last_a = i if str[i] == 'a'
      last_b = i if str[i] == 'b'
      last_c = i if str[i] == 'c'

      result += len - [last_a, last_b, last_c].max if last_a >= 0 && last_b >= 0 && last_c >= 0

      i -= 1
    end

    result
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
