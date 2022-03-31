# frozen_string_literal: true

# Given a string and some rules on how the string is encoded, calculate the encoded chracter at a given index.
# https://leetcode.com/problems/decoded-string-at-index/
class DecodedStringAtIndex
  # rubocop:disable Metrics/MethodLength
  def decode_at_index(str, idx)
    validate_inputs(str, idx)
    size = calculate_encoded_size(str)

    raise 'InvalidIndex' if idx > size

    i = str.size - 1
    k = idx
    while i >= 0
      k = k % size
      char = str[i]
      is_digit = char.match?(/[[:digit:]]/)

      return char if k.zero? && !is_digit

      size = is_digit ? size / char.to_i : size - 1

      i -= 1
    end

    nil
  end
  # rubocop:enable Metrics/MethodLength

  private

  def calculate_encoded_size(str)
    size = 0
    str.chars.each do |char|
      if char.match?(/[[:digit:]]/)
        size *= char.to_i
      else
        size += 1
      end
    end
    size
  end

  def validate_inputs(str, idx)
    raise 'InvalidEncodedStr' if (str&.strip&.size || 0) < 1
    raise 'InvalidIndex' if idx.nil? || idx < 1
  end
end
