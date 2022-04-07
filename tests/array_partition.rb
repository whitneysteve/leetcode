# frozen_string_literal: true

require_relative '../lib/array_partition'
require 'minitest/autorun'

# Test for ArrayPartition.
class ArrayPartitionTest < Minitest::Test
  def test_partition_disjoint
    partitioner = ArrayPartition.new
    # assert_equal 3, partitioner.partition_disjoint([5,0,3,8,6])
    # assert_equal 4, partitioner.partition_disjoint([1,1,1,0,6,12])
    assert_equal 9, partitioner.partition_disjoint([24, 11, 49, 80, 63, 8, 61, 22, 73, 85])
  end
end
