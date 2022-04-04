# frozen_string_literal: true

# Divide without using multiplication, division or modulus.
# https://leetcode.com/problems/divide-two-integers/
class Divide
  def divide(dividend, divisor)
    sign = (dividend.negative?) == (divisor.negative?)
    a = dividend.abs
    b = divisor.abs

    res = div(a, b)

    sign ? res : -res
  end

  private

  def div(dividend, divisor)
    res = 0
    while dividend - divisor >= 0
      x = 0
      x += 1 while (dividend - (divisor << x << 1)).positive?
      res += (1 << x)
      dividend -= (divisor << x)
    end
    res
  end
end
