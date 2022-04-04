# frozen_string_literal: true

# Determine the sign of the product of an array of integers.
# https://leetcode.com/problems/sign-of-the-product-of-an-array/
class SignOfArrayProduct
  def array_sign(nums)
    negatives = 0

    nums.each do |num|
      return 0 if num.zero?

      negatives += 1 if num.negative?
    end

    if negatives.even?
      1
    else
      -1
    end
  end
end
