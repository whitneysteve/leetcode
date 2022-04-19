# frozen_string_literal: true

# Find the number of laser beams in a bank security system
# https://leetcode.com/problems/number-of-laser-beams-in-a-bank/
class NumberOfBeams
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def number_of_beams(bank)
    raise 'InvalidBank' if !bank.is_a?(Array) || bank.empty?

    height = bank.size
    width = bank[0].size
    cache = {}
    count = 0

    height.times do |x|
      row = bank[x]
      raise 'InvalidBank' if row.size != width

      row.chars.each do |cell|
        raise 'InvalidBank' if !%w[0 1].include?(cell)

        next unless cell == '1'

        next_row_idx = x + 1

        while next_row_idx < height
          next_row = bank[next_row_idx]
          num_devices = num_devices(cache, next_row_idx, next_row)
          count += num_devices
          break if num_devices.positive?

          next_row_idx += 1
        end
      end
    end
    count
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  private

  def num_devices(cache, row, str)
    return cache[row] if cache.key?(row)

    cache[row] = str.chars.select { |val| val == '1' }.size
    cache[row]
  end
end
