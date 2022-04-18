# frozen_string_literal: true

# Implementation of a circular queue.
# https://leetcode.com/problems/design-circular-queue/
# rubocop:disable Naming/PredicateName
class MyCircularQueue
  def initialize(size)
    @arr = Array.new(size)
    @front = 0
    @rear = 0
  end

  def en_queue(value)
    return false if !@arr[@rear].nil?

    @arr[@rear] = value
    @rear = next_pointer(@rear)
    true
  end

  def de_queue
    val = @arr[@front]
    return false if val.nil?

    @arr[@front] = nil
    @front = next_pointer(@front)
    true
  end

  def front
    @arr[@front] || -1
  end

  def rear
    val = if @rear <= 0
            @arr[-1]
          else
            @arr[@rear - 1]
          end
    val || -1
  end

  def is_empty
    @front == @rear && !is_full
  end

  def is_full
    !@arr[@rear].nil?
  end

  private

  def next_pointer(pointer)
    if pointer + 1 >= @arr.size
      0
    else
      pointer + 1
    end
  end
end
# rubocop:enable Naming/PredicateName
