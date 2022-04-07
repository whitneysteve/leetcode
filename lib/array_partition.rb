# frozen_string_literal: true

# Parition an array so that every element in the right is >= than the left.
# https://leetcode.com/problems/partition-array-into-disjoint-intervals/
class ArrayPartition
  # rubocop:disable Metrics/MethodLength
  def partition_disjoint(nums)
    max = nums[0]
    last_max = nums[0]
    partition_point = 0

    i = 1

    while i < nums.size
      if nums[i] < max
        partition_point = i
        max = last_max
      end

      last_max = nums[i] if nums[i] > last_max

      i += 1
    end

    nums[0..partition_point].size
  end
  # rubocop:enable Metrics/MethodLength
end
