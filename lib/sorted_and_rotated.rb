# frozen_string_literal: true

# Determine if an array was originally sorted, then rotated.
# https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
class SortedAndRotated
  def check(nums)
    dips = 0
    i = 1
    while i < nums.length
      return false if dips > 1

      dips += 1 if nums[i - 1] > nums[i]
      i += 1
    end

    dips.zero? || (dips == 1 && nums[0] >= nums[-1])
  end
end
