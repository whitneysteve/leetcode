# frozen_string_literal: true

# Class to some random string functions.
class Strings
  # https://leetcode.com/problems/reconstruct-original-digits-from-english/
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def original_digits(str)
    raise 'InvalidInput' if str.nil? || str.strip.empty?

    letter_freq = {}
    str.chars.each do |ch|
      ch_sym = ch.downcase.to_sym
      letter_freq[ch_sym] = letter_freq.key?(ch_sym) ? letter_freq[ch_sym] + 1 : 1
    end

    number_freq = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    while letter_freq.key?(:z) && (letter_freq[:z]).positive?
      number_freq[0] += 1
      decrement(letter_freq, 'zero')
    end

    while letter_freq.key?(:w) && (letter_freq[:w]).positive?
      number_freq[2] += 1
      decrement(letter_freq, 'two')
    end

    while letter_freq.key?(:u) && (letter_freq[:u]).positive?
      number_freq[4] += 1
      decrement(letter_freq, 'four')
    end

    while letter_freq.key?(:x) && (letter_freq[:x]).positive?
      number_freq[6] += 1
      decrement(letter_freq, 'six')
    end

    while letter_freq.key?(:g) && (letter_freq[:g]).positive?
      number_freq[8] += 1
      decrement(letter_freq, 'eight')
    end

    while letter_freq.key?(:o) && (letter_freq[:o]).positive?
      number_freq[1] += 1
      decrement(letter_freq, 'one')
    end

    while letter_freq.key?(:t) && (letter_freq[:t]).positive?
      number_freq[3] += 1
      decrement(letter_freq, 'three')
    end

    while letter_freq.key?(:f) && (letter_freq[:f]).positive?
      number_freq[5] += 1
      decrement(letter_freq, 'five')
    end

    while letter_freq.key?(:s) && (letter_freq[:s]).positive?
      number_freq[7] += 1
      decrement(letter_freq, 'seven')
    end

    number_freq[9] += letter_freq[:i] if letter_freq.key?(:i)

    result = ''

    i = 0
    while i < 10
      result += (i.to_s * number_freq[i]) if number_freq[i]
      i += 1
    end

    result
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  def decrement(map, str)
    str.chars.each do |ch|
      ch_sym = ch.downcase.to_sym
      map[ch_sym] = map[ch_sym] - 1
    end
  end
end
