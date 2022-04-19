# frozen_string_literal: true

# Reverse a sub list of a singly linked list
# https://leetcode.com/problems/reverse-linked-list-ii/
class ReverseSubLinkedList
  def reverse_between(head, left, right)
    @stop = false
    @left = head
    @head = head

    reverse(head, left, right)

    head
  end

  private

  # rubocop:disable Naming/MethodParameterName
  def reverse(right, m, n)
    return if n == 1

    right = right.next

    @left = @left.next if m > 1

    reverse(right, m - 1, n - 1)

    @stop = true if @left == right || right.next == @left

    return if @stop

    t = @left.val
    @left.val = right.val
    right.val = t
    @left = @left.next
  end
  # rubocop:enable Naming/MethodParameterName
end

# Provided
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end
end
