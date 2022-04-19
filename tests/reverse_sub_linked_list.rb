# frozen_string_literal: true

require_relative '../lib/reverse_sub_linked_list'
require 'minitest/autorun'

# Test for ReverseSubLinkedList.
class ReverseSubLinkedListTest < Minitest::Test
  # rubocop:disable Metrics/AbcSize
  def test_reverse_between
    list = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
    reverser = ReverseSubLinkedList.new
    list = reverser.reverse_between(list, 2, 4)
    assert_equal 1, list.val
    assert_equal 4, list.next.val
    assert_equal 3, list.next.next.val
    assert_equal 2, list.next.next.next.val
    assert_equal 5, list.next.next.next.next.val
  end
  # rubocop:enable Metrics/AbcSize
end
