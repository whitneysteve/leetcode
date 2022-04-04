# frozen_string_literal: true

# Find maximum number of ice cream bars you can but with a number of coints
# https://leetcode.com/problems/maximum-ice-cream-bars/
class MaxIceCreamBars
  def max_ice_cream(costs, coins)
    sorted = costs.sort
    bars = 0

    remaining_coins = coins

    while bars < sorted.size
      cost = sorted[bars]
      break if cost > remaining_coins

      bars += 1
      remaining_coins -= cost
    end

    bars
  end
end
