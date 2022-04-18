# frozen_string_literal: true

require_relative '../lib/my_circular_queue'
require 'minitest/autorun'

# Test for MyCircularQueue.
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class MyCircularQueueTest < Minitest::Test
  def test_functions
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    refute queue.en_queue(4)
    assert_equal 3, queue.rear
    assert queue.is_full
    assert queue.de_queue
    assert queue.en_queue(4)
    assert_equal 4, queue.rear
  end

  def test_enqueue
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    refute queue.en_queue(4)
  end

  def test_dequeue
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    assert queue.de_queue
    assert queue.de_queue
    assert queue.de_queue
    refute queue.de_queue
  end

  def test_front
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    assert_equal 1, queue.front
    queue.de_queue
    assert_equal 2, queue.front
    queue.de_queue
    assert_equal 3, queue.front
    queue.de_queue
    assert_equal(-1, queue.front)
  end

  def test_rear
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    assert_equal 3, queue.rear
    queue.de_queue
    assert_equal 3, queue.rear
    queue.de_queue
    assert_equal 3, queue.rear
    queue.de_queue
    assert_equal(-1, queue.rear)
  end

  def test_is_empty
    queue = MyCircularQueue.new(3)
    assert queue.en_queue(1)
    assert queue.en_queue(2)
    assert queue.en_queue(3)
    refute queue.is_empty
    queue.de_queue
    refute queue.is_empty
    queue.de_queue
    refute queue.is_empty
    queue.de_queue
    assert queue.is_empty
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
