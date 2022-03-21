# frozen_string_literal: true

# Class to represent the Dota2 Senate decisions.
# https://leetcode.com/problems/dota2-senate
class DotaSenate
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def predict_party_victory(senate)
    raise 'IllegalSenate' if senate.nil? || senate&.strip&.empty?

    r_bans = 0
    d_bans = 0
    r_banned = 0
    d_banned = 0

    op_senate = senate.dup.chars
    total_r, total_d = count_parties(op_senate)

    i = 0
    loop do
      i = 0 if i == op_senate.length

      senator = op_senate[i]
      if r?(senator)
        if r_bans.positive?
          r_bans -= 1
          op_senate[i] = 'x'
        else
          d_bans += 1
          d_banned += 1
          return 'Radiant' if d_banned > total_d
        end
      elsif d?(senator)
        if d_bans.positive?
          d_bans -= 1
          op_senate[i] = 'x'
        else
          r_bans += 1
          r_banned += 1
          return 'Dire' if r_banned > total_r
        end
      end

      i += 1
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  private

  def count_parties(senate)
    total_r = 0
    total_d = 0

    senate.each do |senator|
      if r?(senator)
        total_r += 1
      else
        total_d += 1
      end
    end

    [total_r, total_d]
  end

  def r?(senator)
    senator.upcase == 'R'
  end

  def d?(senator)
    senator.upcase == 'D'
  end
end
